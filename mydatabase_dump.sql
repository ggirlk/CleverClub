--
-- PostgreSQL database dump
--

-- Dumped from database version 13.15 (Debian 13.15-1.pgdg120+1)
-- Dumped by pg_dump version 13.15 (Debian 13.15-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- Name: musicStudio_generatedinstruments; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."musicStudio_generatedinstruments" (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    "generatedMusicID_id" bigint NOT NULL,
    "instrumentID_id" bigint NOT NULL
);


ALTER TABLE public."musicStudio_generatedinstruments" OWNER TO root;

--
-- Name: musicStudio_generatedinstruments_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."musicStudio_generatedinstruments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."musicStudio_generatedinstruments_id_seq" OWNER TO root;

--
-- Name: musicStudio_generatedinstruments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."musicStudio_generatedinstruments_id_seq" OWNED BY public."musicStudio_generatedinstruments".id;


--
-- Name: musicStudio_generatedmusic; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."musicStudio_generatedmusic" (
    id bigint NOT NULL,
    "jsonFilePath" character varying(100) NOT NULL,
    style character varying(30) NOT NULL,
    key character varying(30) NOT NULL,
    tempo integer NOT NULL,
    "timeSignature" character varying(10) NOT NULL,
    feel character varying(100) NOT NULL,
    rythm character varying(30) NOT NULL,
    "maxOffset" numeric(5,3) NOT NULL,
    "fullDurationInSeconds" numeric(5,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    "adminID_id" bigint NOT NULL,
    "userID_id" bigint NOT NULL
);


ALTER TABLE public."musicStudio_generatedmusic" OWNER TO root;

--
-- Name: musicStudio_generatedmusic_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."musicStudio_generatedmusic_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."musicStudio_generatedmusic_id_seq" OWNER TO root;

--
-- Name: musicStudio_generatedmusic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."musicStudio_generatedmusic_id_seq" OWNED BY public."musicStudio_generatedmusic".id;


--
-- Name: musicStudio_intstrument; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."musicStudio_intstrument" (
    id bigint NOT NULL,
    "channelID" integer NOT NULL,
    "fullName" character varying(30) NOT NULL,
    "jsonName" character varying(30) NOT NULL,
    types character varying(30) NOT NULL,
    variable character varying(30) NOT NULL,
    link character varying(200) NOT NULL
);


ALTER TABLE public."musicStudio_intstrument" OWNER TO root;

--
-- Name: musicStudio_intstrument_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."musicStudio_intstrument_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."musicStudio_intstrument_id_seq" OWNER TO root;

--
-- Name: musicStudio_intstrument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."musicStudio_intstrument_id_seq" OWNED BY public."musicStudio_intstrument".id;


--
-- Name: musicStudio_musicsymbols; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."musicStudio_musicsymbols" (
    id bigint NOT NULL,
    symbol character varying(30) NOT NULL,
    "symbolName" character varying(30) NOT NULL,
    "uniCodeHex" character varying(30) NOT NULL,
    "htmlCode" character varying(30) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."musicStudio_musicsymbols" OWNER TO root;

--
-- Name: musicStudio_musicsymbols_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."musicStudio_musicsymbols_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."musicStudio_musicsymbols_id_seq" OWNER TO root;

--
-- Name: musicStudio_musicsymbols_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."musicStudio_musicsymbols_id_seq" OWNED BY public."musicStudio_musicsymbols".id;


--
-- Name: musicStudio_studio; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."musicStudio_studio" (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."musicStudio_studio" OWNER TO root;

--
-- Name: musicStudio_studio_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."musicStudio_studio_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."musicStudio_studio_id_seq" OWNER TO root;

--
-- Name: musicStudio_studio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."musicStudio_studio_id_seq" OWNED BY public."musicStudio_studio".id;


--
-- Name: sections_category; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sections_category (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_published boolean NOT NULL,
    admin_id bigint NOT NULL,
    section_id bigint NOT NULL
);


ALTER TABLE public.sections_category OWNER TO root;

--
-- Name: sections_category_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sections_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_category_id_seq OWNER TO root;

--
-- Name: sections_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sections_category_id_seq OWNED BY public.sections_category.id;


--
-- Name: sections_content; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sections_content (
    id bigint NOT NULL,
    title character varying(30) NOT NULL,
    "contentType" character varying(30) NOT NULL,
    "contentFile" character varying(30) NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    level character varying(30) NOT NULL,
    text text,
    is_published boolean NOT NULL,
    admin_id bigint NOT NULL,
    category_id bigint NOT NULL,
    pictures_id bigint,
    section_id bigint NOT NULL
);


ALTER TABLE public.sections_content OWNER TO root;

--
-- Name: sections_content_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sections_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_content_id_seq OWNER TO root;

--
-- Name: sections_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sections_content_id_seq OWNED BY public.sections_content.id;


--
-- Name: sections_enrolments; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sections_enrolments (
    id bigint NOT NULL,
    enrolled_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    content_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.sections_enrolments OWNER TO root;

--
-- Name: sections_enrolments_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sections_enrolments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_enrolments_id_seq OWNER TO root;

--
-- Name: sections_enrolments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sections_enrolments_id_seq OWNED BY public.sections_enrolments.id;


--
-- Name: sections_exercicechoices; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sections_exercicechoices (
    id bigint NOT NULL,
    choice character varying(512) NOT NULL,
    answer character varying(512) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.sections_exercicechoices OWNER TO root;

--
-- Name: sections_exercicechoices_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sections_exercicechoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_exercicechoices_id_seq OWNER TO root;

--
-- Name: sections_exercicechoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sections_exercicechoices_id_seq OWNED BY public.sections_exercicechoices.id;


--
-- Name: sections_exercices; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sections_exercices (
    id bigint NOT NULL,
    level character varying(30) NOT NULL,
    answer character varying(2048) NOT NULL,
    is_published boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    admin_id bigint NOT NULL,
    category_id bigint,
    choices_id bigint,
    content_id bigint,
    pictures_id bigint,
    section_id bigint NOT NULL
);


ALTER TABLE public.sections_exercices OWNER TO root;

--
-- Name: sections_exercices_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sections_exercices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_exercices_id_seq OWNER TO root;

--
-- Name: sections_exercices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sections_exercices_id_seq OWNED BY public.sections_exercices.id;


--
-- Name: sections_pictures; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sections_pictures (
    id bigint NOT NULL,
    title character varying(30) NOT NULL,
    "pictureType" character varying(100) NOT NULL,
    picture character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.sections_pictures OWNER TO root;

--
-- Name: sections_pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sections_pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_pictures_id_seq OWNER TO root;

--
-- Name: sections_pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sections_pictures_id_seq OWNED BY public.sections_pictures.id;


--
-- Name: sections_section; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sections_section (
    id bigint NOT NULL,
    title character varying(30) NOT NULL,
    picture character varying(100) NOT NULL,
    "tagId" character varying(30) NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_published boolean NOT NULL,
    admin_id bigint NOT NULL
);


ALTER TABLE public.sections_section OWNER TO root;

--
-- Name: sections_section_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sections_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_section_id_seq OWNER TO root;

--
-- Name: sections_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sections_section_id_seq OWNED BY public.sections_section.id;


--
-- Name: sections_userexcercicegrade; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sections_userexcercicegrade (
    id bigint NOT NULL,
    trial integer NOT NULL,
    grade numeric(3,3) NOT NULL,
    exercice_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.sections_userexcercicegrade OWNER TO root;

--
-- Name: sections_userexcercicegrade_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sections_userexcercicegrade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_userexcercicegrade_id_seq OWNER TO root;

--
-- Name: sections_userexcercicegrade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sections_userexcercicegrade_id_seq OWNED BY public.sections_userexcercicegrade.id;


--
-- Name: sections_userprogress; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sections_userprogress (
    id bigint NOT NULL,
    page character varying(30) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id bigint NOT NULL,
    content_id bigint NOT NULL,
    section_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.sections_userprogress OWNER TO root;

--
-- Name: sections_userprogress_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sections_userprogress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_userprogress_id_seq OWNER TO root;

--
-- Name: sections_userprogress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sections_userprogress_id_seq OWNED BY public.sections_userprogress.id;


--
-- Name: user_customuser; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    role character varying(30),
    birthday date,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.user_customuser OWNER TO root;

--
-- Name: user_customuser_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_customuser_groups OWNER TO root;

--
-- Name: user_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_customuser_groups_id_seq OWNER TO root;

--
-- Name: user_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_customuser_groups_id_seq OWNED BY public.user_customuser_groups.id;


--
-- Name: user_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_customuser_id_seq OWNER TO root;

--
-- Name: user_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_customuser_id_seq OWNED BY public.user_customuser.id;


--
-- Name: user_customuser_user_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_customuser_user_permissions OWNER TO root;

--
-- Name: user_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_customuser_user_permissions_id_seq OWNER TO root;

--
-- Name: user_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_customuser_user_permissions_id_seq OWNED BY public.user_customuser_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: musicStudio_generatedinstruments id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_generatedinstruments" ALTER COLUMN id SET DEFAULT nextval('public."musicStudio_generatedinstruments_id_seq"'::regclass);


--
-- Name: musicStudio_generatedmusic id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_generatedmusic" ALTER COLUMN id SET DEFAULT nextval('public."musicStudio_generatedmusic_id_seq"'::regclass);


--
-- Name: musicStudio_intstrument id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_intstrument" ALTER COLUMN id SET DEFAULT nextval('public."musicStudio_intstrument_id_seq"'::regclass);


--
-- Name: musicStudio_musicsymbols id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_musicsymbols" ALTER COLUMN id SET DEFAULT nextval('public."musicStudio_musicsymbols_id_seq"'::regclass);


--
-- Name: musicStudio_studio id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_studio" ALTER COLUMN id SET DEFAULT nextval('public."musicStudio_studio_id_seq"'::regclass);


--
-- Name: sections_category id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_category ALTER COLUMN id SET DEFAULT nextval('public.sections_category_id_seq'::regclass);


--
-- Name: sections_content id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_content ALTER COLUMN id SET DEFAULT nextval('public.sections_content_id_seq'::regclass);


--
-- Name: sections_enrolments id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_enrolments ALTER COLUMN id SET DEFAULT nextval('public.sections_enrolments_id_seq'::regclass);


--
-- Name: sections_exercicechoices id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_exercicechoices ALTER COLUMN id SET DEFAULT nextval('public.sections_exercicechoices_id_seq'::regclass);


--
-- Name: sections_exercices id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_exercices ALTER COLUMN id SET DEFAULT nextval('public.sections_exercices_id_seq'::regclass);


--
-- Name: sections_pictures id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_pictures ALTER COLUMN id SET DEFAULT nextval('public.sections_pictures_id_seq'::regclass);


--
-- Name: sections_section id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_section ALTER COLUMN id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);


--
-- Name: sections_userexcercicegrade id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_userexcercicegrade ALTER COLUMN id SET DEFAULT nextval('public.sections_userexcercicegrade_id_seq'::regclass);


--
-- Name: sections_userprogress id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_userprogress ALTER COLUMN id SET DEFAULT nextval('public.sections_userprogress_id_seq'::regclass);


--
-- Name: user_customuser id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser ALTER COLUMN id SET DEFAULT nextval('public.user_customuser_id_seq'::regclass);


--
-- Name: user_customuser_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.user_customuser_groups_id_seq'::regclass);


--
-- Name: user_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_customuser_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add custom user	6	add_customuser
22	Can change custom user	6	change_customuser
23	Can delete custom user	6	delete_customuser
24	Can view custom user	6	view_customuser
25	Can add generated instruments	7	add_generatedinstruments
26	Can change generated instruments	7	change_generatedinstruments
27	Can delete generated instruments	7	delete_generatedinstruments
28	Can view generated instruments	7	view_generatedinstruments
29	Can add generated music	8	add_generatedmusic
30	Can change generated music	8	change_generatedmusic
31	Can delete generated music	8	delete_generatedmusic
32	Can view generated music	8	view_generatedmusic
33	Can add intstrument	9	add_intstrument
34	Can change intstrument	9	change_intstrument
35	Can delete intstrument	9	delete_intstrument
36	Can view intstrument	9	view_intstrument
37	Can add music symbols	10	add_musicsymbols
38	Can change music symbols	10	change_musicsymbols
39	Can delete music symbols	10	delete_musicsymbols
40	Can view music symbols	10	view_musicsymbols
41	Can add studio	11	add_studio
42	Can change studio	11	change_studio
43	Can delete studio	11	delete_studio
44	Can view studio	11	view_studio
45	Can add category	12	add_category
46	Can change category	12	change_category
47	Can delete category	12	delete_category
48	Can view category	12	view_category
49	Can add content	13	add_content
50	Can change content	13	change_content
51	Can delete content	13	delete_content
52	Can view content	13	view_content
53	Can add enrolments	14	add_enrolments
54	Can change enrolments	14	change_enrolments
55	Can delete enrolments	14	delete_enrolments
56	Can view enrolments	14	view_enrolments
57	Can add exercice choices	15	add_exercicechoices
58	Can change exercice choices	15	change_exercicechoices
59	Can delete exercice choices	15	delete_exercicechoices
60	Can view exercice choices	15	view_exercicechoices
61	Can add exercices	16	add_exercices
62	Can change exercices	16	change_exercices
63	Can delete exercices	16	delete_exercices
64	Can view exercices	16	view_exercices
65	Can add pictures	17	add_pictures
66	Can change pictures	17	change_pictures
67	Can delete pictures	17	delete_pictures
68	Can view pictures	17	view_pictures
69	Can add section	18	add_section
70	Can change section	18	change_section
71	Can delete section	18	delete_section
72	Can view section	18	view_section
73	Can add user excercice grade	19	add_userexcercicegrade
74	Can change user excercice grade	19	change_userexcercicegrade
75	Can delete user excercice grade	19	delete_userexcercicegrade
76	Can view user excercice grade	19	view_userexcercicegrade
77	Can add user progress	20	add_userprogress
78	Can change user progress	20	change_userprogress
79	Can delete user progress	20	delete_userprogress
80	Can view user progress	20	view_userprogress
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-07-14 21:32:03.645489+00	1	Music Section, 2024-07-14 21:32:03.643292+00:00	1	[{"added": {}}]	18	1
2	2024-07-14 21:35:16.870286+00	2	Computing Section, 2024-07-14 21:35:16.869753+00:00	1	[{"added": {}}]	18	1
3	2024-07-14 21:50:45.476379+00	3	Maths Section, 2024-07-14 21:50:45.475670+00:00	1	[{"added": {}}]	18	1
4	2024-07-14 21:52:31.541041+00	4	Languages Section, 2024-07-14 21:52:31.540176+00:00	1	[{"added": {}}]	18	1
5	2024-07-14 21:54:25.964292+00	5	Physics Section, 2024-07-14 21:54:25.963483+00:00	1	[{"added": {}}]	18	1
6	2024-07-14 22:00:55.182686+00	6	Chemistry Section, 2024-07-14 22:00:55.182147+00:00	1	[{"added": {}}]	18	1
7	2024-07-14 22:10:46.979748+00	7	Technology Section, 2024-07-14 22:10:46.978778+00:00	1	[{"added": {}}]	18	1
8	2024-07-14 22:12:22.086354+00	8	Biology Section, 2024-07-14 22:12:22.084566+00:00	1	[{"added": {}}]	18	1
9	2024-07-14 22:14:21.984054+00	9	Drawing Section, 2024-07-14 22:14:21.983134+00:00	1	[{"added": {}}]	18	1
10	2024-07-14 22:15:22.870184+00	10	Stories Section, 2024-07-14 22:15:22.869666+00:00	1	[{"added": {}}]	18	1
11	2024-07-14 22:16:51.754324+00	11	Manga Section, 2024-07-14 22:16:51.753100+00:00	1	[{"added": {}}]	18	1
12	2024-07-14 22:18:27.75617+00	12	Puzzles Section, 2024-07-14 22:18:27.752993+00:00	1	[{"added": {}}]	18	1
13	2024-07-14 22:21:49.111525+00	1	Music Section, 2024-07-14 22:21:49.110891+00:00	2	[{"changed": {"fields": ["Description"]}}]	18	1
14	2024-07-14 23:21:54.58869+00	13	Subatomic Adventures, 2024-07-14 23:21:54.587080+00:00	1	[{"added": {}}]	18	1
15	2024-07-14 23:37:08.11379+00	13	Subatomic Adventures, 2024-07-14 23:37:08.113140+00:00	2	[{"changed": {"fields": ["Picture"]}}]	18	1
16	2024-07-14 23:47:28.130906+00	1	History Harmony ,2024-07-14 23:47:28.128358+00:00	1	[{"added": {}}]	12	1
17	2024-07-14 23:48:19.943882+00	2	Code Crusaders of the Past ,2024-07-14 23:48:19.943122+00:00	1	[{"added": {}}]	12	1
18	2024-07-14 23:49:27.606591+00	3	Quantum Pioneers ,2024-07-14 23:49:27.606046+00:00	1	[{"added": {}}]	12	1
19	2024-07-14 23:49:53.881241+00	4	Alchemy to Atoms: ,2024-07-14 23:49:53.880829+00:00	1	[{"added": {}}]	12	1
20	2024-07-14 23:50:20.210113+00	5	Inventions that Changed the Wo ,2024-07-14 23:50:20.209486+00:00	1	[{"added": {}}]	12	1
21	2024-07-14 23:50:43.944657+00	6	Unraveling Life's Mysteries ,2024-07-14 23:50:43.943935+00:00	1	[{"added": {}}]	12	1
22	2024-07-14 23:51:47.71377+00	7	Art Through the Ages ,2024-07-14 23:51:47.713295+00:00	1	[{"added": {}}]	12	1
23	2024-07-14 23:53:28.467326+00	8	Tales as Old as Time: ,2024-07-14 23:53:28.466592+00:00	1	[{"added": {}}]	12	1
24	2024-07-14 23:53:56.008909+00	9	Alchemy to Atoms ,2024-07-14 23:53:56.008229+00:00	1	[{"added": {}}]	12	1
25	2024-07-14 23:55:42.596024+00	10	Inventions that Changed the World ,2024-07-14 23:55:42.595054+00:00	1	[{"added": {}}]	12	1
26	2024-07-14 23:56:24.266076+00	11	Unraveling Life's Mysteries ,2024-07-14 23:56:24.265483+00:00	1	[{"added": {}}]	12	1
27	2024-07-14 23:58:01.01412+00	5	Inventions that Changed the Wo ,2024-07-14 23:50:20.209486+00:00	3		12	1
28	2024-07-14 23:58:17.674091+00	11	Unraveling Life's Mysteries ,2024-07-14 23:56:24.265483+00:00	3		12	1
29	2024-07-14 23:59:31.24633+00	12	From Scrolls to Screens ,2024-07-14 23:59:31.245796+00:00	1	[{"added": {}}]	12	1
30	2024-07-15 00:00:15.546691+00	13	Brain Teasers Through Time ,2024-07-15 00:00:15.546000+00:00	1	[{"added": {}}]	12	1
31	2024-07-15 00:09:52.934654+00	14	Genre Journeys ,2024-07-15 00:09:52.934050+00:00	1	[{"added": {}}]	12	1
32	2024-07-15 00:10:34.500566+00	15	Harmony Heroes ,2024-07-15 00:10:34.499713+00:00	1	[{"added": {}}]	12	1
33	2024-07-15 00:11:48.567849+00	16	Melody Makers ,2024-07-15 00:11:48.567313+00:00	1	[{"added": {}}]	12	1
34	2024-07-15 00:12:16.778608+00	17	Rhythm Explorers ,2024-07-15 00:12:16.777856+00:00	1	[{"added": {}}]	12	1
35	2024-07-15 00:12:40.852701+00	18	Coding Crusaders ,2024-07-15 00:12:40.851045+00:00	1	[{"added": {}}]	12	1
36	2024-07-15 00:13:23.419229+00	19	Web Wizards ,2024-07-15 00:13:23.417764+00:00	1	[{"added": {}}]	12	1
37	2024-07-15 00:13:49.948376+00	20	App Architects ,2024-07-15 00:13:49.947744+00:00	1	[{"added": {}}]	12	1
38	2024-07-15 00:16:05.214452+00	21	Game Developers ,2024-07-15 00:16:05.213848+00:00	1	[{"added": {}}]	12	1
39	2024-07-15 00:16:50.13518+00	22	Particle Playground ,2024-07-15 00:16:50.134416+00:00	1	[{"added": {}}]	12	1
40	2024-07-15 00:17:05.763948+00	23	Quantum Quests ,2024-07-15 00:17:05.763437+00:00	1	[{"added": {}}]	12	1
41	2024-07-15 00:18:01.754201+00	24	Quantum Creators ,2024-07-15 00:18:01.751552+00:00	1	[{"added": {}}]	12	1
42	2024-07-15 00:19:37.415866+00	25	Element Explorers ,2024-07-15 00:19:37.415194+00:00	1	[{"added": {}}]	12	1
43	2024-07-15 00:20:03.573165+00	26	Reaction Revolution ,2024-07-15 00:20:03.572602+00:00	1	[{"added": {}}]	12	1
44	2024-07-15 00:21:30.312163+00	27	Material Masters ,2024-07-15 00:21:30.311545+00:00	1	[{"added": {}}]	12	1
45	2024-07-15 00:22:07.945394+00	28	Robotics Revolution ,2024-07-15 00:22:07.944720+00:00	1	[{"added": {}}]	12	1
46	2024-07-15 00:23:12.257263+00	29	Gadget Guru ,2024-07-15 00:23:12.256725+00:00	1	[{"added": {}}]	12	1
47	2024-07-15 00:23:40.98775+00	30	Future Frontiers ,2024-07-15 00:23:40.986952+00:00	1	[{"added": {}}]	12	1
48	2024-07-15 00:24:34.574927+00	31	Creature Kingdom ,2024-07-15 00:24:34.574223+00:00	1	[{"added": {}}]	12	1
49	2024-07-15 00:25:05.347371+00	32	Human Body Explorers: ,2024-07-15 00:25:05.345818+00:00	1	[{"added": {}}]	12	1
50	2024-07-15 00:25:32.920284+00	33	Genetics Geniuses ,2024-07-15 00:25:32.919380+00:00	1	[{"added": {}}]	12	1
51	2024-07-15 00:26:38.061825+00	34	Coloring Crusaders ,2024-07-15 00:26:38.061061+00:00	1	[{"added": {}}]	12	1
52	2024-07-15 00:28:01.061991+00	35	Sketchbook Squad ,2024-07-15 00:28:01.060536+00:00	1	[{"added": {}}]	12	1
53	2024-07-15 00:28:51.85963+00	36	Doodle Den ,2024-07-15 00:28:51.859085+00:00	1	[{"added": {}}]	12	1
54	2024-07-15 00:30:09.211872+00	37	Fairy Tale Forest ,2024-07-15 00:30:09.210885+00:00	1	[{"added": {}}]	12	1
55	2024-07-15 00:30:43.47364+00	38	Adventure Alley ,2024-07-15 00:30:43.473073+00:00	1	[{"added": {}}]	12	1
56	2024-07-15 00:31:09.429517+00	39	Mystery Mansion ,2024-07-15 00:31:09.429060+00:00	1	[{"added": {}}]	12	1
57	2024-07-15 00:31:50.544149+00	40	Manga Masters ,2024-07-15 00:31:50.543099+00:00	1	[{"added": {}}]	12	1
58	2024-07-15 00:32:25.18336+00	41	Manga Makers ,2024-07-15 00:32:25.181633+00:00	1	[{"added": {}}]	12	1
59	2024-07-15 00:33:06.5896+00	42	Logic Labyrinth ,2024-07-15 00:33:06.588561+00:00	1	[{"added": {}}]	12	1
60	2024-07-15 00:33:39.218537+00	43	Math Mania ,2024-07-15 00:33:39.217854+00:00	1	[{"added": {}}]	12	1
61	2024-07-15 00:34:39.174713+00	44	Word Wizardry ,2024-07-15 00:34:39.174123+00:00	1	[{"added": {}}]	12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	user	customuser
7	musicStudio	generatedinstruments
8	musicStudio	generatedmusic
9	musicStudio	intstrument
10	musicStudio	musicsymbols
11	musicStudio	studio
12	sections	category
13	sections	content
14	sections	enrolments
15	sections	exercicechoices
16	sections	exercices
17	sections	pictures
18	sections	section
19	sections	userexcercicegrade
20	sections	userprogress
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-07-14 03:45:02.688833+00
2	contenttypes	0002_remove_content_type_name	2024-07-14 03:45:02.695615+00
3	auth	0001_initial	2024-07-14 03:45:02.746077+00
4	auth	0002_alter_permission_name_max_length	2024-07-14 03:45:02.750235+00
5	auth	0003_alter_user_email_max_length	2024-07-14 03:45:02.754047+00
6	auth	0004_alter_user_username_opts	2024-07-14 03:45:02.758075+00
7	auth	0005_alter_user_last_login_null	2024-07-14 03:45:02.762466+00
8	auth	0006_require_contenttypes_0002	2024-07-14 03:45:02.764579+00
9	auth	0007_alter_validators_add_error_messages	2024-07-14 03:45:02.76965+00
10	auth	0008_alter_user_username_max_length	2024-07-14 03:45:02.773488+00
11	auth	0009_alter_user_last_name_max_length	2024-07-14 03:45:02.777709+00
12	auth	0010_alter_group_name_max_length	2024-07-14 03:45:02.783083+00
13	auth	0011_update_proxy_permissions	2024-07-14 03:45:02.787443+00
14	auth	0012_alter_user_first_name_max_length	2024-07-14 03:45:02.791155+00
15	user	0001_initial	2024-07-14 03:45:02.837691+00
16	admin	0001_initial	2024-07-14 03:45:02.865338+00
17	admin	0002_logentry_remove_auto_add	2024-07-14 03:45:02.873794+00
18	admin	0003_logentry_add_action_flag_choices	2024-07-14 03:45:02.880456+00
19	musicStudio	0001_initial	2024-07-14 03:45:02.906444+00
20	musicStudio	0002_initial	2024-07-14 03:45:02.947268+00
21	sections	0001_initial	2024-07-14 03:45:03.013312+00
22	sections	0002_initial	2024-07-14 03:45:03.274862+00
23	sections	0003_alter_exercices_category	2024-07-14 03:45:03.297664+00
24	sections	0004_alter_category_picture_alter_pictures_picture_and_more	2024-07-14 03:45:03.3231+00
25	sections	0005_alter_content_contenttype_alter_content_is_published	2024-07-14 03:45:03.340786+00
26	sessions	0001_initial	2024-07-14 03:45:03.359258+00
27	user	0002_customuser_date_joined	2024-07-14 03:45:03.370298+00
28	user	0003_remove_customuser_date_joined_and_more	2024-07-14 03:45:03.413693+00
29	user	0004_alter_customuser_role	2024-07-14 03:45:03.425242+00
30	sections	0006_remove_category_level	2024-07-14 23:43:44.560475+00
31	sections	0007_remove_category_picture	2024-07-14 23:44:36.945834+00
32	sections	0008_remove_category_tagid	2024-07-14 23:46:56.61473+00
33	sections	0009_alter_category_title	2024-07-14 23:54:58.149147+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
3mz8qr1bfimenx3q337hg0ty27zf5igp	.eJxVjEEOgjAQRe_StWkoLdPBpXvPQGY6g6CmTSisjHdXEha6_e-9_zIDbes0bFWXYRZzNs6cfjem9NC8A7lTvhWbSl6Xme2u2INWey2iz8vh_h1MVKdvrSE0PRD1XVLyAD4iSWAcJQAgso89E3aYfBqJPUt0DcDI2sYWxTnz_gDqQjgS:1sSqBl:30RfljShbbzVdLDSEl5C7oEXJP55gUPVOavP8MaanLo	2024-07-28 03:46:17.921185+00
env90g8g3n9moyfdfygtntytr90cq9vn	.eJxVjM0OwiAQhN-FsyHCWn48eu8zkF0WpGogKe3J-O62SQ96mmS-b-YtAq5LCWtPc5hYXIUSp9-OMD5T3QE_sN6bjK0u80RyV-RBuxwbp9ftcP8OCvayrdGDouxhCwSnGXy8ABNZ60BFrSFqdHngc8rJUcpkMtk4sDPGe-1BfL7jtjgZ:1sT2cn:IKJZoHM7ajm-hXnPOOJ02OHTglphmKu5546H_BAASP0	2024-07-28 17:03:01.614532+00
\.


--
-- Data for Name: musicStudio_generatedinstruments; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."musicStudio_generatedinstruments" (id, created_at, updated_at, "generatedMusicID_id", "instrumentID_id") FROM stdin;
\.


--
-- Data for Name: musicStudio_generatedmusic; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."musicStudio_generatedmusic" (id, "jsonFilePath", style, key, tempo, "timeSignature", feel, rythm, "maxOffset", "fullDurationInSeconds", created_at, updated_at, "adminID_id", "userID_id") FROM stdin;
\.


--
-- Data for Name: musicStudio_intstrument; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."musicStudio_intstrument" (id, "channelID", "fullName", "jsonName", types, variable, link) FROM stdin;
\.


--
-- Data for Name: musicStudio_musicsymbols; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."musicStudio_musicsymbols" (id, symbol, "symbolName", "uniCodeHex", "htmlCode", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: musicStudio_studio; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."musicStudio_studio" (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sections_category; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sections_category (id, title, description, created_at, updated_at, is_published, admin_id, section_id) FROM stdin;
1	History Harmony	Journey through time and discover the origins of music! From ancient flutes and drums to the invention of the piano, explore how music has evolved across cultures and centuries. Meet legendary composers like Mozart and Beethoven, and learn how their music shaped the world.	2024-07-14 23:47:28.128347+00	2024-07-14 23:47:28.128358+00	f	1	1
2	Code Crusaders of the Past	Uncover the fascinating history of computing! From the first mechanical calculators to the birth of the internet, trace the evolution of technology that changed the world. Meet brilliant minds like Ada Lovelace, Alan Turing, and Steve Jobs, and learn how their innovations paved the way for the digital age.	2024-07-14 23:48:19.943107+00	2024-07-14 23:48:19.943122+00	f	1	2
3	Quantum Pioneers	Delve into the mind-bending world of quantum mechanics! Explore the groundbreaking experiments of Max Planck, Albert Einstein, and Niels Bohr that revolutionized our understanding of the universe. Discover how their discoveries led to the development of lasers, transistors, and even quantum computers.	2024-07-14 23:49:27.606033+00	2024-07-14 23:49:27.606046+00	f	1	13
4	Alchemy to Atoms:	Embark on a journey through the history of chemistry! From ancient alchemists searching for the elixir of life to the discovery of the periodic table, explore the fascinating evolution of this scientific field. Meet influential chemists like Marie Curie, Dmitri Mendeleev, and Linus Pauling, and learn about their groundbreaking discoveries.	2024-07-14 23:49:53.880817+00	2024-07-14 23:49:53.880829+00	f	1	6
6	Unraveling Life's Mysteries	Explore the fascinating history of biology! From ancient Greek philosophers pondering the nature of life to the discovery of DNA, trace the evolution of our understanding of living organisms. Meet pioneering biologists like Charles Darwin, Gregor Mendel, and Rachel Carson, and learn about their groundbreaking contributions.	2024-07-14 23:50:43.943924+00	2024-07-14 23:50:43.943935+00	f	1	8
7	Art Through the Ages	Journey through the history of art! From cave paintings and ancient sculptures to Renaissance masterpieces and modern art movements, explore the diverse styles and techniques that have shaped the world of visual art. Meet legendary artists like Leonardo da Vinci, Michelangelo, and Frida Kahlo, and learn about their unique visions.	2024-07-14 23:51:47.713284+00	2024-07-14 23:51:47.713295+00	f	1	9
8	Tales as Old as Time:	Discover the rich history of storytelling! From ancient myths and folktales to classic novels and modern literature, explore the enduring power of stories to entertain, educate, and inspire. Meet beloved authors like Homer, Shakespeare, Jane Austen, and J.K. Rowling, and learn about their timeless creations.	2024-07-14 23:53:28.466578+00	2024-07-14 23:53:28.466592+00	f	1	10
9	Alchemy to Atoms	Embark on a journey through the history of chemistry! From ancient alchemists searching for the elixir of life to the discovery of the periodic table, explore the fascinating evolution of this scientific field. Meet influential chemists like Marie Curie, Dmitri Mendeleev, and Linus Pauling, and learn about their groundbreaking discoveries.	2024-07-14 23:53:56.008217+00	2024-07-14 23:53:56.008229+00	f	1	6
10	Inventions that Changed the World	Travel through time and witness the birth of incredible inventions! From the printing press and the telephone to the airplane and the internet, explore how technology has transformed our lives. Meet visionary inventors like Thomas Edison, Alexander Graham Bell, and the Wright brothers, and learn about their groundbreaking creations.	2024-07-14 23:55:42.595025+00	2024-07-14 23:55:42.595054+00	f	1	7
12	From Scrolls to Screens	Explore the captivating history of manga! From its roots in Japanese woodblock prints and scrolls to its rise as a global phenomenon, trace the evolution of this unique art form. Meet influential manga artists like Osamu Tezuka, Hayao Miyazaki, and Akira Toriyama, and learn about their iconic characters and stories.	2024-07-14 23:59:31.245782+00	2024-07-14 23:59:31.245796+00	f	1	11
13	Brain Teasers Through Time	Challenge your mind with puzzles from across history! From ancient riddles and logic problems to modern Sudoku and crosswords, explore the enduring fascination with brain-bending challenges. Discover the origins of popular puzzle types and learn about the brilliant minds who devised them.	2024-07-15 00:00:15.545989+00	2024-07-15 00:00:15.546+00	f	1	12
14	Genre Journeys	Explore the diverse world of music genres – from rock and pop to classical and jazz.	2024-07-15 00:09:52.934038+00	2024-07-15 00:09:52.93405+00	f	1	1
15	Harmony Heroes	Dive into the world of chords and harmonies. Learn how different notes work together to create beautiful sounds.	2024-07-15 00:10:34.499699+00	2024-07-15 00:10:34.499713+00	f	1	1
16	Melody Makers	Discover the magic of melodies! Learn to play simple tunes on instruments, write your own songs by the assistant of AI, and explore different musical scales.	2024-07-15 00:11:48.567301+00	2024-07-15 00:11:48.567313+00	f	1	1
17	Rhythm Explorers	Learn the building blocks of music – beats, rhythms, and grooves. Clap along, tap your feet, and create your own funky rhythms!	2024-07-15 00:12:16.777845+00	2024-07-15 00:12:16.777856+00	f	1	1
18	Coding Crusaders	Learn the basics of programming with fun, interactive coding games and challenges. Build your own games, animations, and interactive stories!	2024-07-15 00:12:40.851015+00	2024-07-15 00:12:40.851045+00	f	1	2
19	Web Wizards	Design and build your own websites! Learn HTML, CSS, and other web development tools to create awesome online experiences.	2024-07-15 00:13:23.417733+00	2024-07-15 00:13:23.417764+00	f	1	2
20	App Architects	Dive into the world of mobile app development. Learn to design and build your own apps for smartphones and tablets.	2024-07-15 00:13:49.947728+00	2024-07-15 00:13:49.947744+00	f	1	2
21	Game Developers	Unleash your creativity and build your own video games! Learn game design principles, programming languages, and game development tools.	2024-07-15 00:16:05.213837+00	2024-07-15 00:16:05.213848+00	f	1	2
22	Particle Playground	Meet the tiny building blocks of the universe – quarks, electrons, and photons. Explore their strange and wonderful properties.	2024-07-15 00:16:50.134401+00	2024-07-15 00:16:50.134416+00	f	1	13
23	Quantum Quests	Embark on exciting quests to solve quantum puzzles and unravel the mysteries of superposition, entanglement, and quantum tunneling.	2024-07-15 00:17:05.763426+00	2024-07-15 00:17:05.763437+00	f	1	13
24	Quantum Creators	Build your own quantum circuits! Learn about the principles of quantum computing and experiment with quantum algorithms.	2024-07-15 00:18:01.751509+00	2024-07-15 00:18:01.751552+00	f	1	13
25	Element Explorers	Discover the periodic table and learn about the properties of different elements. Conduct virtual experiments and create your own chemical compounds.	2024-07-15 00:19:37.415183+00	2024-07-15 00:19:37.415194+00	f	1	6
26	Reaction Revolution	Explore the fascinating world of chemical reactions. Learn about acids and bases, oxidation and reduction, and other chemical processes.	2024-07-15 00:20:03.572588+00	2024-07-15 00:20:03.572602+00	f	1	6
27	Material Masters	Investigate the properties of different materials – from metals and plastics to ceramics and composites.	2024-07-15 00:21:30.31153+00	2024-07-15 00:21:30.311545+00	f	1	6
28	Robotics Revolution	Build and program your own robots! Learn about sensors, actuators, and artificial intelligence.	2024-07-15 00:22:07.944705+00	2024-07-15 00:22:07.94472+00	f	1	7
29	Gadget Guru	Explore the latest gadgets and technologies – from smartphones and smartwatches to drones and virtual reality headsets.	2024-07-15 00:23:12.256714+00	2024-07-15 00:23:12.256725+00	f	1	7
30	Future Frontiers	Discover the cutting-edge technologies shaping our world – artificial intelligence, biotechnology, and nanotechnology.	2024-07-15 00:23:40.986941+00	2024-07-15 00:23:40.986952+00	f	1	7
31	Creature Kingdom	Explore the diversity of life on Earth! Learn about different animal groups, plant life, and ecosystems.	2024-07-15 00:24:34.574207+00	2024-07-15 00:24:34.574223+00	f	1	8
32	Human Body Explorers:	Journey through the amazing human body! Discover how our organs, systems, and cells work together.	2024-07-15 00:25:05.345787+00	2024-07-15 00:25:05.345818+00	f	1	8
33	Genetics Geniuses	Unravel the secrets of DNA and heredity. Learn about genes, mutations, and the science of inheritance.	2024-07-15 00:25:32.91937+00	2024-07-15 00:25:32.91938+00	f	1	8
34	Coloring Crusaders	Explore the world of color theory and experiment with different coloring techniques.	2024-07-15 00:26:38.061045+00	2024-07-15 00:26:38.061061+00	f	1	9
35	Sketchbook Squad	Learn the fundamentals of sketching – perspective, shading, and composition.	2024-07-15 00:28:01.060489+00	2024-07-15 00:28:01.060536+00	f	1	9
36	Doodle Den	Unleash your creativity with freehand drawing exercises and fun doodling prompts.	2024-07-15 00:28:51.859071+00	2024-07-15 00:28:51.859085+00	f	1	9
37	Fairy Tale Forest	Dive into classic fairy tales and folktales from around the world.	2024-07-15 00:30:09.210865+00	2024-07-15 00:30:09.210885+00	f	1	10
38	Adventure Alley	Embark on thrilling adventures with brave heroes, daring explorers, and fantastical creatures.	2024-07-15 00:30:43.473058+00	2024-07-15 00:30:43.473073+00	f	1	10
39	Mystery Mansion	Solve intriguing mysteries and unravel puzzling clues.	2024-07-15 00:31:09.429049+00	2024-07-15 00:31:09.42906+00	f	1	10
40	Manga Masters	Learn the art of manga drawing – character design, paneling, and storytelling techniques.	2024-07-15 00:31:50.543081+00	2024-07-15 00:31:50.543099+00	f	1	11
41	Manga Makers	Create your own manga stories! Develop your characters, plot your storylines, and bring your imagination to life.	2024-07-15 00:32:25.18162+00	2024-07-15 00:32:25.181633+00	f	1	11
42	Logic Labyrinth	Challenge your brain with logic puzzles, riddles, and brain teasers.	2024-07-15 00:33:06.588546+00	2024-07-15 00:33:06.588561+00	f	1	12
43	Math Mania	Solve math problems in a fun and engaging way.	2024-07-15 00:33:39.217839+00	2024-07-15 00:33:39.217854+00	f	1	12
44	Word Wizardry	Test your vocabulary and spelling skills with word games and puzzles.	2024-07-15 00:34:39.174109+00	2024-07-15 00:34:39.174123+00	f	1	12
\.


--
-- Data for Name: sections_content; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sections_content (id, title, "contentType", "contentFile", description, created_at, updated_at, level, text, is_published, admin_id, category_id, pictures_id, section_id) FROM stdin;
\.


--
-- Data for Name: sections_enrolments; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sections_enrolments (id, enrolled_at, created_at, updated_at, content_id, user_id) FROM stdin;
\.


--
-- Data for Name: sections_exercicechoices; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sections_exercicechoices (id, choice, answer, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sections_exercices; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sections_exercices (id, level, answer, is_published, created_at, updated_at, admin_id, category_id, choices_id, content_id, pictures_id, section_id) FROM stdin;
\.


--
-- Data for Name: sections_pictures; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sections_pictures (id, title, "pictureType", picture, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sections_section; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sections_section (id, title, picture, "tagId", description, created_at, updated_at, is_published, admin_id) FROM stdin;
2	Computing Section	imgs/uploads/sections/2024/computing.png	computing-card	Get ready to code like a pro and explore the future of computing! In the Computing section, you'll become a tech whiz, building awesome games, designing websites, and even unraveling the mysteries of the quantum world. With fun challenges, clear tutorials, and awesome tools, you'll learn how computers work today and get a glimpse into the mind-bending possibilities of tomorrow's quantum machines!	2024-07-14 21:35:16.869744+00	2024-07-14 21:35:16.869753+00	f	1
3	Maths Section	imgs/uploads/sections/2024/maths.png	maths-card	Get ready to blast off on a math adventure! 🚀 Our math section is like a playground for your brain, packed with games, puzzles, and challenges that make learning math a blast. Unlock the secrets of numbers, shapes, and patterns through fun activities and interactive lessons. Whether you're a math whiz or just starting out, we've got something to spark your curiosity and help you level up your math skills! 💥	2024-07-14 21:50:45.475658+00	2024-07-14 21:50:45.47567+00	f	1
4	Languages Section	imgs/uploads/sections/2024/language.png	lang-card	Ready to speak the world's languages? 🌎 Our language section is your passport to adventure! Learn Spanish, French, Mandarin, and more through fun games, catchy songs, and interactive stories. Chat with friendly characters, explore vibrant cultures, and unlock the power of communication. From basic greetings to fluent conversations, we'll help you become a global citizen, one word at a time! 🗣️	2024-07-14 21:52:31.540162+00	2024-07-14 21:52:31.540176+00	f	1
5	Physics Section	imgs/uploads/sections/2024/physics.png	physics-card	Get ready to unlock the secrets of the universe! 🌌 Our physics section is your launchpad to explore the awesome forces that shape our world. Conduct virtual experiments, build incredible contraptions, and discover the laws of motion, gravity, and light. From launching rockets to understanding sound waves, we'll make learning physics an electrifying adventure! ⚡️	2024-07-14 21:54:25.963469+00	2024-07-14 21:54:25.963483+00	f	1
6	Chemistry Section	imgs/uploads/sections/2024/chemistry.png	chemistry Section	Mix it up in our chemistry lab! 🧪 Conduct exciting experiments, discover the elements, and explore the building blocks of our world. From bubbling potions to colorful reactions, we'll make chemistry a thrilling adventure.	2024-07-14 22:00:55.182138+00	2024-07-14 22:00:55.182147+00	f	1
7	Technology Section	imgs/uploads/sections/2024/technology.png	tech-card	Explore the future! 🚀 Our technology section is your portal to the latest gadgets, innovations, and trends. Learn about robotics, artificial intelligence, and the amazing ways technology is shaping our world.	2024-07-14 22:10:46.978762+00	2024-07-14 22:10:46.978778+00	f	1
8	Biology Section	imgs/uploads/sections/2024/biology.png	biology-card	Dive into the wonders of life! 🌿 Our biology section is your guide to the amazing diversity of living things. Explore ecosystems, discover the secrets of the human body, and learn about the incredible processes that keep us alive.	2024-07-14 22:12:22.084536+00	2024-07-14 22:12:22.084566+00	f	1
9	Drawing Section	imgs/uploads/sections/2024/drawing.png	drawing-card	Let your creativity flow! 🎨 Our drawing section is your art studio, filled with tools and techniques to unleash your inner artist. Learn to sketch, paint, and create your own masterpieces.	2024-07-14 22:14:21.983117+00	2024-07-14 22:14:21.983134+00	f	1
10	Stories Section	imgs/uploads/sections/2024/stories.png	stories-card	Embark on literary adventures! 📚 Our stories section is a treasure trove of tales, from classic fables to modern masterpieces. Read, write, and share your own stories, and let your imagination soar.	2024-07-14 22:15:22.869656+00	2024-07-14 22:15:22.869666+00	f	1
11	Manga Section	imgs/uploads/sections/2024/manga.png	manga-card	Enter the world of manga! 💥 Our manga section is your gateway to the exciting world of Japanese comics. Learn about the art style, create your own characters, and explore captivating stories.	2024-07-14 22:16:51.753076+00	2024-07-14 22:16:51.7531+00	f	1
12	Puzzles Section	imgs/uploads/sections/2024/puzzle.png	puzzles-card	Put your brain to the test! 🧠 Our puzzles section is packed with brain-bending challenges, from logic puzzles to riddles and mazes. Sharpen your problem-solving skills and have fun while you do it!	2024-07-14 22:18:27.752952+00	2024-07-14 22:18:27.752993+00	f	1
1	Music Section	imgs/uploads/sections/2024/music0.png	music-card	Unleash your inner rockstar! 🎸 Our music section is your backstage pass to a world of rhythm and melodys, engaging lessons, and exciting instruments. Explore music theory, build your skills, and create your own masterpieces - all in one place!  Get ready to jam, groove, and make some noise!	2024-07-14 21:32:03.643281+00	2024-07-14 22:21:49.110891+00	f	1
13	Subatomic Adventures	imgs/uploads/sections/2024/450a62b1-f08f-4aa8-be4f-88fd5cca8025-0.png	quantum-card	Get ready for a mind-blowing adventure into the Subatomic Adventures section! 💥🔬 Shrink down to the size of an atom and explore a world where the rules of physics get turned upside down! Unravel the mysteries of quantum mechanics through fun games, mind-bending puzzles, and awesome experiments. You'll discover the secrets of particles that can be in two places at once, teleport through walls, and maybe even build your own quantum computer! Buckle up, explorers, it's going to be a wild ride! 🚀	2024-07-14 23:21:54.587051+00	2024-07-14 23:37:08.11314+00	f	1
\.


--
-- Data for Name: sections_userexcercicegrade; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sections_userexcercicegrade (id, trial, grade, exercice_id, user_id) FROM stdin;
\.


--
-- Data for Name: sections_userprogress; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sections_userprogress (id, page, created_at, updated_at, category_id, content_id, section_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_customuser; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_customuser (id, password, last_login, is_superuser, email, first_name, last_name, is_staff, is_active, role, birthday, created_at, updated_at) FROM stdin;
1	pbkdf2_sha256$720000$MeGdw1vKxAsChJap0Pioyx$10oTNK/7X3a3/xvH5Mssl5NppOKIoK5p62Q4t7vPfAU=	2024-07-14 17:03:01.612271+00	t	ggirlk2@gmail.com			t	t	\N	\N	2024-07-14 03:45:52.046521+00	2024-07-14 03:45:52.046536+00
\.


--
-- Data for Name: user_customuser_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 61, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 33, true);


--
-- Name: musicStudio_generatedinstruments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."musicStudio_generatedinstruments_id_seq"', 1, false);


--
-- Name: musicStudio_generatedmusic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."musicStudio_generatedmusic_id_seq"', 1, false);


--
-- Name: musicStudio_intstrument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."musicStudio_intstrument_id_seq"', 1, false);


--
-- Name: musicStudio_musicsymbols_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."musicStudio_musicsymbols_id_seq"', 1, false);


--
-- Name: musicStudio_studio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."musicStudio_studio_id_seq"', 1, false);


--
-- Name: sections_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sections_category_id_seq', 44, true);


--
-- Name: sections_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sections_content_id_seq', 1, false);


--
-- Name: sections_enrolments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sections_enrolments_id_seq', 1, false);


--
-- Name: sections_exercicechoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sections_exercicechoices_id_seq', 1, false);


--
-- Name: sections_exercices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sections_exercices_id_seq', 1, false);


--
-- Name: sections_pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sections_pictures_id_seq', 1, false);


--
-- Name: sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sections_section_id_seq', 13, true);


--
-- Name: sections_userexcercicegrade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sections_userexcercicegrade_id_seq', 1, false);


--
-- Name: sections_userprogress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sections_userprogress_id_seq', 1, false);


--
-- Name: user_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_customuser_groups_id_seq', 1, false);


--
-- Name: user_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_customuser_id_seq', 1, true);


--
-- Name: user_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_customuser_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: musicStudio_generatedinstruments musicStudio_generatedinstruments_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_generatedinstruments"
    ADD CONSTRAINT "musicStudio_generatedinstruments_pkey" PRIMARY KEY (id);


--
-- Name: musicStudio_generatedmusic musicStudio_generatedmusic_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_generatedmusic"
    ADD CONSTRAINT "musicStudio_generatedmusic_pkey" PRIMARY KEY (id);


--
-- Name: musicStudio_intstrument musicStudio_intstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_intstrument"
    ADD CONSTRAINT "musicStudio_intstrument_pkey" PRIMARY KEY (id);


--
-- Name: musicStudio_musicsymbols musicStudio_musicsymbols_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_musicsymbols"
    ADD CONSTRAINT "musicStudio_musicsymbols_pkey" PRIMARY KEY (id);


--
-- Name: musicStudio_studio musicStudio_studio_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_studio"
    ADD CONSTRAINT "musicStudio_studio_pkey" PRIMARY KEY (id);


--
-- Name: sections_category sections_category_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_category
    ADD CONSTRAINT sections_category_pkey PRIMARY KEY (id);


--
-- Name: sections_content sections_content_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_content
    ADD CONSTRAINT sections_content_pkey PRIMARY KEY (id);


--
-- Name: sections_enrolments sections_enrolments_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_enrolments
    ADD CONSTRAINT sections_enrolments_pkey PRIMARY KEY (id);


--
-- Name: sections_exercicechoices sections_exercicechoices_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_exercicechoices
    ADD CONSTRAINT sections_exercicechoices_pkey PRIMARY KEY (id);


--
-- Name: sections_exercices sections_exercices_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_exercices
    ADD CONSTRAINT sections_exercices_pkey PRIMARY KEY (id);


--
-- Name: sections_pictures sections_pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_pictures
    ADD CONSTRAINT sections_pictures_pkey PRIMARY KEY (id);


--
-- Name: sections_section sections_section_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_section
    ADD CONSTRAINT sections_section_pkey PRIMARY KEY (id);


--
-- Name: sections_userexcercicegrade sections_userexcercicegrade_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_userexcercicegrade
    ADD CONSTRAINT sections_userexcercicegrade_pkey PRIMARY KEY (id);


--
-- Name: sections_userprogress sections_userprogress_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_userprogress
    ADD CONSTRAINT sections_userprogress_pkey PRIMARY KEY (id);


--
-- Name: user_customuser user_customuser_email_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser
    ADD CONSTRAINT user_customuser_email_key UNIQUE (email);


--
-- Name: user_customuser_groups user_customuser_groups_customuser_id_group_id_e0a2f621_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser_groups
    ADD CONSTRAINT user_customuser_groups_customuser_id_group_id_e0a2f621_uniq UNIQUE (customuser_id, group_id);


--
-- Name: user_customuser_groups user_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser_groups
    ADD CONSTRAINT user_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: user_customuser user_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser
    ADD CONSTRAINT user_customuser_pkey PRIMARY KEY (id);


--
-- Name: user_customuser_user_permissions user_customuser_user_per_customuser_id_permission_a5da865d_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser_user_permissions
    ADD CONSTRAINT user_customuser_user_per_customuser_id_permission_a5da865d_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: user_customuser_user_permissions user_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser_user_permissions
    ADD CONSTRAINT user_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: musicStudio_generatedinstruments_generatedMusicID_id_c633637d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "musicStudio_generatedinstruments_generatedMusicID_id_c633637d" ON public."musicStudio_generatedinstruments" USING btree ("generatedMusicID_id");


--
-- Name: musicStudio_generatedinstruments_instrumentID_id_a0e4d6ab; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "musicStudio_generatedinstruments_instrumentID_id_a0e4d6ab" ON public."musicStudio_generatedinstruments" USING btree ("instrumentID_id");


--
-- Name: musicStudio_generatedmusic_adminID_id_5f452259; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "musicStudio_generatedmusic_adminID_id_5f452259" ON public."musicStudio_generatedmusic" USING btree ("adminID_id");


--
-- Name: musicStudio_generatedmusic_userID_id_d59ebda3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "musicStudio_generatedmusic_userID_id_d59ebda3" ON public."musicStudio_generatedmusic" USING btree ("userID_id");


--
-- Name: sections_category_admin_id_6b3ced0c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_category_admin_id_6b3ced0c ON public.sections_category USING btree (admin_id);


--
-- Name: sections_category_section_id_7378ecb9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_category_section_id_7378ecb9 ON public.sections_category USING btree (section_id);


--
-- Name: sections_content_admin_id_099c4155; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_content_admin_id_099c4155 ON public.sections_content USING btree (admin_id);


--
-- Name: sections_content_category_id_3100ffbe; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_content_category_id_3100ffbe ON public.sections_content USING btree (category_id);


--
-- Name: sections_content_pictures_id_11f496a2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_content_pictures_id_11f496a2 ON public.sections_content USING btree (pictures_id);


--
-- Name: sections_content_section_id_0a580079; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_content_section_id_0a580079 ON public.sections_content USING btree (section_id);


--
-- Name: sections_enrolments_content_id_5c5d6505; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_enrolments_content_id_5c5d6505 ON public.sections_enrolments USING btree (content_id);


--
-- Name: sections_enrolments_user_id_221fd511; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_enrolments_user_id_221fd511 ON public.sections_enrolments USING btree (user_id);


--
-- Name: sections_exercices_admin_id_43ffa756; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_exercices_admin_id_43ffa756 ON public.sections_exercices USING btree (admin_id);


--
-- Name: sections_exercices_category_id_c4f350b8; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_exercices_category_id_c4f350b8 ON public.sections_exercices USING btree (category_id);


--
-- Name: sections_exercices_choices_id_74b45450; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_exercices_choices_id_74b45450 ON public.sections_exercices USING btree (choices_id);


--
-- Name: sections_exercices_content_id_3c104586; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_exercices_content_id_3c104586 ON public.sections_exercices USING btree (content_id);


--
-- Name: sections_exercices_pictures_id_c955ba6d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_exercices_pictures_id_c955ba6d ON public.sections_exercices USING btree (pictures_id);


--
-- Name: sections_exercices_section_id_e4749f58; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_exercices_section_id_e4749f58 ON public.sections_exercices USING btree (section_id);


--
-- Name: sections_section_admin_id_8765cbd6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_section_admin_id_8765cbd6 ON public.sections_section USING btree (admin_id);


--
-- Name: sections_userexcercicegrade_exercice_id_ce9bc1b0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_userexcercicegrade_exercice_id_ce9bc1b0 ON public.sections_userexcercicegrade USING btree (exercice_id);


--
-- Name: sections_userexcercicegrade_user_id_3788c312; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_userexcercicegrade_user_id_3788c312 ON public.sections_userexcercicegrade USING btree (user_id);


--
-- Name: sections_userprogress_category_id_e2cb8def; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_userprogress_category_id_e2cb8def ON public.sections_userprogress USING btree (category_id);


--
-- Name: sections_userprogress_content_id_28639f8c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_userprogress_content_id_28639f8c ON public.sections_userprogress USING btree (content_id);


--
-- Name: sections_userprogress_section_id_c530f496; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_userprogress_section_id_c530f496 ON public.sections_userprogress USING btree (section_id);


--
-- Name: sections_userprogress_user_id_476a1155; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sections_userprogress_user_id_476a1155 ON public.sections_userprogress USING btree (user_id);


--
-- Name: user_customuser_email_2292cf6d_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX user_customuser_email_2292cf6d_like ON public.user_customuser USING btree (email varchar_pattern_ops);


--
-- Name: user_customuser_groups_customuser_id_192632a7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX user_customuser_groups_customuser_id_192632a7 ON public.user_customuser_groups USING btree (customuser_id);


--
-- Name: user_customuser_groups_group_id_bcbc9e48; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX user_customuser_groups_group_id_bcbc9e48 ON public.user_customuser_groups USING btree (group_id);


--
-- Name: user_customuser_user_permissions_customuser_id_4552d9cc; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX user_customuser_user_permissions_customuser_id_4552d9cc ON public.user_customuser_user_permissions USING btree (customuser_id);


--
-- Name: user_customuser_user_permissions_permission_id_e57e8b9a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX user_customuser_user_permissions_permission_id_e57e8b9a ON public.user_customuser_user_permissions USING btree (permission_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_customuser_id FOREIGN KEY (user_id) REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: musicStudio_generatedmusic musicStudio_generate_adminID_id_5f452259_fk_user_cust; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_generatedmusic"
    ADD CONSTRAINT "musicStudio_generate_adminID_id_5f452259_fk_user_cust" FOREIGN KEY ("adminID_id") REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: musicStudio_generatedinstruments musicStudio_generate_generatedMusicID_id_c633637d_fk_musicStud; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_generatedinstruments"
    ADD CONSTRAINT "musicStudio_generate_generatedMusicID_id_c633637d_fk_musicStud" FOREIGN KEY ("generatedMusicID_id") REFERENCES public."musicStudio_generatedmusic"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: musicStudio_generatedinstruments musicStudio_generate_instrumentID_id_a0e4d6ab_fk_musicStud; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_generatedinstruments"
    ADD CONSTRAINT "musicStudio_generate_instrumentID_id_a0e4d6ab_fk_musicStud" FOREIGN KEY ("instrumentID_id") REFERENCES public."musicStudio_intstrument"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: musicStudio_generatedmusic musicStudio_generate_userID_id_d59ebda3_fk_user_cust; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."musicStudio_generatedmusic"
    ADD CONSTRAINT "musicStudio_generate_userID_id_d59ebda3_fk_user_cust" FOREIGN KEY ("userID_id") REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_category sections_category_admin_id_6b3ced0c_fk_user_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_category
    ADD CONSTRAINT sections_category_admin_id_6b3ced0c_fk_user_customuser_id FOREIGN KEY (admin_id) REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_category sections_category_section_id_7378ecb9_fk_sections_section_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_category
    ADD CONSTRAINT sections_category_section_id_7378ecb9_fk_sections_section_id FOREIGN KEY (section_id) REFERENCES public.sections_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_content sections_content_admin_id_099c4155_fk_user_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_content
    ADD CONSTRAINT sections_content_admin_id_099c4155_fk_user_customuser_id FOREIGN KEY (admin_id) REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_content sections_content_category_id_3100ffbe_fk_sections_category_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_content
    ADD CONSTRAINT sections_content_category_id_3100ffbe_fk_sections_category_id FOREIGN KEY (category_id) REFERENCES public.sections_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_content sections_content_pictures_id_11f496a2_fk_sections_pictures_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_content
    ADD CONSTRAINT sections_content_pictures_id_11f496a2_fk_sections_pictures_id FOREIGN KEY (pictures_id) REFERENCES public.sections_pictures(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_content sections_content_section_id_0a580079_fk_sections_section_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_content
    ADD CONSTRAINT sections_content_section_id_0a580079_fk_sections_section_id FOREIGN KEY (section_id) REFERENCES public.sections_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_enrolments sections_enrolments_content_id_5c5d6505_fk_sections_content_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_enrolments
    ADD CONSTRAINT sections_enrolments_content_id_5c5d6505_fk_sections_content_id FOREIGN KEY (content_id) REFERENCES public.sections_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_enrolments sections_enrolments_user_id_221fd511_fk_user_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_enrolments
    ADD CONSTRAINT sections_enrolments_user_id_221fd511_fk_user_customuser_id FOREIGN KEY (user_id) REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_exercices sections_exercices_admin_id_43ffa756_fk_user_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_exercices
    ADD CONSTRAINT sections_exercices_admin_id_43ffa756_fk_user_customuser_id FOREIGN KEY (admin_id) REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_exercices sections_exercices_category_id_c4f350b8_fk_sections_category_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_exercices
    ADD CONSTRAINT sections_exercices_category_id_c4f350b8_fk_sections_category_id FOREIGN KEY (category_id) REFERENCES public.sections_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_exercices sections_exercices_choices_id_74b45450_fk_sections_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_exercices
    ADD CONSTRAINT sections_exercices_choices_id_74b45450_fk_sections_ FOREIGN KEY (choices_id) REFERENCES public.sections_exercicechoices(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_exercices sections_exercices_content_id_3c104586_fk_sections_content_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_exercices
    ADD CONSTRAINT sections_exercices_content_id_3c104586_fk_sections_content_id FOREIGN KEY (content_id) REFERENCES public.sections_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_exercices sections_exercices_pictures_id_c955ba6d_fk_sections_pictures_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_exercices
    ADD CONSTRAINT sections_exercices_pictures_id_c955ba6d_fk_sections_pictures_id FOREIGN KEY (pictures_id) REFERENCES public.sections_pictures(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_exercices sections_exercices_section_id_e4749f58_fk_sections_section_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_exercices
    ADD CONSTRAINT sections_exercices_section_id_e4749f58_fk_sections_section_id FOREIGN KEY (section_id) REFERENCES public.sections_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_section sections_section_admin_id_8765cbd6_fk_user_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_section
    ADD CONSTRAINT sections_section_admin_id_8765cbd6_fk_user_customuser_id FOREIGN KEY (admin_id) REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_userexcercicegrade sections_userexcerci_exercice_id_ce9bc1b0_fk_sections_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_userexcercicegrade
    ADD CONSTRAINT sections_userexcerci_exercice_id_ce9bc1b0_fk_sections_ FOREIGN KEY (exercice_id) REFERENCES public.sections_exercices(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_userexcercicegrade sections_userexcerci_user_id_3788c312_fk_user_cust; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_userexcercicegrade
    ADD CONSTRAINT sections_userexcerci_user_id_3788c312_fk_user_cust FOREIGN KEY (user_id) REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_userprogress sections_userprogres_category_id_e2cb8def_fk_sections_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_userprogress
    ADD CONSTRAINT sections_userprogres_category_id_e2cb8def_fk_sections_ FOREIGN KEY (category_id) REFERENCES public.sections_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_userprogress sections_userprogres_content_id_28639f8c_fk_sections_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_userprogress
    ADD CONSTRAINT sections_userprogres_content_id_28639f8c_fk_sections_ FOREIGN KEY (content_id) REFERENCES public.sections_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_userprogress sections_userprogres_section_id_c530f496_fk_sections_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_userprogress
    ADD CONSTRAINT sections_userprogres_section_id_c530f496_fk_sections_ FOREIGN KEY (section_id) REFERENCES public.sections_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_userprogress sections_userprogress_user_id_476a1155_fk_user_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sections_userprogress
    ADD CONSTRAINT sections_userprogress_user_id_476a1155_fk_user_customuser_id FOREIGN KEY (user_id) REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_customuser_groups user_customuser_grou_customuser_id_192632a7_fk_user_cust; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser_groups
    ADD CONSTRAINT user_customuser_grou_customuser_id_192632a7_fk_user_cust FOREIGN KEY (customuser_id) REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_customuser_groups user_customuser_groups_group_id_bcbc9e48_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser_groups
    ADD CONSTRAINT user_customuser_groups_group_id_bcbc9e48_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_customuser_user_permissions user_customuser_user_customuser_id_4552d9cc_fk_user_cust; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser_user_permissions
    ADD CONSTRAINT user_customuser_user_customuser_id_4552d9cc_fk_user_cust FOREIGN KEY (customuser_id) REFERENCES public.user_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_customuser_user_permissions user_customuser_user_permission_id_e57e8b9a_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_customuser_user_permissions
    ADD CONSTRAINT user_customuser_user_permission_id_e57e8b9a_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

