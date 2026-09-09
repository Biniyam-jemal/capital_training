--
-- PostgreSQL database dump
--

\restrict f9mA4rZVFEOq9bZWrTpsNNMQ5XeOmi5Bw8CIUWg3dyimFBa3O0HfYDFsh3I2fq7

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

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

ALTER TABLE IF EXISTS ONLY public.payments_order DROP CONSTRAINT IF EXISTS payments_order_student_id_b8294c27_fk_accounts_user_id;
ALTER TABLE IF EXISTS ONLY public.payments_order DROP CONSTRAINT IF EXISTS payments_order_course_id_43e5a346_fk_courses_course_id;
ALTER TABLE IF EXISTS ONLY public.enrollments_lessonprogress DROP CONSTRAINT IF EXISTS enrollments_lessonpr_lesson_id_6e77b767_fk_courses_l;
ALTER TABLE IF EXISTS ONLY public.enrollments_lessonprogress DROP CONSTRAINT IF EXISTS enrollments_lessonpr_enrollment_id_0749b788_fk_enrollmen;
ALTER TABLE IF EXISTS ONLY public.enrollments_enrollment DROP CONSTRAINT IF EXISTS enrollments_enrollment_student_id_92696b89_fk_accounts_user_id;
ALTER TABLE IF EXISTS ONLY public.enrollments_enrollment DROP CONSTRAINT IF EXISTS enrollments_enrollment_course_id_c54c9325_fk_courses_course_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_user_id_c564eba6_fk_accounts_user_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.courses_module DROP CONSTRAINT IF EXISTS courses_module_course_id_7d4820de_fk_courses_course_id;
ALTER TABLE IF EXISTS ONLY public.courses_lesson DROP CONSTRAINT IF EXISTS courses_lesson_module_id_41252914_fk_courses_module_id;
ALTER TABLE IF EXISTS ONLY public.courses_course DROP CONSTRAINT IF EXISTS courses_course_instructor_id_5b0643dc_fk_accounts_user_id;
ALTER TABLE IF EXISTS ONLY public.courses_course DROP CONSTRAINT IF EXISTS courses_course_category_id_d64b93bf_fk_courses_category_id;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.accounts_user_user_permissions DROP CONSTRAINT IF EXISTS accounts_user_user_p_user_id_e4f0a161_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_user_user_permissions DROP CONSTRAINT IF EXISTS accounts_user_user_p_permission_id_113bb443_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.accounts_user_groups DROP CONSTRAINT IF EXISTS accounts_user_groups_user_id_52b62117_fk_accounts_user_id;
ALTER TABLE IF EXISTS ONLY public.accounts_user_groups DROP CONSTRAINT IF EXISTS accounts_user_groups_group_id_bd11a704_fk_auth_group_id;
DROP INDEX IF EXISTS public.payments_order_student_id_b8294c27;
DROP INDEX IF EXISTS public.payments_order_stripe_checkout_session_id_304f293e_like;
DROP INDEX IF EXISTS public.payments_order_course_id_43e5a346;
DROP INDEX IF EXISTS public.enrollments_lessonprogress_lesson_id_6e77b767;
DROP INDEX IF EXISTS public.enrollments_lessonprogress_enrollment_id_0749b788;
DROP INDEX IF EXISTS public.enrollments_enrollment_student_id_92696b89;
DROP INDEX IF EXISTS public.enrollments_enrollment_course_id_c54c9325;
DROP INDEX IF EXISTS public.django_session_session_key_c0390e0f_like;
DROP INDEX IF EXISTS public.django_session_expire_date_a5c62663;
DROP INDEX IF EXISTS public.django_admin_log_user_id_c564eba6;
DROP INDEX IF EXISTS public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX IF EXISTS public.courses_module_course_id_7d4820de;
DROP INDEX IF EXISTS public.courses_lesson_slug_708303e2_like;
DROP INDEX IF EXISTS public.courses_lesson_module_id_41252914;
DROP INDEX IF EXISTS public.courses_course_slug_9c670f14_like;
DROP INDEX IF EXISTS public.courses_course_instructor_id_5b0643dc;
DROP INDEX IF EXISTS public.courses_course_category_id_d64b93bf;
DROP INDEX IF EXISTS public.courses_category_slug_33267d74_like;
DROP INDEX IF EXISTS public.courses_category_name_016b219d_like;
DROP INDEX IF EXISTS public.auth_permission_content_type_id_2f476e4b;
DROP INDEX IF EXISTS public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX IF EXISTS public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX IF EXISTS public.auth_group_name_a6ea08ec_like;
DROP INDEX IF EXISTS public.accounts_user_username_6088629e_like;
DROP INDEX IF EXISTS public.accounts_user_user_permissions_user_id_e4f0a161;
DROP INDEX IF EXISTS public.accounts_user_user_permissions_permission_id_113bb443;
DROP INDEX IF EXISTS public.accounts_user_groups_user_id_52b62117;
DROP INDEX IF EXISTS public.accounts_user_groups_group_id_bd11a704;
ALTER TABLE IF EXISTS ONLY public.payments_order DROP CONSTRAINT IF EXISTS payments_order_stripe_checkout_session_id_key;
ALTER TABLE IF EXISTS ONLY public.payments_order DROP CONSTRAINT IF EXISTS payments_order_pkey;
ALTER TABLE IF EXISTS ONLY public.enrollments_lessonprogress DROP CONSTRAINT IF EXISTS enrollments_lessonprogress_pkey;
ALTER TABLE IF EXISTS ONLY public.enrollments_lessonprogress DROP CONSTRAINT IF EXISTS enrollments_lessonprogre_enrollment_id_lesson_id_635d5cf3_uniq;
ALTER TABLE IF EXISTS ONLY public.enrollments_enrollment DROP CONSTRAINT IF EXISTS enrollments_enrollment_student_id_course_id_88ca0934_uniq;
ALTER TABLE IF EXISTS ONLY public.enrollments_enrollment DROP CONSTRAINT IF EXISTS enrollments_enrollment_pkey;
ALTER TABLE IF EXISTS ONLY public.django_session DROP CONSTRAINT IF EXISTS django_session_pkey;
ALTER TABLE IF EXISTS ONLY public.django_migrations DROP CONSTRAINT IF EXISTS django_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_pkey;
ALTER TABLE IF EXISTS ONLY public.courses_module DROP CONSTRAINT IF EXISTS courses_module_pkey;
ALTER TABLE IF EXISTS ONLY public.courses_lesson DROP CONSTRAINT IF EXISTS courses_lesson_slug_key;
ALTER TABLE IF EXISTS ONLY public.courses_lesson DROP CONSTRAINT IF EXISTS courses_lesson_pkey;
ALTER TABLE IF EXISTS ONLY public.courses_course DROP CONSTRAINT IF EXISTS courses_course_slug_key;
ALTER TABLE IF EXISTS ONLY public.courses_course DROP CONSTRAINT IF EXISTS courses_course_pkey;
ALTER TABLE IF EXISTS ONLY public.courses_category DROP CONSTRAINT IF EXISTS courses_category_slug_key;
ALTER TABLE IF EXISTS ONLY public.courses_category DROP CONSTRAINT IF EXISTS courses_category_pkey;
ALTER TABLE IF EXISTS ONLY public.courses_category DROP CONSTRAINT IF EXISTS courses_category_name_key;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_name_key;
ALTER TABLE IF EXISTS ONLY public.accounts_user DROP CONSTRAINT IF EXISTS accounts_user_username_key;
ALTER TABLE IF EXISTS ONLY public.accounts_user_user_permissions DROP CONSTRAINT IF EXISTS accounts_user_user_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_user_user_permissions DROP CONSTRAINT IF EXISTS accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq;
ALTER TABLE IF EXISTS ONLY public.accounts_user DROP CONSTRAINT IF EXISTS accounts_user_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_user_groups DROP CONSTRAINT IF EXISTS accounts_user_groups_user_id_group_id_59c0b32f_uniq;
ALTER TABLE IF EXISTS ONLY public.accounts_user_groups DROP CONSTRAINT IF EXISTS accounts_user_groups_pkey;
DROP TABLE IF EXISTS public.payments_order;
DROP TABLE IF EXISTS public.enrollments_lessonprogress;
DROP TABLE IF EXISTS public.enrollments_enrollment;
DROP TABLE IF EXISTS public.django_session;
DROP TABLE IF EXISTS public.django_migrations;
DROP TABLE IF EXISTS public.django_content_type;
DROP TABLE IF EXISTS public.django_admin_log;
DROP TABLE IF EXISTS public.courses_module;
DROP TABLE IF EXISTS public.courses_lesson;
DROP TABLE IF EXISTS public.courses_course;
DROP TABLE IF EXISTS public.courses_category;
DROP TABLE IF EXISTS public.auth_permission;
DROP TABLE IF EXISTS public.auth_group_permissions;
DROP TABLE IF EXISTS public.auth_group;
DROP TABLE IF EXISTS public.accounts_user_user_permissions;
DROP TABLE IF EXISTS public.accounts_user_groups;
DROP TABLE IF EXISTS public.accounts_user;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    role character varying(20) NOT NULL,
    instructor_status character varying(20) NOT NULL,
    instructor_bio text NOT NULL,
    instructor_applied_at timestamp with time zone,
    profile_picture character varying(100),
    bio text NOT NULL,
    phone_number character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.accounts_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.accounts_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.accounts_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: courses_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    description text NOT NULL,
    icon character varying(100)
);


--
-- Name: courses_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.courses_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.courses_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: courses_course; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses_course (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    description text NOT NULL,
    short_description character varying(300) NOT NULL,
    thumbnail character varying(100),
    price numeric(8,2) NOT NULL,
    is_free boolean NOT NULL,
    level character varying(20) NOT NULL,
    language character varying(50) NOT NULL,
    is_published boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id bigint NOT NULL,
    instructor_id bigint
);


--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.courses_course ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.courses_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: courses_lesson; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses_lesson (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    video_url character varying(500) NOT NULL,
    duration integer NOT NULL,
    "order" integer NOT NULL,
    is_free_preview boolean NOT NULL,
    resource_file character varying(100),
    module_id bigint NOT NULL,
    CONSTRAINT courses_lesson_duration_check CHECK ((duration >= 0)),
    CONSTRAINT courses_lesson_order_check CHECK (("order" >= 0))
);


--
-- Name: courses_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.courses_lesson ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.courses_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: courses_module; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses_module (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    "order" integer NOT NULL,
    course_id bigint NOT NULL,
    CONSTRAINT courses_module_order_check CHECK (("order" >= 0))
);


--
-- Name: courses_module_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.courses_module ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.courses_module_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: enrollments_enrollment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.enrollments_enrollment (
    id bigint NOT NULL,
    enrolled_at timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    progress_percent smallint NOT NULL,
    course_id bigint NOT NULL,
    student_id bigint NOT NULL,
    CONSTRAINT enrollments_enrollment_progress_percent_check CHECK ((progress_percent >= 0))
);


--
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.enrollments_enrollment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.enrollments_enrollment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: enrollments_lessonprogress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.enrollments_lessonprogress (
    id bigint NOT NULL,
    is_completed boolean NOT NULL,
    completed_at timestamp with time zone,
    enrollment_id bigint NOT NULL,
    lesson_id bigint NOT NULL
);


--
-- Name: enrollments_lessonprogress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.enrollments_lessonprogress ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.enrollments_lessonprogress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: payments_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payments_order (
    id uuid NOT NULL,
    amount numeric(8,2) NOT NULL,
    currency character varying(10) NOT NULL,
    stripe_checkout_session_id character varying(255),
    stripe_payment_intent_id character varying(255),
    status character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    paid_at timestamp with time zone,
    course_id bigint NOT NULL,
    student_id bigint NOT NULL
);


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.accounts_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, role, instructor_status, instructor_bio, instructor_applied_at, profile_picture, bio, phone_number, created_at) FROM stdin;
1		\N	f	instructor1			instructor@capital.com	f	t	2026-09-04 09:33:17.272089+00	instructor	none		\N				2026-09-04 09:33:17.272709+00
7	pbkdf2_sha256$1500000$Oo3z9IDT2RaQI49ikwPmzb$1sQ5W6+wx0sFL9cvd/ape9tHco9HYIWL9KyLLIaqEkY=	2026-09-04 17:37:16.110187+00	f	abiye			abiye@gmail.com	f	t	2026-09-04 17:28:35.175757+00	instructor	approved	jaoghpiuygWNWJGPGFPGUIOGJ	2026-09-04 17:34:21.71744+00				2026-09-04 17:28:35.997348+00
2	pbkdf2_sha256$1500000$rqbJD4x9Ht85NkLXtRGhVM$+0U5V4DXjU1VTB5vrugajiwJZDly0jKw+R6KGhAyu+Q=	2026-09-04 10:30:27.356086+00	f	zeytun			benmoneymakingonline@gmail.com	f	t	2026-09-04 10:30:26.376793+00	instructor	approved	ben	2026-09-04 10:31:09.563273+00				2026-09-04 10:30:27.340809+00
3	pbkdf2_sha256$1500000$uVg5pxf04itPes6DifhVYJ$VZSEdktw9LdkFyHNhEL1+M5hxBye16mywMH6DqObt4U=	2026-09-05 11:20:52.681102+00	t	ben			ben@gmail.com	t	t	2026-09-04 10:34:20.219479+00	student	none		\N				2026-09-04 10:34:20.874797+00
8	pbkdf2_sha256$1500000$czxZnM16LgHhHwz5dD4aGJ$LeduwANNPMYNZErwmvlzg6IEgDAD6QbpTdHkFqhGqCc=	2026-09-05 11:21:33.536457+00	f	aba			aba@gmail.com	f	t	2026-09-05 11:19:50.173999+00	instructor	approved	iuhhfai	2026-09-05 11:20:24.107428+00				2026-09-05 11:19:50.944334+00
4	pbkdf2_sha256$1500000$bqBeOHAevTcdIRkMF1mEYM$0U47fi9jcUc6bbYdLKsSGlinuUITJEI81gI/pITi0/Q=	2026-09-04 11:15:45.424097+00	f	gen			gen@gmail.com	f	t	2026-09-04 11:11:09.046767+00	instructor	approved	im gay	2026-09-04 11:14:16.602362+00				2026-09-04 11:11:09.939781+00
5	pbkdf2_sha256$1500000$SyOAZx2jxdzpRoM24r7byn$gUfGt+o81mgdew3bVolT93t3RecXq8aQHXoJ9MvgTpc=	2026-09-04 13:36:20.216902+00	f	rom			rom@gmail.com	f	t	2026-09-04 13:27:56.894085+00	instructor	approved	game	2026-09-04 13:33:29.453154+00				2026-09-04 13:27:57.699348+00
6	pbkdf2_sha256$1500000$Ss2WoG9ML3jm0MakkU71aU$/WEhgXAiEhIT9ZuXcXC5VzOAAD4c8rXaQj1sEYLztDs=	2026-09-04 16:55:59.701388+00	f	geni			geni@gmail.com	f	t	2026-09-04 16:52:02.246216+00	instructor	approved	im expreanced teacher	2026-09-04 16:54:31.356499+00				2026-09-04 16:52:03.022632+00
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	3	add_permission
6	Can change permission	3	change_permission
7	Can delete permission	3	delete_permission
8	Can view permission	3	view_permission
9	Can add group	2	add_group
10	Can change group	2	change_group
11	Can delete group	2	delete_group
12	Can view group	2	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add course	8	add_course
30	Can change course	8	change_course
31	Can delete course	8	delete_course
32	Can view course	8	view_course
33	Can add module	10	add_module
34	Can change module	10	change_module
35	Can delete module	10	delete_module
36	Can view module	10	view_module
37	Can add lesson	9	add_lesson
38	Can change lesson	9	change_lesson
39	Can delete lesson	9	delete_lesson
40	Can view lesson	9	view_lesson
41	Can add enrollment	11	add_enrollment
42	Can change enrollment	11	change_enrollment
43	Can delete enrollment	11	delete_enrollment
44	Can view enrollment	11	view_enrollment
45	Can add lesson progress	12	add_lessonprogress
46	Can change lesson progress	12	change_lessonprogress
47	Can delete lesson progress	12	delete_lessonprogress
48	Can view lesson progress	12	view_lessonprogress
49	Can add order	13	add_order
50	Can change order	13	change_order
51	Can delete order	13	delete_order
52	Can view order	13	view_order
\.


--
-- Data for Name: courses_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses_category (id, name, slug, description, icon) FROM stdin;
1	Programming Languages	programming-languages		
2	Backend Frameworks	backend-frameworks		
3	Frontend Development	frontend-development		
4	Mobile Development	mobile-development		
5	Data Science	data-science		
6	DevOps & Cloud	devops-cloud		
7	Databases	databases		
8	Cybersecurity	cybersecurity		
9	Cloud Computing	cloud-computing		
10	Machine Learning	machine-learning		
\.


--
-- Data for Name: courses_course; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses_course (id, title, slug, description, short_description, thumbnail, price, is_free, level, language, is_published, created_at, updated_at, category_id, instructor_id) FROM stdin;
51	Backend Development Basics	backend-development-basics-09c9c7	Learn Backend Development Basics - perfect for beginners!			0.00	t	beginner	English	t	2026-09-04 09:47:23.527525+00	2026-09-04 09:47:23.527541+00	2	1
52	Django Web Framework	django-web-framework-df55b5	Master Django Web Framework with expert instruction.			40.00	f	intermediate	English	t	2026-09-04 09:47:23.581211+00	2026-09-04 09:47:23.581228+00	2	1
53	Spring Boot Masterclass	spring-boot-masterclass-7ca328	Master Spring Boot Masterclass with expert instruction.			50.00	f	intermediate	English	t	2026-09-04 09:47:23.61439+00	2026-09-04 09:47:23.614409+00	2	1
54	Node.js & Express API	nodejs-express-api-71eaf7	Master Node.js & Express API with expert instruction.			45.00	f	intermediate	English	t	2026-09-04 09:47:23.648034+00	2026-09-04 09:47:23.648048+00	2	1
55	FastAPI High-Performance	fastapi-high-performance-8df396	Master FastAPI High-Performance with expert instruction.			35.00	f	intermediate	English	t	2026-09-04 09:47:23.682108+00	2026-09-04 09:47:23.682126+00	2	1
56	Frontend Development Fundamentals	frontend-development-fundamentals-ab9766	Learn Frontend Development Fundamentals - perfect for beginners!			0.00	t	beginner	English	t	2026-09-04 09:47:23.71827+00	2026-09-04 09:47:23.718282+00	3	1
57	JavaScript & React Guide	javascript-react-guide-88c308	Master JavaScript & React Guide with expert instruction.			35.00	f	intermediate	English	t	2026-09-04 09:47:23.751435+00	2026-09-04 09:47:23.751447+00	3	1
58	Angular Enterprise	angular-enterprise-01d597	Master Angular Enterprise with expert instruction.			30.00	f	intermediate	English	t	2026-09-04 09:47:23.784776+00	2026-09-04 09:47:23.784789+00	3	1
59	Vue.js Complete	vuejs-complete-e3b968	Master Vue.js Complete with expert instruction.			30.00	f	intermediate	English	t	2026-09-04 09:47:23.819982+00	2026-09-04 09:47:23.819997+00	3	1
60	HTML & CSS Masterclass	html-css-masterclass-b712fd	Master HTML & CSS Masterclass with expert instruction.			20.00	f	beginner	English	t	2026-09-04 09:47:23.853809+00	2026-09-04 09:47:23.85382+00	3	1
61	Mobile App Development Basics	mobile-app-development-basics-34010c	Learn Mobile App Development Basics - perfect for beginners!			0.00	t	beginner	English	t	2026-09-04 09:47:23.889002+00	2026-09-04 09:47:23.889022+00	4	1
62	Android with Kotlin	android-with-kotlin-23643f	Master Android with Kotlin with expert instruction.			30.00	f	intermediate	English	t	2026-09-04 09:47:23.92277+00	2026-09-04 09:47:23.922789+00	4	1
63	iOS with Swift	ios-with-swift-85584d	Master iOS with Swift with expert instruction.			30.00	f	intermediate	English	t	2026-09-04 09:47:23.956452+00	2026-09-04 09:47:23.956473+00	4	1
64	Flutter Cross-Platform	flutter-cross-platform-3eeef2	Master Flutter Cross-Platform with expert instruction.			30.00	f	intermediate	English	t	2026-09-04 09:47:24.059719+00	2026-09-04 09:47:24.059743+00	4	1
65	React Native Apps	react-native-apps-6a1d20	Master React Native Apps with expert instruction.			30.00	f	intermediate	English	t	2026-09-04 09:47:24.09814+00	2026-09-04 09:47:24.098159+00	4	1
66	Programming Fundamentals	programming-fundamentals-14ca09	Learn Programming Fundamentals - perfect for beginners!			0.00	t	beginner	English	t	2026-09-04 09:47:24.134175+00	2026-09-04 09:47:24.134186+00	1	1
67	Python Programming	python-programming-324110	Master Python Programming with expert instruction.			20.00	f	beginner	English	t	2026-09-04 09:47:24.173217+00	2026-09-04 09:47:24.173236+00	1	1
68	Java Programming	java-programming-b5747c	Master Java Programming with expert instruction.			30.00	f	beginner	English	t	2026-09-04 09:47:24.207047+00	2026-09-04 09:47:24.207065+00	1	1
69	C# Programming	c-programming-41a89e	Master C# Programming with expert instruction.			30.00	f	beginner	English	t	2026-09-04 09:47:24.245997+00	2026-09-04 09:47:24.246019+00	1	1
70	Advanced Python	advanced-python-71a18e	Master Advanced Python with expert instruction.			35.00	f	advanced	English	t	2026-09-04 09:47:24.281026+00	2026-09-04 09:47:24.281044+00	1	1
71	Data Science Fundamentals	data-science-fundamentals-85cdf7	Learn Data Science Fundamentals - perfect for beginners!			0.00	t	beginner	English	t	2026-09-04 09:47:24.318749+00	2026-09-04 09:47:24.318761+00	5	1
72	Machine Learning A-Z	machine-learning-a-z-f7b3bc	Master Machine Learning A-Z with expert instruction.			40.00	f	advanced	English	t	2026-09-04 09:47:24.35185+00	2026-09-04 09:47:24.351862+00	5	1
73	Deep Learning Neural Networks	deep-learning-neural-networks-1749b6	Master Deep Learning Neural Networks with expert instruction.			35.00	f	advanced	English	t	2026-09-04 09:47:24.395347+00	2026-09-04 09:47:24.395361+00	5	1
74	Data Science with Python	data-science-with-python-375943	Master Data Science with Python with expert instruction.			35.00	f	intermediate	English	t	2026-09-04 09:47:24.431783+00	2026-09-04 09:47:24.431797+00	5	1
75	Data Visualization	data-visualization-dc573b	Master Data Visualization with expert instruction.			50.00	f	intermediate	English	t	2026-09-04 09:47:24.466862+00	2026-09-04 09:47:24.466875+00	5	1
76	DevOps Fundamentals	devops-fundamentals-340b53	Learn DevOps Fundamentals - perfect for beginners!			0.00	t	beginner	English	t	2026-09-04 09:47:24.502573+00	2026-09-04 09:47:24.502585+00	6	1
77	Docker & Kubernetes DevOps	docker-kubernetes-devops-f4f556	Master Docker & Kubernetes DevOps with expert instruction.			45.00	f	advanced	English	t	2026-09-04 09:47:24.538965+00	2026-09-04 09:47:24.538977+00	6	1
78	Terraform Infrastructure	terraform-infrastructure-69bba6	Master Terraform Infrastructure with expert instruction.			40.00	f	intermediate	English	t	2026-09-04 09:47:24.578194+00	2026-09-04 09:47:24.578214+00	6	1
79	CI/CD Pipelines	cicd-pipelines-753211	Master CI/CD Pipelines with expert instruction.			30.00	f	intermediate	English	t	2026-09-04 09:47:24.612562+00	2026-09-04 09:47:24.612575+00	6	1
80	Docker & Kubernetes Guide	docker-kubernetes-guide-1e0024	Master Docker & Kubernetes Guide with expert instruction.			35.00	f	intermediate	English	t	2026-09-04 09:47:24.646941+00	2026-09-04 09:47:24.646984+00	6	1
81	Database Design for Beginners	database-design-for-beginners-954fde	Learn Database Design for Beginners - perfect for beginners!			0.00	t	beginner	English	t	2026-09-04 09:47:24.6836+00	2026-09-04 09:47:24.683613+00	7	1
82	PostgreSQL Advanced	postgresql-advanced-1a9334	Master PostgreSQL Advanced with expert instruction.			30.00	f	intermediate	English	t	2026-09-04 09:47:24.717558+00	2026-09-04 09:47:24.71757+00	7	1
83	MongoDB for Developers	mongodb-for-developers-542b09	Master MongoDB for Developers with expert instruction.			30.00	f	intermediate	English	t	2026-09-04 09:47:24.750656+00	2026-09-04 09:47:24.750668+00	7	1
84	SQL & Database Design	sql-database-design-ac6b68	Master SQL & Database Design with expert instruction.			25.00	f	beginner	English	t	2026-09-04 09:47:24.783765+00	2026-09-04 09:47:24.783786+00	7	1
85	Redis & Caching	redis-caching-42958f	Master Redis & Caching with expert instruction.			25.00	f	intermediate	English	t	2026-09-04 09:47:24.816461+00	2026-09-04 09:47:24.816479+00	7	1
86	Cybersecurity for Beginners	cybersecurity-for-beginners-0eafb5	Learn Cybersecurity for Beginners - perfect for beginners!			0.00	t	beginner	English	t	2026-09-04 09:47:24.850994+00	2026-09-04 09:47:24.851005+00	8	1
87	Network Security	network-security-ebf249	Master Network Security with expert instruction.			30.00	f	intermediate	English	t	2026-09-04 09:47:24.884391+00	2026-09-04 09:47:24.884412+00	8	1
88	Ethical Hacking	ethical-hacking-5aa6f9	Master Ethical Hacking with expert instruction.			30.00	f	intermediate	English	t	2026-09-04 09:47:24.9178+00	2026-09-04 09:47:24.917818+00	8	1
89	Cybersecurity Fundamentals	cybersecurity-fundamentals-93721d	Master Cybersecurity Fundamentals with expert instruction.			25.00	f	beginner	English	t	2026-09-04 09:47:24.950663+00	2026-09-04 09:47:24.950681+00	8	1
90	Cloud Security	cloud-security-2fbbd1	Master Cloud Security with expert instruction.			40.00	f	advanced	English	t	2026-09-04 09:47:24.983956+00	2026-09-04 09:47:24.983999+00	8	1
91	Cloud Computing Basics	cloud-computing-basics-0e2ef2	Learn Cloud Computing Basics - perfect for beginners!			0.00	t	beginner	English	t	2026-09-04 09:47:25.018624+00	2026-09-04 09:47:25.018642+00	9	1
92	AWS Cloud Practitioner	aws-cloud-practitioner-e15ab1	Master AWS Cloud Practitioner with expert instruction.			35.00	f	intermediate	English	t	2026-09-04 09:47:25.05197+00	2026-09-04 09:47:25.051985+00	9	1
93	Azure Cloud	azure-cloud-5648fc	Master Azure Cloud with expert instruction.			35.00	f	intermediate	English	t	2026-09-04 09:47:25.085067+00	2026-09-04 09:47:25.085086+00	9	1
94	Google Cloud Platform	google-cloud-platform-585582	Master Google Cloud Platform with expert instruction.			35.00	f	intermediate	English	t	2026-09-04 09:47:25.118654+00	2026-09-04 09:47:25.118672+00	9	1
95	Cloud Architecture	cloud-architecture-b9aa8c	Master Cloud Architecture with expert instruction.			45.00	f	advanced	English	t	2026-09-04 09:47:25.152865+00	2026-09-04 09:47:25.152897+00	9	1
96	Machine Learning Fundamentals	machine-learning-fundamentals-2a2a03	Learn Machine Learning Fundamentals - perfect for beginners!			0.00	t	beginner	English	t	2026-09-04 09:47:25.248528+00	2026-09-04 09:47:25.248557+00	10	1
97	Machine Learning A-Z	machine-learning-a-z-01271d	Master Machine Learning A-Z with expert instruction.			40.00	f	advanced	English	t	2026-09-04 09:47:25.294812+00	2026-09-04 09:47:25.294825+00	10	1
98	Deep Learning TensorFlow	deep-learning-tensorflow-b1eda8	Master Deep Learning TensorFlow with expert instruction.			45.00	f	advanced	English	t	2026-09-04 09:47:25.333362+00	2026-09-04 09:47:25.333374+00	10	1
99	Natural Language Processing	natural-language-processing-46664a	Master Natural Language Processing with expert instruction.			35.00	f	intermediate	English	t	2026-09-04 09:47:25.370182+00	2026-09-04 09:47:25.370201+00	10	1
100	Computer Vision OpenCV	computer-vision-opencv-2db92c	Master Computer Vision OpenCV with expert instruction.			35.00	f	intermediate	English	t	2026-09-04 09:47:25.40464+00	2026-09-04 09:47:25.404651+00	10	1
101	golit	golit	man	fet		23.00	f	beginner	English	f	2026-09-04 16:57:05.753033+00	2026-09-04 16:57:05.753059+00	4	6
\.


--
-- Data for Name: courses_lesson; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses_lesson (id, title, slug, video_url, duration, "order", is_free_preview, resource_file, module_id) FROM stdin;
483	Introduction - Part 1	backend-de-introduction-1-c9f4	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		243
484	Introduction - Part 2	backend-de-introduction-2-ad57	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		243
485	Core Concepts - Part 1	backend-de-core-concepts-1-3ea5	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		244
486	Core Concepts - Part 2	backend-de-core-concepts-2-7f8c	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		244
487	Practical Examples - Part 1	backend-de-practical-examples-1-8272	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		245
488	Practical Examples - Part 2	backend-de-practical-examples-2-f54d	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		245
489	Projects - Part 1	backend-de-projects-1-3926	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		246
490	Projects - Part 2	backend-de-projects-2-e549	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		246
491	Advanced Topics - Part 1	backend-de-advanced-topics-1-1bfb	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		247
492	Advanced Topics - Part 2	backend-de-advanced-topics-2-e01e	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		247
493	Introduction - Part 1	django-web-introduction-1-1703	https://www.youtube.com/embed/Hl7z3y2sDnI	0	1	f		248
494	Introduction - Part 2	django-web-introduction-2-0f7b	https://www.youtube.com/embed/Hl7z3y2sDnI	0	2	f		248
495	Core Concepts - Part 1	django-web-core-concepts-1-ca05	https://www.youtube.com/embed/Hl7z3y2sDnI	0	1	f		249
496	Core Concepts - Part 2	django-web-core-concepts-2-cbac	https://www.youtube.com/embed/Hl7z3y2sDnI	0	2	f		249
497	Practical Examples - Part 1	django-web-practical-examples-1-b1e0	https://www.youtube.com/embed/Hl7z3y2sDnI	0	1	f		250
498	Practical Examples - Part 2	django-web-practical-examples-2-1717	https://www.youtube.com/embed/Hl7z3y2sDnI	0	2	f		250
499	Projects - Part 1	django-web-projects-1-a06b	https://www.youtube.com/embed/Hl7z3y2sDnI	0	1	f		251
500	Projects - Part 2	django-web-projects-2-d1a9	https://www.youtube.com/embed/Hl7z3y2sDnI	0	2	f		251
501	Advanced Topics - Part 1	django-web-advanced-topics-1-5805	https://www.youtube.com/embed/Hl7z3y2sDnI	0	1	f		252
502	Advanced Topics - Part 2	django-web-advanced-topics-2-675d	https://www.youtube.com/embed/Hl7z3y2sDnI	0	2	f		252
503	Introduction - Part 1	spring-boo-introduction-1-858f	https://www.youtube.com/embed/9SGDpanrc8U	0	1	f		253
504	Introduction - Part 2	spring-boo-introduction-2-4a34	https://www.youtube.com/embed/9SGDpanrc8U	0	2	f		253
505	Core Concepts - Part 1	spring-boo-core-concepts-1-e3f0	https://www.youtube.com/embed/9SGDpanrc8U	0	1	f		254
506	Core Concepts - Part 2	spring-boo-core-concepts-2-af94	https://www.youtube.com/embed/9SGDpanrc8U	0	2	f		254
507	Practical Examples - Part 1	spring-boo-practical-examples-1-bbb0	https://www.youtube.com/embed/9SGDpanrc8U	0	1	f		255
508	Practical Examples - Part 2	spring-boo-practical-examples-2-a639	https://www.youtube.com/embed/9SGDpanrc8U	0	2	f		255
509	Projects - Part 1	spring-boo-projects-1-7e29	https://www.youtube.com/embed/9SGDpanrc8U	0	1	f		256
510	Projects - Part 2	spring-boo-projects-2-daa1	https://www.youtube.com/embed/9SGDpanrc8U	0	2	f		256
511	Advanced Topics - Part 1	spring-boo-advanced-topics-1-7834	https://www.youtube.com/embed/9SGDpanrc8U	0	1	f		257
512	Advanced Topics - Part 2	spring-boo-advanced-topics-2-3dff	https://www.youtube.com/embed/9SGDpanrc8U	0	2	f		257
513	Introduction - Part 1	nodejs-introduction-1-146d	https://www.youtube.com/embed/7t2alSnE2-I	0	1	f		258
514	Introduction - Part 2	nodejs-introduction-2-7971	https://www.youtube.com/embed/7t2alSnE2-I	0	2	f		258
515	Core Concepts - Part 1	nodejs-core-concepts-1-fe2b	https://www.youtube.com/embed/7t2alSnE2-I	0	1	f		259
516	Core Concepts - Part 2	nodejs-core-concepts-2-842a	https://www.youtube.com/embed/7t2alSnE2-I	0	2	f		259
517	Practical Examples - Part 1	nodejs-practical-examples-1-819b	https://www.youtube.com/embed/7t2alSnE2-I	0	1	f		260
518	Practical Examples - Part 2	nodejs-practical-examples-2-6a8f	https://www.youtube.com/embed/7t2alSnE2-I	0	2	f		260
519	Projects - Part 1	nodejs-projects-1-a114	https://www.youtube.com/embed/7t2alSnE2-I	0	1	f		261
520	Projects - Part 2	nodejs-projects-2-05fc	https://www.youtube.com/embed/7t2alSnE2-I	0	2	f		261
521	Advanced Topics - Part 1	nodejs-advanced-topics-1-08c1	https://www.youtube.com/embed/7t2alSnE2-I	0	1	f		262
522	Advanced Topics - Part 2	nodejs-advanced-topics-2-d999	https://www.youtube.com/embed/7t2alSnE2-I	0	2	f		262
523	Introduction - Part 1	fastapi-hi-introduction-1-b4a7	https://www.youtube.com/embed/GN6n7C9wDzM	0	1	f		263
524	Introduction - Part 2	fastapi-hi-introduction-2-21db	https://www.youtube.com/embed/GN6n7C9wDzM	0	2	f		263
525	Core Concepts - Part 1	fastapi-hi-core-concepts-1-94b5	https://www.youtube.com/embed/GN6n7C9wDzM	0	1	f		264
526	Core Concepts - Part 2	fastapi-hi-core-concepts-2-cab7	https://www.youtube.com/embed/GN6n7C9wDzM	0	2	f		264
527	Practical Examples - Part 1	fastapi-hi-practical-examples-1-54c4	https://www.youtube.com/embed/GN6n7C9wDzM	0	1	f		265
528	Practical Examples - Part 2	fastapi-hi-practical-examples-2-0440	https://www.youtube.com/embed/GN6n7C9wDzM	0	2	f		265
529	Projects - Part 1	fastapi-hi-projects-1-9e18	https://www.youtube.com/embed/GN6n7C9wDzM	0	1	f		266
530	Projects - Part 2	fastapi-hi-projects-2-a557	https://www.youtube.com/embed/GN6n7C9wDzM	0	2	f		266
531	Advanced Topics - Part 1	fastapi-hi-advanced-topics-1-8a93	https://www.youtube.com/embed/GN6n7C9wDzM	0	1	f		267
532	Advanced Topics - Part 2	fastapi-hi-advanced-topics-2-3ea0	https://www.youtube.com/embed/GN6n7C9wDzM	0	2	f		267
533	Introduction - Part 1	frontend-d-introduction-1-9e9b	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		268
534	Introduction - Part 2	frontend-d-introduction-2-c2e3	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		268
535	Core Concepts - Part 1	frontend-d-core-concepts-1-40bc	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		269
536	Core Concepts - Part 2	frontend-d-core-concepts-2-51df	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		269
537	Practical Examples - Part 1	frontend-d-practical-examples-1-c68f	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		270
538	Practical Examples - Part 2	frontend-d-practical-examples-2-208c	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		270
539	Projects - Part 1	frontend-d-projects-1-81ca	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		271
540	Projects - Part 2	frontend-d-projects-2-ce26	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		271
541	Advanced Topics - Part 1	frontend-d-advanced-topics-1-ff92	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		272
542	Advanced Topics - Part 2	frontend-d-advanced-topics-2-497f	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		272
543	Introduction - Part 1	javascript-introduction-1-01f0	https://www.youtube.com/embed/4R4Qp3hCfcY	0	1	f		273
544	Introduction - Part 2	javascript-introduction-2-47a8	https://www.youtube.com/embed/4R4Qp3hCfcY	0	2	f		273
545	Core Concepts - Part 1	javascript-core-concepts-1-ca78	https://www.youtube.com/embed/4R4Qp3hCfcY	0	1	f		274
546	Core Concepts - Part 2	javascript-core-concepts-2-1b16	https://www.youtube.com/embed/4R4Qp3hCfcY	0	2	f		274
547	Practical Examples - Part 1	javascript-practical-examples-1-b312	https://www.youtube.com/embed/4R4Qp3hCfcY	0	1	f		275
548	Practical Examples - Part 2	javascript-practical-examples-2-40e6	https://www.youtube.com/embed/4R4Qp3hCfcY	0	2	f		275
549	Projects - Part 1	javascript-projects-1-536a	https://www.youtube.com/embed/4R4Qp3hCfcY	0	1	f		276
550	Projects - Part 2	javascript-projects-2-7e6d	https://www.youtube.com/embed/4R4Qp3hCfcY	0	2	f		276
551	Advanced Topics - Part 1	javascript-advanced-topics-1-85bd	https://www.youtube.com/embed/4R4Qp3hCfcY	0	1	f		277
552	Advanced Topics - Part 2	javascript-advanced-topics-2-81f7	https://www.youtube.com/embed/4R4Qp3hCfcY	0	2	f		277
553	Introduction - Part 1	angular-en-introduction-1-fe90	https://www.youtube.com/embed/3dHNOWTI7H8	0	1	f		278
554	Introduction - Part 2	angular-en-introduction-2-4a77	https://www.youtube.com/embed/3dHNOWTI7H8	0	2	f		278
555	Core Concepts - Part 1	angular-en-core-concepts-1-e43c	https://www.youtube.com/embed/3dHNOWTI7H8	0	1	f		279
556	Core Concepts - Part 2	angular-en-core-concepts-2-3f65	https://www.youtube.com/embed/3dHNOWTI7H8	0	2	f		279
557	Practical Examples - Part 1	angular-en-practical-examples-1-11fc	https://www.youtube.com/embed/3dHNOWTI7H8	0	1	f		280
558	Practical Examples - Part 2	angular-en-practical-examples-2-f77a	https://www.youtube.com/embed/3dHNOWTI7H8	0	2	f		280
559	Projects - Part 1	angular-en-projects-1-879c	https://www.youtube.com/embed/3dHNOWTI7H8	0	1	f		281
560	Projects - Part 2	angular-en-projects-2-1adc	https://www.youtube.com/embed/3dHNOWTI7H8	0	2	f		281
561	Advanced Topics - Part 1	angular-en-advanced-topics-1-5658	https://www.youtube.com/embed/3dHNOWTI7H8	0	1	f		282
562	Advanced Topics - Part 2	angular-en-advanced-topics-2-61aa	https://www.youtube.com/embed/3dHNOWTI7H8	0	2	f		282
563	Introduction - Part 1	vuejs-com-introduction-1-5429	https://www.youtube.com/embed/4deVCNJq3qc	0	1	f		283
564	Introduction - Part 2	vuejs-com-introduction-2-83a1	https://www.youtube.com/embed/4deVCNJq3qc	0	2	f		283
565	Core Concepts - Part 1	vuejs-com-core-concepts-1-176c	https://www.youtube.com/embed/4deVCNJq3qc	0	1	f		284
566	Core Concepts - Part 2	vuejs-com-core-concepts-2-16aa	https://www.youtube.com/embed/4deVCNJq3qc	0	2	f		284
567	Practical Examples - Part 1	vuejs-com-practical-examples-1-2605	https://www.youtube.com/embed/4deVCNJq3qc	0	1	f		285
568	Practical Examples - Part 2	vuejs-com-practical-examples-2-d3cb	https://www.youtube.com/embed/4deVCNJq3qc	0	2	f		285
569	Projects - Part 1	vuejs-com-projects-1-2e66	https://www.youtube.com/embed/4deVCNJq3qc	0	1	f		286
570	Projects - Part 2	vuejs-com-projects-2-1f4c	https://www.youtube.com/embed/4deVCNJq3qc	0	2	f		286
571	Advanced Topics - Part 1	vuejs-com-advanced-topics-1-2475	https://www.youtube.com/embed/4deVCNJq3qc	0	1	f		287
572	Advanced Topics - Part 2	vuejs-com-advanced-topics-2-8e4b	https://www.youtube.com/embed/4deVCNJq3qc	0	2	f		287
573	Introduction - Part 1	html-css-introduction-1-9e5c	https://www.youtube.com/embed/kUMe1FH4CHE	0	1	f		288
574	Introduction - Part 2	html-css-introduction-2-dec5	https://www.youtube.com/embed/kUMe1FH4CHE	0	2	f		288
575	Core Concepts - Part 1	html-css-core-concepts-1-b8c0	https://www.youtube.com/embed/kUMe1FH4CHE	0	1	f		289
576	Core Concepts - Part 2	html-css-core-concepts-2-f5f7	https://www.youtube.com/embed/kUMe1FH4CHE	0	2	f		289
577	Practical Examples - Part 1	html-css-practical-examples-1-8726	https://www.youtube.com/embed/kUMe1FH4CHE	0	1	f		290
578	Practical Examples - Part 2	html-css-practical-examples-2-b5c3	https://www.youtube.com/embed/kUMe1FH4CHE	0	2	f		290
579	Projects - Part 1	html-css-projects-1-1cf9	https://www.youtube.com/embed/kUMe1FH4CHE	0	1	f		291
580	Projects - Part 2	html-css-projects-2-df42	https://www.youtube.com/embed/kUMe1FH4CHE	0	2	f		291
581	Advanced Topics - Part 1	html-css-advanced-topics-1-bb47	https://www.youtube.com/embed/kUMe1FH4CHE	0	1	f		292
582	Advanced Topics - Part 2	html-css-advanced-topics-2-26af	https://www.youtube.com/embed/kUMe1FH4CHE	0	2	f		292
583	Introduction - Part 1	mobile-app-introduction-1-fd87	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		293
584	Introduction - Part 2	mobile-app-introduction-2-b9d4	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		293
585	Core Concepts - Part 1	mobile-app-core-concepts-1-8b30	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		294
586	Core Concepts - Part 2	mobile-app-core-concepts-2-5270	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		294
587	Practical Examples - Part 1	mobile-app-practical-examples-1-ef42	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		295
588	Practical Examples - Part 2	mobile-app-practical-examples-2-05f8	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		295
589	Projects - Part 1	mobile-app-projects-1-6f9e	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		296
590	Projects - Part 2	mobile-app-projects-2-677d	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		296
591	Advanced Topics - Part 1	mobile-app-advanced-topics-1-d7d6	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		297
592	Advanced Topics - Part 2	mobile-app-advanced-topics-2-66fb	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		297
593	Introduction - Part 1	android-wi-introduction-1-3f83	https://www.youtube.com/embed/IZ7D8FZ_XbI	0	1	f		298
594	Introduction - Part 2	android-wi-introduction-2-cc5e	https://www.youtube.com/embed/IZ7D8FZ_XbI	0	2	f		298
595	Core Concepts - Part 1	android-wi-core-concepts-1-c5fc	https://www.youtube.com/embed/IZ7D8FZ_XbI	0	1	f		299
596	Core Concepts - Part 2	android-wi-core-concepts-2-7fa3	https://www.youtube.com/embed/IZ7D8FZ_XbI	0	2	f		299
597	Practical Examples - Part 1	android-wi-practical-examples-1-b2bd	https://www.youtube.com/embed/IZ7D8FZ_XbI	0	1	f		300
598	Practical Examples - Part 2	android-wi-practical-examples-2-e635	https://www.youtube.com/embed/IZ7D8FZ_XbI	0	2	f		300
599	Projects - Part 1	android-wi-projects-1-822c	https://www.youtube.com/embed/IZ7D8FZ_XbI	0	1	f		301
600	Projects - Part 2	android-wi-projects-2-7683	https://www.youtube.com/embed/IZ7D8FZ_XbI	0	2	f		301
601	Advanced Topics - Part 1	android-wi-advanced-topics-1-a36b	https://www.youtube.com/embed/IZ7D8FZ_XbI	0	1	f		302
602	Advanced Topics - Part 2	android-wi-advanced-topics-2-49c8	https://www.youtube.com/embed/IZ7D8FZ_XbI	0	2	f		302
603	Introduction - Part 1	ios-with-s-introduction-1-5c10	https://www.youtube.com/embed/nX7VQNqJ8_o	0	1	f		303
604	Introduction - Part 2	ios-with-s-introduction-2-3e3b	https://www.youtube.com/embed/nX7VQNqJ8_o	0	2	f		303
605	Core Concepts - Part 1	ios-with-s-core-concepts-1-9819	https://www.youtube.com/embed/nX7VQNqJ8_o	0	1	f		304
606	Core Concepts - Part 2	ios-with-s-core-concepts-2-95ee	https://www.youtube.com/embed/nX7VQNqJ8_o	0	2	f		304
607	Practical Examples - Part 1	ios-with-s-practical-examples-1-5fa5	https://www.youtube.com/embed/nX7VQNqJ8_o	0	1	f		305
608	Practical Examples - Part 2	ios-with-s-practical-examples-2-a4a7	https://www.youtube.com/embed/nX7VQNqJ8_o	0	2	f		305
609	Projects - Part 1	ios-with-s-projects-1-7664	https://www.youtube.com/embed/nX7VQNqJ8_o	0	1	f		306
610	Projects - Part 2	ios-with-s-projects-2-729f	https://www.youtube.com/embed/nX7VQNqJ8_o	0	2	f		306
611	Advanced Topics - Part 1	ios-with-s-advanced-topics-1-cc5a	https://www.youtube.com/embed/nX7VQNqJ8_o	0	1	f		307
612	Advanced Topics - Part 2	ios-with-s-advanced-topics-2-81f7	https://www.youtube.com/embed/nX7VQNqJ8_o	0	2	f		307
613	Introduction - Part 1	flutter-cr-introduction-1-bd9b	https://www.youtube.com/embed/1ukSR1GRtMU	0	1	f		308
614	Introduction - Part 2	flutter-cr-introduction-2-aa3d	https://www.youtube.com/embed/1ukSR1GRtMU	0	2	f		308
615	Core Concepts - Part 1	flutter-cr-core-concepts-1-be56	https://www.youtube.com/embed/1ukSR1GRtMU	0	1	f		309
616	Core Concepts - Part 2	flutter-cr-core-concepts-2-c76b	https://www.youtube.com/embed/1ukSR1GRtMU	0	2	f		309
617	Practical Examples - Part 1	flutter-cr-practical-examples-1-3365	https://www.youtube.com/embed/1ukSR1GRtMU	0	1	f		310
618	Practical Examples - Part 2	flutter-cr-practical-examples-2-86ca	https://www.youtube.com/embed/1ukSR1GRtMU	0	2	f		310
619	Projects - Part 1	flutter-cr-projects-1-42fd	https://www.youtube.com/embed/1ukSR1GRtMU	0	1	f		311
620	Projects - Part 2	flutter-cr-projects-2-57a7	https://www.youtube.com/embed/1ukSR1GRtMU	0	2	f		311
621	Advanced Topics - Part 1	flutter-cr-advanced-topics-1-c7a7	https://www.youtube.com/embed/1ukSR1GRtMU	0	1	f		312
622	Advanced Topics - Part 2	flutter-cr-advanced-topics-2-d0f4	https://www.youtube.com/embed/1ukSR1GRtMU	0	2	f		312
623	Introduction - Part 1	react-nati-introduction-1-ec5c	https://www.youtube.com/embed/0-S5a0eXPoc	0	1	f		313
624	Introduction - Part 2	react-nati-introduction-2-2180	https://www.youtube.com/embed/0-S5a0eXPoc	0	2	f		313
625	Core Concepts - Part 1	react-nati-core-concepts-1-73ed	https://www.youtube.com/embed/0-S5a0eXPoc	0	1	f		314
626	Core Concepts - Part 2	react-nati-core-concepts-2-3009	https://www.youtube.com/embed/0-S5a0eXPoc	0	2	f		314
627	Practical Examples - Part 1	react-nati-practical-examples-1-9478	https://www.youtube.com/embed/0-S5a0eXPoc	0	1	f		315
628	Practical Examples - Part 2	react-nati-practical-examples-2-84eb	https://www.youtube.com/embed/0-S5a0eXPoc	0	2	f		315
629	Projects - Part 1	react-nati-projects-1-fae7	https://www.youtube.com/embed/0-S5a0eXPoc	0	1	f		316
630	Projects - Part 2	react-nati-projects-2-fd2f	https://www.youtube.com/embed/0-S5a0eXPoc	0	2	f		316
631	Advanced Topics - Part 1	react-nati-advanced-topics-1-372d	https://www.youtube.com/embed/0-S5a0eXPoc	0	1	f		317
632	Advanced Topics - Part 2	react-nati-advanced-topics-2-ce83	https://www.youtube.com/embed/0-S5a0eXPoc	0	2	f		317
633	Introduction - Part 1	programmin-introduction-1-b954	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		318
634	Introduction - Part 2	programmin-introduction-2-e5d4	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		318
635	Core Concepts - Part 1	programmin-core-concepts-1-0973	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		319
636	Core Concepts - Part 2	programmin-core-concepts-2-2a3a	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		319
637	Practical Examples - Part 1	programmin-practical-examples-1-ccca	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		320
638	Practical Examples - Part 2	programmin-practical-examples-2-9dc2	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		320
639	Projects - Part 1	programmin-projects-1-6219	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		321
640	Projects - Part 2	programmin-projects-2-2e01	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		321
641	Advanced Topics - Part 1	programmin-advanced-topics-1-c40d	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		322
642	Advanced Topics - Part 2	programmin-advanced-topics-2-916c	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		322
643	Introduction - Part 1	python-pro-introduction-1-6d4c	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		323
644	Introduction - Part 2	python-pro-introduction-2-ff76	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		323
645	Core Concepts - Part 1	python-pro-core-concepts-1-88db	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		324
646	Core Concepts - Part 2	python-pro-core-concepts-2-722a	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		324
647	Practical Examples - Part 1	python-pro-practical-examples-1-4559	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		325
648	Practical Examples - Part 2	python-pro-practical-examples-2-5b81	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		325
649	Projects - Part 1	python-pro-projects-1-61e5	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		326
650	Projects - Part 2	python-pro-projects-2-8cee	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		326
651	Advanced Topics - Part 1	python-pro-advanced-topics-1-c481	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		327
652	Advanced Topics - Part 2	python-pro-advanced-topics-2-d5cf	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		327
653	Introduction - Part 1	java-progr-introduction-1-c809	https://www.youtube.com/embed/eIrMbAQSU34	0	1	f		328
654	Introduction - Part 2	java-progr-introduction-2-99f3	https://www.youtube.com/embed/eIrMbAQSU34	0	2	f		328
655	Core Concepts - Part 1	java-progr-core-concepts-1-f269	https://www.youtube.com/embed/eIrMbAQSU34	0	1	f		329
656	Core Concepts - Part 2	java-progr-core-concepts-2-0460	https://www.youtube.com/embed/eIrMbAQSU34	0	2	f		329
657	Practical Examples - Part 1	java-progr-practical-examples-1-3e39	https://www.youtube.com/embed/eIrMbAQSU34	0	1	f		330
658	Practical Examples - Part 2	java-progr-practical-examples-2-ce83	https://www.youtube.com/embed/eIrMbAQSU34	0	2	f		330
659	Projects - Part 1	java-progr-projects-1-b30a	https://www.youtube.com/embed/eIrMbAQSU34	0	1	f		331
660	Projects - Part 2	java-progr-projects-2-36a3	https://www.youtube.com/embed/eIrMbAQSU34	0	2	f		331
661	Advanced Topics - Part 1	java-progr-advanced-topics-1-83ab	https://www.youtube.com/embed/eIrMbAQSU34	0	1	f		332
662	Advanced Topics - Part 2	java-progr-advanced-topics-2-9a9c	https://www.youtube.com/embed/eIrMbAQSU34	0	2	f		332
663	Introduction - Part 1	c-program-introduction-1-5365	https://www.youtube.com/embed/GhQdlIFylQ8	0	1	f		333
664	Introduction - Part 2	c-program-introduction-2-2b7a	https://www.youtube.com/embed/GhQdlIFylQ8	0	2	f		333
665	Core Concepts - Part 1	c-program-core-concepts-1-76de	https://www.youtube.com/embed/GhQdlIFylQ8	0	1	f		334
666	Core Concepts - Part 2	c-program-core-concepts-2-eb03	https://www.youtube.com/embed/GhQdlIFylQ8	0	2	f		334
667	Practical Examples - Part 1	c-program-practical-examples-1-2915	https://www.youtube.com/embed/GhQdlIFylQ8	0	1	f		335
668	Practical Examples - Part 2	c-program-practical-examples-2-32c3	https://www.youtube.com/embed/GhQdlIFylQ8	0	2	f		335
669	Projects - Part 1	c-program-projects-1-3c6b	https://www.youtube.com/embed/GhQdlIFylQ8	0	1	f		336
670	Projects - Part 2	c-program-projects-2-040f	https://www.youtube.com/embed/GhQdlIFylQ8	0	2	f		336
671	Advanced Topics - Part 1	c-program-advanced-topics-1-b915	https://www.youtube.com/embed/GhQdlIFylQ8	0	1	f		337
672	Advanced Topics - Part 2	c-program-advanced-topics-2-02ca	https://www.youtube.com/embed/GhQdlIFylQ8	0	2	f		337
673	Introduction - Part 1	advanced-p-introduction-1-bf05	https://www.youtube.com/embed/8ZtInClXe1Q	0	1	f		338
674	Introduction - Part 2	advanced-p-introduction-2-977f	https://www.youtube.com/embed/8ZtInClXe1Q	0	2	f		338
675	Core Concepts - Part 1	advanced-p-core-concepts-1-66d8	https://www.youtube.com/embed/8ZtInClXe1Q	0	1	f		339
676	Core Concepts - Part 2	advanced-p-core-concepts-2-2b89	https://www.youtube.com/embed/8ZtInClXe1Q	0	2	f		339
677	Practical Examples - Part 1	advanced-p-practical-examples-1-a26f	https://www.youtube.com/embed/8ZtInClXe1Q	0	1	f		340
678	Practical Examples - Part 2	advanced-p-practical-examples-2-623a	https://www.youtube.com/embed/8ZtInClXe1Q	0	2	f		340
679	Projects - Part 1	advanced-p-projects-1-8d01	https://www.youtube.com/embed/8ZtInClXe1Q	0	1	f		341
680	Projects - Part 2	advanced-p-projects-2-3c17	https://www.youtube.com/embed/8ZtInClXe1Q	0	2	f		341
681	Advanced Topics - Part 1	advanced-p-advanced-topics-1-ce1f	https://www.youtube.com/embed/8ZtInClXe1Q	0	1	f		342
682	Advanced Topics - Part 2	advanced-p-advanced-topics-2-9093	https://www.youtube.com/embed/8ZtInClXe1Q	0	2	f		342
683	Introduction - Part 1	data-scien-introduction-1-490b	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		343
684	Introduction - Part 2	data-scien-introduction-2-8bf9	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		343
685	Core Concepts - Part 1	data-scien-core-concepts-1-4cf6	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		344
686	Core Concepts - Part 2	data-scien-core-concepts-2-d252	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		344
687	Practical Examples - Part 1	data-scien-practical-examples-1-fc01	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		345
688	Practical Examples - Part 2	data-scien-practical-examples-2-08f8	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		345
689	Projects - Part 1	data-scien-projects-1-eeed	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		346
690	Projects - Part 2	data-scien-projects-2-efeb	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		346
691	Advanced Topics - Part 1	data-scien-advanced-topics-1-84d8	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		347
692	Advanced Topics - Part 2	data-scien-advanced-topics-2-d27b	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		347
693	Introduction - Part 1	machine-le-introduction-1-9c73	https://www.youtube.com/embed/0FgDpuS9HzU	0	1	f		348
694	Introduction - Part 2	machine-le-introduction-2-35b7	https://www.youtube.com/embed/0FgDpuS9HzU	0	2	f		348
695	Core Concepts - Part 1	machine-le-core-concepts-1-16c2	https://www.youtube.com/embed/0FgDpuS9HzU	0	1	f		349
696	Core Concepts - Part 2	machine-le-core-concepts-2-cc54	https://www.youtube.com/embed/0FgDpuS9HzU	0	2	f		349
697	Practical Examples - Part 1	machine-le-practical-examples-1-6a0d	https://www.youtube.com/embed/0FgDpuS9HzU	0	1	f		350
698	Practical Examples - Part 2	machine-le-practical-examples-2-b9e8	https://www.youtube.com/embed/0FgDpuS9HzU	0	2	f		350
699	Projects - Part 1	machine-le-projects-1-7ce1	https://www.youtube.com/embed/0FgDpuS9HzU	0	1	f		351
700	Projects - Part 2	machine-le-projects-2-a74e	https://www.youtube.com/embed/0FgDpuS9HzU	0	2	f		351
701	Advanced Topics - Part 1	machine-le-advanced-topics-1-16e0	https://www.youtube.com/embed/0FgDpuS9HzU	0	1	f		352
702	Advanced Topics - Part 2	machine-le-advanced-topics-2-464e	https://www.youtube.com/embed/0FgDpuS9HzU	0	2	f		352
703	Introduction - Part 1	deep-learn-introduction-1-5087	https://www.youtube.com/embed/aircAruvnKk	0	1	f		353
704	Introduction - Part 2	deep-learn-introduction-2-ccd9	https://www.youtube.com/embed/aircAruvnKk	0	2	f		353
705	Core Concepts - Part 1	deep-learn-core-concepts-1-e3a3	https://www.youtube.com/embed/aircAruvnKk	0	1	f		354
706	Core Concepts - Part 2	deep-learn-core-concepts-2-4f7c	https://www.youtube.com/embed/aircAruvnKk	0	2	f		354
707	Practical Examples - Part 1	deep-learn-practical-examples-1-4b59	https://www.youtube.com/embed/aircAruvnKk	0	1	f		355
708	Practical Examples - Part 2	deep-learn-practical-examples-2-6fc1	https://www.youtube.com/embed/aircAruvnKk	0	2	f		355
709	Projects - Part 1	deep-learn-projects-1-433d	https://www.youtube.com/embed/aircAruvnKk	0	1	f		356
710	Projects - Part 2	deep-learn-projects-2-24c1	https://www.youtube.com/embed/aircAruvnKk	0	2	f		356
711	Advanced Topics - Part 1	deep-learn-advanced-topics-1-9c1d	https://www.youtube.com/embed/aircAruvnKk	0	1	f		357
712	Advanced Topics - Part 2	deep-learn-advanced-topics-2-9105	https://www.youtube.com/embed/aircAruvnKk	0	2	f		357
713	Introduction - Part 1	data-scien-introduction-1-f7a9	https://www.youtube.com/embed/LHBE6Q9XlzI	0	1	f		358
714	Introduction - Part 2	data-scien-introduction-2-6f51	https://www.youtube.com/embed/LHBE6Q9XlzI	0	2	f		358
715	Core Concepts - Part 1	data-scien-core-concepts-1-b9aa	https://www.youtube.com/embed/LHBE6Q9XlzI	0	1	f		359
716	Core Concepts - Part 2	data-scien-core-concepts-2-d232	https://www.youtube.com/embed/LHBE6Q9XlzI	0	2	f		359
717	Practical Examples - Part 1	data-scien-practical-examples-1-a049	https://www.youtube.com/embed/LHBE6Q9XlzI	0	1	f		360
718	Practical Examples - Part 2	data-scien-practical-examples-2-301c	https://www.youtube.com/embed/LHBE6Q9XlzI	0	2	f		360
719	Projects - Part 1	data-scien-projects-1-6495	https://www.youtube.com/embed/LHBE6Q9XlzI	0	1	f		361
720	Projects - Part 2	data-scien-projects-2-d236	https://www.youtube.com/embed/LHBE6Q9XlzI	0	2	f		361
721	Advanced Topics - Part 1	data-scien-advanced-topics-1-f6bc	https://www.youtube.com/embed/LHBE6Q9XlzI	0	1	f		362
722	Advanced Topics - Part 2	data-scien-advanced-topics-2-48f5	https://www.youtube.com/embed/LHBE6Q9XlzI	0	2	f		362
723	Introduction - Part 1	data-visua-introduction-1-e5de	https://www.youtube.com/embed/6n2CfjC6D2w	0	1	f		363
724	Introduction - Part 2	data-visua-introduction-2-b8b4	https://www.youtube.com/embed/6n2CfjC6D2w	0	2	f		363
725	Core Concepts - Part 1	data-visua-core-concepts-1-2b27	https://www.youtube.com/embed/6n2CfjC6D2w	0	1	f		364
726	Core Concepts - Part 2	data-visua-core-concepts-2-4dd4	https://www.youtube.com/embed/6n2CfjC6D2w	0	2	f		364
727	Practical Examples - Part 1	data-visua-practical-examples-1-2c7e	https://www.youtube.com/embed/6n2CfjC6D2w	0	1	f		365
728	Practical Examples - Part 2	data-visua-practical-examples-2-be00	https://www.youtube.com/embed/6n2CfjC6D2w	0	2	f		365
729	Projects - Part 1	data-visua-projects-1-c343	https://www.youtube.com/embed/6n2CfjC6D2w	0	1	f		366
730	Projects - Part 2	data-visua-projects-2-94ea	https://www.youtube.com/embed/6n2CfjC6D2w	0	2	f		366
731	Advanced Topics - Part 1	data-visua-advanced-topics-1-14ef	https://www.youtube.com/embed/6n2CfjC6D2w	0	1	f		367
732	Advanced Topics - Part 2	data-visua-advanced-topics-2-8017	https://www.youtube.com/embed/6n2CfjC6D2w	0	2	f		367
733	Introduction - Part 1	devops-fun-introduction-1-7335	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		368
734	Introduction - Part 2	devops-fun-introduction-2-09d8	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		368
735	Core Concepts - Part 1	devops-fun-core-concepts-1-6111	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		369
736	Core Concepts - Part 2	devops-fun-core-concepts-2-2f53	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		369
737	Practical Examples - Part 1	devops-fun-practical-examples-1-6cb3	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		370
738	Practical Examples - Part 2	devops-fun-practical-examples-2-abd3	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		370
739	Projects - Part 1	devops-fun-projects-1-5b13	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		371
740	Projects - Part 2	devops-fun-projects-2-bde6	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		371
741	Advanced Topics - Part 1	devops-fun-advanced-topics-1-4900	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		372
742	Advanced Topics - Part 2	devops-fun-advanced-topics-2-8ce4	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		372
743	Introduction - Part 1	docker-k-introduction-1-0efa	https://www.youtube.com/embed/X48VuDVv0do	0	1	f		373
744	Introduction - Part 2	docker-k-introduction-2-a04a	https://www.youtube.com/embed/X48VuDVv0do	0	2	f		373
745	Core Concepts - Part 1	docker-k-core-concepts-1-c86f	https://www.youtube.com/embed/X48VuDVv0do	0	1	f		374
746	Core Concepts - Part 2	docker-k-core-concepts-2-52be	https://www.youtube.com/embed/X48VuDVv0do	0	2	f		374
747	Practical Examples - Part 1	docker-k-practical-examples-1-d374	https://www.youtube.com/embed/X48VuDVv0do	0	1	f		375
748	Practical Examples - Part 2	docker-k-practical-examples-2-f0f5	https://www.youtube.com/embed/X48VuDVv0do	0	2	f		375
749	Projects - Part 1	docker-k-projects-1-3018	https://www.youtube.com/embed/X48VuDVv0do	0	1	f		376
750	Projects - Part 2	docker-k-projects-2-832c	https://www.youtube.com/embed/X48VuDVv0do	0	2	f		376
751	Advanced Topics - Part 1	docker-k-advanced-topics-1-6bae	https://www.youtube.com/embed/X48VuDVv0do	0	1	f		377
752	Advanced Topics - Part 2	docker-k-advanced-topics-2-95c6	https://www.youtube.com/embed/X48VuDVv0do	0	2	f		377
753	Introduction - Part 1	terraform-introduction-1-b471	https://www.youtube.com/embed/SLB_c_ayRMo	0	1	f		378
754	Introduction - Part 2	terraform-introduction-2-e81c	https://www.youtube.com/embed/SLB_c_ayRMo	0	2	f		378
755	Core Concepts - Part 1	terraform-core-concepts-1-d0fa	https://www.youtube.com/embed/SLB_c_ayRMo	0	1	f		379
756	Core Concepts - Part 2	terraform-core-concepts-2-b84f	https://www.youtube.com/embed/SLB_c_ayRMo	0	2	f		379
757	Practical Examples - Part 1	terraform-practical-examples-1-cda1	https://www.youtube.com/embed/SLB_c_ayRMo	0	1	f		380
758	Practical Examples - Part 2	terraform-practical-examples-2-5aec	https://www.youtube.com/embed/SLB_c_ayRMo	0	2	f		380
759	Projects - Part 1	terraform-projects-1-e308	https://www.youtube.com/embed/SLB_c_ayRMo	0	1	f		381
760	Projects - Part 2	terraform-projects-2-0b85	https://www.youtube.com/embed/SLB_c_ayRMo	0	2	f		381
761	Advanced Topics - Part 1	terraform-advanced-topics-1-f8e8	https://www.youtube.com/embed/SLB_c_ayRMo	0	1	f		382
762	Advanced Topics - Part 2	terraform-advanced-topics-2-a9dc	https://www.youtube.com/embed/SLB_c_ayRMo	0	2	f		382
763	Introduction - Part 1	cicd-pipe-introduction-1-4daf	https://www.youtube.com/embed/42UP1fxi2SY	0	1	f		383
764	Introduction - Part 2	cicd-pipe-introduction-2-4c72	https://www.youtube.com/embed/42UP1fxi2SY	0	2	f		383
765	Core Concepts - Part 1	cicd-pipe-core-concepts-1-bc44	https://www.youtube.com/embed/42UP1fxi2SY	0	1	f		384
766	Core Concepts - Part 2	cicd-pipe-core-concepts-2-ebe3	https://www.youtube.com/embed/42UP1fxi2SY	0	2	f		384
767	Practical Examples - Part 1	cicd-pipe-practical-examples-1-54be	https://www.youtube.com/embed/42UP1fxi2SY	0	1	f		385
768	Practical Examples - Part 2	cicd-pipe-practical-examples-2-ec28	https://www.youtube.com/embed/42UP1fxi2SY	0	2	f		385
769	Projects - Part 1	cicd-pipe-projects-1-21dc	https://www.youtube.com/embed/42UP1fxi2SY	0	1	f		386
770	Projects - Part 2	cicd-pipe-projects-2-e50f	https://www.youtube.com/embed/42UP1fxi2SY	0	2	f		386
771	Advanced Topics - Part 1	cicd-pipe-advanced-topics-1-110a	https://www.youtube.com/embed/42UP1fxi2SY	0	1	f		387
772	Advanced Topics - Part 2	cicd-pipe-advanced-topics-2-bf17	https://www.youtube.com/embed/42UP1fxi2SY	0	2	f		387
773	Introduction - Part 1	docker-k-introduction-1-222c	https://www.youtube.com/embed/3Z80WQlIq9Q	0	1	f		388
774	Introduction - Part 2	docker-k-introduction-2-6fee	https://www.youtube.com/embed/3Z80WQlIq9Q	0	2	f		388
775	Core Concepts - Part 1	docker-k-core-concepts-1-d8f2	https://www.youtube.com/embed/3Z80WQlIq9Q	0	1	f		389
776	Core Concepts - Part 2	docker-k-core-concepts-2-39d3	https://www.youtube.com/embed/3Z80WQlIq9Q	0	2	f		389
777	Practical Examples - Part 1	docker-k-practical-examples-1-9672	https://www.youtube.com/embed/3Z80WQlIq9Q	0	1	f		390
778	Practical Examples - Part 2	docker-k-practical-examples-2-261a	https://www.youtube.com/embed/3Z80WQlIq9Q	0	2	f		390
779	Projects - Part 1	docker-k-projects-1-a9f8	https://www.youtube.com/embed/3Z80WQlIq9Q	0	1	f		391
780	Projects - Part 2	docker-k-projects-2-84fb	https://www.youtube.com/embed/3Z80WQlIq9Q	0	2	f		391
781	Advanced Topics - Part 1	docker-k-advanced-topics-1-8077	https://www.youtube.com/embed/3Z80WQlIq9Q	0	1	f		392
782	Advanced Topics - Part 2	docker-k-advanced-topics-2-efaa	https://www.youtube.com/embed/3Z80WQlIq9Q	0	2	f		392
783	Introduction - Part 1	database-d-introduction-1-13ac	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		393
784	Introduction - Part 2	database-d-introduction-2-f015	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		393
785	Core Concepts - Part 1	database-d-core-concepts-1-1cbe	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		394
786	Core Concepts - Part 2	database-d-core-concepts-2-0101	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		394
787	Practical Examples - Part 1	database-d-practical-examples-1-1bf0	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		395
788	Practical Examples - Part 2	database-d-practical-examples-2-c499	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		395
789	Projects - Part 1	database-d-projects-1-ff73	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		396
790	Projects - Part 2	database-d-projects-2-d4cf	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		396
791	Advanced Topics - Part 1	database-d-advanced-topics-1-75ee	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		397
792	Advanced Topics - Part 2	database-d-advanced-topics-2-68cd	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		397
793	Introduction - Part 1	postgresql-introduction-1-999f	https://www.youtube.com/embed/0oUO3ZraGL4	0	1	f		398
794	Introduction - Part 2	postgresql-introduction-2-a509	https://www.youtube.com/embed/0oUO3ZraGL4	0	2	f		398
795	Core Concepts - Part 1	postgresql-core-concepts-1-6e84	https://www.youtube.com/embed/0oUO3ZraGL4	0	1	f		399
796	Core Concepts - Part 2	postgresql-core-concepts-2-12e6	https://www.youtube.com/embed/0oUO3ZraGL4	0	2	f		399
797	Practical Examples - Part 1	postgresql-practical-examples-1-3ca9	https://www.youtube.com/embed/0oUO3ZraGL4	0	1	f		400
798	Practical Examples - Part 2	postgresql-practical-examples-2-b250	https://www.youtube.com/embed/0oUO3ZraGL4	0	2	f		400
799	Projects - Part 1	postgresql-projects-1-a09f	https://www.youtube.com/embed/0oUO3ZraGL4	0	1	f		401
800	Projects - Part 2	postgresql-projects-2-9cf5	https://www.youtube.com/embed/0oUO3ZraGL4	0	2	f		401
801	Advanced Topics - Part 1	postgresql-advanced-topics-1-0830	https://www.youtube.com/embed/0oUO3ZraGL4	0	1	f		402
802	Advanced Topics - Part 2	postgresql-advanced-topics-2-3be0	https://www.youtube.com/embed/0oUO3ZraGL4	0	2	f		402
803	Introduction - Part 1	mongodb-fo-introduction-1-c632	https://www.youtube.com/embed/EX3kD9HN_X0	0	1	f		403
804	Introduction - Part 2	mongodb-fo-introduction-2-25f5	https://www.youtube.com/embed/EX3kD9HN_X0	0	2	f		403
805	Core Concepts - Part 1	mongodb-fo-core-concepts-1-63eb	https://www.youtube.com/embed/EX3kD9HN_X0	0	1	f		404
806	Core Concepts - Part 2	mongodb-fo-core-concepts-2-1b51	https://www.youtube.com/embed/EX3kD9HN_X0	0	2	f		404
807	Practical Examples - Part 1	mongodb-fo-practical-examples-1-8e8d	https://www.youtube.com/embed/EX3kD9HN_X0	0	1	f		405
808	Practical Examples - Part 2	mongodb-fo-practical-examples-2-0af2	https://www.youtube.com/embed/EX3kD9HN_X0	0	2	f		405
809	Projects - Part 1	mongodb-fo-projects-1-29eb	https://www.youtube.com/embed/EX3kD9HN_X0	0	1	f		406
810	Projects - Part 2	mongodb-fo-projects-2-a608	https://www.youtube.com/embed/EX3kD9HN_X0	0	2	f		406
811	Advanced Topics - Part 1	mongodb-fo-advanced-topics-1-87f9	https://www.youtube.com/embed/EX3kD9HN_X0	0	1	f		407
812	Advanced Topics - Part 2	mongodb-fo-advanced-topics-2-4614	https://www.youtube.com/embed/EX3kD9HN_X0	0	2	f		407
813	Introduction - Part 1	sql-data-introduction-1-4e43	https://www.youtube.com/embed/9Pzj7Aj25lw	0	1	f		408
814	Introduction - Part 2	sql-data-introduction-2-e23b	https://www.youtube.com/embed/9Pzj7Aj25lw	0	2	f		408
815	Core Concepts - Part 1	sql-data-core-concepts-1-e3d6	https://www.youtube.com/embed/9Pzj7Aj25lw	0	1	f		409
816	Core Concepts - Part 2	sql-data-core-concepts-2-581a	https://www.youtube.com/embed/9Pzj7Aj25lw	0	2	f		409
817	Practical Examples - Part 1	sql-data-practical-examples-1-9867	https://www.youtube.com/embed/9Pzj7Aj25lw	0	1	f		410
818	Practical Examples - Part 2	sql-data-practical-examples-2-bead	https://www.youtube.com/embed/9Pzj7Aj25lw	0	2	f		410
819	Projects - Part 1	sql-data-projects-1-1891	https://www.youtube.com/embed/9Pzj7Aj25lw	0	1	f		411
820	Projects - Part 2	sql-data-projects-2-dfc6	https://www.youtube.com/embed/9Pzj7Aj25lw	0	2	f		411
821	Advanced Topics - Part 1	sql-data-advanced-topics-1-5848	https://www.youtube.com/embed/9Pzj7Aj25lw	0	1	f		412
822	Advanced Topics - Part 2	sql-data-advanced-topics-2-f662	https://www.youtube.com/embed/9Pzj7Aj25lw	0	2	f		412
823	Introduction - Part 1	redis-ca-introduction-1-98b8	https://www.youtube.com/embed/3lweG9Vq59A	0	1	f		413
824	Introduction - Part 2	redis-ca-introduction-2-af59	https://www.youtube.com/embed/3lweG9Vq59A	0	2	f		413
825	Core Concepts - Part 1	redis-ca-core-concepts-1-2d99	https://www.youtube.com/embed/3lweG9Vq59A	0	1	f		414
826	Core Concepts - Part 2	redis-ca-core-concepts-2-29a5	https://www.youtube.com/embed/3lweG9Vq59A	0	2	f		414
827	Practical Examples - Part 1	redis-ca-practical-examples-1-0500	https://www.youtube.com/embed/3lweG9Vq59A	0	1	f		415
828	Practical Examples - Part 2	redis-ca-practical-examples-2-6d3b	https://www.youtube.com/embed/3lweG9Vq59A	0	2	f		415
829	Projects - Part 1	redis-ca-projects-1-ff38	https://www.youtube.com/embed/3lweG9Vq59A	0	1	f		416
830	Projects - Part 2	redis-ca-projects-2-16b5	https://www.youtube.com/embed/3lweG9Vq59A	0	2	f		416
831	Advanced Topics - Part 1	redis-ca-advanced-topics-1-2392	https://www.youtube.com/embed/3lweG9Vq59A	0	1	f		417
832	Advanced Topics - Part 2	redis-ca-advanced-topics-2-d406	https://www.youtube.com/embed/3lweG9Vq59A	0	2	f		417
833	Introduction - Part 1	cybersecur-introduction-1-995a	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		418
834	Introduction - Part 2	cybersecur-introduction-2-bd98	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		418
835	Core Concepts - Part 1	cybersecur-core-concepts-1-43e7	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		419
836	Core Concepts - Part 2	cybersecur-core-concepts-2-2dd8	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		419
837	Practical Examples - Part 1	cybersecur-practical-examples-1-fc20	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		420
838	Practical Examples - Part 2	cybersecur-practical-examples-2-cd65	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		420
839	Projects - Part 1	cybersecur-projects-1-ecd8	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		421
840	Projects - Part 2	cybersecur-projects-2-29ca	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		421
841	Advanced Topics - Part 1	cybersecur-advanced-topics-1-6a12	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		422
842	Advanced Topics - Part 2	cybersecur-advanced-topics-2-32f9	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		422
843	Introduction - Part 1	network-se-introduction-1-5435	https://www.youtube.com/embed/9G4xEPrJ_yI	0	1	f		423
844	Introduction - Part 2	network-se-introduction-2-e07d	https://www.youtube.com/embed/9G4xEPrJ_yI	0	2	f		423
845	Core Concepts - Part 1	network-se-core-concepts-1-8493	https://www.youtube.com/embed/9G4xEPrJ_yI	0	1	f		424
846	Core Concepts - Part 2	network-se-core-concepts-2-167e	https://www.youtube.com/embed/9G4xEPrJ_yI	0	2	f		424
847	Practical Examples - Part 1	network-se-practical-examples-1-8d0b	https://www.youtube.com/embed/9G4xEPrJ_yI	0	1	f		425
848	Practical Examples - Part 2	network-se-practical-examples-2-883f	https://www.youtube.com/embed/9G4xEPrJ_yI	0	2	f		425
849	Projects - Part 1	network-se-projects-1-3ac6	https://www.youtube.com/embed/9G4xEPrJ_yI	0	1	f		426
850	Projects - Part 2	network-se-projects-2-d2e4	https://www.youtube.com/embed/9G4xEPrJ_yI	0	2	f		426
851	Advanced Topics - Part 1	network-se-advanced-topics-1-d2b9	https://www.youtube.com/embed/9G4xEPrJ_yI	0	1	f		427
852	Advanced Topics - Part 2	network-se-advanced-topics-2-1d0a	https://www.youtube.com/embed/9G4xEPrJ_yI	0	2	f		427
853	Introduction - Part 1	ethical-ha-introduction-1-5faf	https://www.youtube.com/embed/3Kq1MIfTWCE	0	1	f		428
854	Introduction - Part 2	ethical-ha-introduction-2-ced9	https://www.youtube.com/embed/3Kq1MIfTWCE	0	2	f		428
855	Core Concepts - Part 1	ethical-ha-core-concepts-1-f28c	https://www.youtube.com/embed/3Kq1MIfTWCE	0	1	f		429
856	Core Concepts - Part 2	ethical-ha-core-concepts-2-9fef	https://www.youtube.com/embed/3Kq1MIfTWCE	0	2	f		429
857	Practical Examples - Part 1	ethical-ha-practical-examples-1-d45c	https://www.youtube.com/embed/3Kq1MIfTWCE	0	1	f		430
858	Practical Examples - Part 2	ethical-ha-practical-examples-2-20d0	https://www.youtube.com/embed/3Kq1MIfTWCE	0	2	f		430
859	Projects - Part 1	ethical-ha-projects-1-e341	https://www.youtube.com/embed/3Kq1MIfTWCE	0	1	f		431
860	Projects - Part 2	ethical-ha-projects-2-7619	https://www.youtube.com/embed/3Kq1MIfTWCE	0	2	f		431
861	Advanced Topics - Part 1	ethical-ha-advanced-topics-1-8948	https://www.youtube.com/embed/3Kq1MIfTWCE	0	1	f		432
862	Advanced Topics - Part 2	ethical-ha-advanced-topics-2-0a3c	https://www.youtube.com/embed/3Kq1MIfTWCE	0	2	f		432
863	Introduction - Part 1	cybersecur-introduction-1-fa0c	https://www.youtube.com/embed/inWWhr5tnEA	0	1	f		433
864	Introduction - Part 2	cybersecur-introduction-2-da5a	https://www.youtube.com/embed/inWWhr5tnEA	0	2	f		433
865	Core Concepts - Part 1	cybersecur-core-concepts-1-d536	https://www.youtube.com/embed/inWWhr5tnEA	0	1	f		434
866	Core Concepts - Part 2	cybersecur-core-concepts-2-f58b	https://www.youtube.com/embed/inWWhr5tnEA	0	2	f		434
867	Practical Examples - Part 1	cybersecur-practical-examples-1-7338	https://www.youtube.com/embed/inWWhr5tnEA	0	1	f		435
868	Practical Examples - Part 2	cybersecur-practical-examples-2-105a	https://www.youtube.com/embed/inWWhr5tnEA	0	2	f		435
869	Projects - Part 1	cybersecur-projects-1-7bdd	https://www.youtube.com/embed/inWWhr5tnEA	0	1	f		436
870	Projects - Part 2	cybersecur-projects-2-dcb8	https://www.youtube.com/embed/inWWhr5tnEA	0	2	f		436
871	Advanced Topics - Part 1	cybersecur-advanced-topics-1-3108	https://www.youtube.com/embed/inWWhr5tnEA	0	1	f		437
872	Advanced Topics - Part 2	cybersecur-advanced-topics-2-4536	https://www.youtube.com/embed/inWWhr5tnEA	0	2	f		437
873	Introduction - Part 1	cloud-secu-introduction-1-3024	https://www.youtube.com/embed/_ayRN25gI8o	0	1	f		438
874	Introduction - Part 2	cloud-secu-introduction-2-5b64	https://www.youtube.com/embed/_ayRN25gI8o	0	2	f		438
875	Core Concepts - Part 1	cloud-secu-core-concepts-1-b355	https://www.youtube.com/embed/_ayRN25gI8o	0	1	f		439
876	Core Concepts - Part 2	cloud-secu-core-concepts-2-4f6e	https://www.youtube.com/embed/_ayRN25gI8o	0	2	f		439
877	Practical Examples - Part 1	cloud-secu-practical-examples-1-a9b0	https://www.youtube.com/embed/_ayRN25gI8o	0	1	f		440
878	Practical Examples - Part 2	cloud-secu-practical-examples-2-4821	https://www.youtube.com/embed/_ayRN25gI8o	0	2	f		440
879	Projects - Part 1	cloud-secu-projects-1-d4d2	https://www.youtube.com/embed/_ayRN25gI8o	0	1	f		441
880	Projects - Part 2	cloud-secu-projects-2-5d1e	https://www.youtube.com/embed/_ayRN25gI8o	0	2	f		441
881	Advanced Topics - Part 1	cloud-secu-advanced-topics-1-37a2	https://www.youtube.com/embed/_ayRN25gI8o	0	1	f		442
882	Advanced Topics - Part 2	cloud-secu-advanced-topics-2-c139	https://www.youtube.com/embed/_ayRN25gI8o	0	2	f		442
883	Introduction - Part 1	cloud-comp-introduction-1-788f	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		443
884	Introduction - Part 2	cloud-comp-introduction-2-6306	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		443
885	Core Concepts - Part 1	cloud-comp-core-concepts-1-23bc	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		444
886	Core Concepts - Part 2	cloud-comp-core-concepts-2-74a2	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		444
887	Practical Examples - Part 1	cloud-comp-practical-examples-1-8fbd	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		445
888	Practical Examples - Part 2	cloud-comp-practical-examples-2-39a6	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		445
889	Projects - Part 1	cloud-comp-projects-1-4ce0	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		446
890	Projects - Part 2	cloud-comp-projects-2-c22b	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		446
891	Advanced Topics - Part 1	cloud-comp-advanced-topics-1-fb5a	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		447
892	Advanced Topics - Part 2	cloud-comp-advanced-topics-2-b8cb	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		447
893	Introduction - Part 1	aws-cloud-introduction-1-0dee	https://www.youtube.com/embed/ulprqHHW4wM	0	1	f		448
894	Introduction - Part 2	aws-cloud-introduction-2-1289	https://www.youtube.com/embed/ulprqHHW4wM	0	2	f		448
895	Core Concepts - Part 1	aws-cloud-core-concepts-1-c5c9	https://www.youtube.com/embed/ulprqHHW4wM	0	1	f		449
896	Core Concepts - Part 2	aws-cloud-core-concepts-2-d832	https://www.youtube.com/embed/ulprqHHW4wM	0	2	f		449
897	Practical Examples - Part 1	aws-cloud-practical-examples-1-f08e	https://www.youtube.com/embed/ulprqHHW4wM	0	1	f		450
898	Practical Examples - Part 2	aws-cloud-practical-examples-2-c392	https://www.youtube.com/embed/ulprqHHW4wM	0	2	f		450
899	Projects - Part 1	aws-cloud-projects-1-0af1	https://www.youtube.com/embed/ulprqHHW4wM	0	1	f		451
900	Projects - Part 2	aws-cloud-projects-2-ed6a	https://www.youtube.com/embed/ulprqHHW4wM	0	2	f		451
901	Advanced Topics - Part 1	aws-cloud-advanced-topics-1-ce64	https://www.youtube.com/embed/ulprqHHW4wM	0	1	f		452
902	Advanced Topics - Part 2	aws-cloud-advanced-topics-2-83f5	https://www.youtube.com/embed/ulprqHHW4wM	0	2	f		452
903	Introduction - Part 1	azure-clou-introduction-1-8839	https://www.youtube.com/embed/BQ2Tg_NqgZ4	0	1	f		453
904	Introduction - Part 2	azure-clou-introduction-2-0b92	https://www.youtube.com/embed/BQ2Tg_NqgZ4	0	2	f		453
905	Core Concepts - Part 1	azure-clou-core-concepts-1-9ec8	https://www.youtube.com/embed/BQ2Tg_NqgZ4	0	1	f		454
906	Core Concepts - Part 2	azure-clou-core-concepts-2-6afe	https://www.youtube.com/embed/BQ2Tg_NqgZ4	0	2	f		454
907	Practical Examples - Part 1	azure-clou-practical-examples-1-9618	https://www.youtube.com/embed/BQ2Tg_NqgZ4	0	1	f		455
908	Practical Examples - Part 2	azure-clou-practical-examples-2-9127	https://www.youtube.com/embed/BQ2Tg_NqgZ4	0	2	f		455
909	Projects - Part 1	azure-clou-projects-1-3fb0	https://www.youtube.com/embed/BQ2Tg_NqgZ4	0	1	f		456
910	Projects - Part 2	azure-clou-projects-2-0f44	https://www.youtube.com/embed/BQ2Tg_NqgZ4	0	2	f		456
911	Advanced Topics - Part 1	azure-clou-advanced-topics-1-e78d	https://www.youtube.com/embed/BQ2Tg_NqgZ4	0	1	f		457
912	Advanced Topics - Part 2	azure-clou-advanced-topics-2-71d8	https://www.youtube.com/embed/BQ2Tg_NqgZ4	0	2	f		457
913	Introduction - Part 1	google-clo-introduction-1-b095	https://www.youtube.com/embed/0q3d7R6-IqI	0	1	f		458
914	Introduction - Part 2	google-clo-introduction-2-c678	https://www.youtube.com/embed/0q3d7R6-IqI	0	2	f		458
915	Core Concepts - Part 1	google-clo-core-concepts-1-29ae	https://www.youtube.com/embed/0q3d7R6-IqI	0	1	f		459
916	Core Concepts - Part 2	google-clo-core-concepts-2-aa7d	https://www.youtube.com/embed/0q3d7R6-IqI	0	2	f		459
917	Practical Examples - Part 1	google-clo-practical-examples-1-e874	https://www.youtube.com/embed/0q3d7R6-IqI	0	1	f		460
918	Practical Examples - Part 2	google-clo-practical-examples-2-53d2	https://www.youtube.com/embed/0q3d7R6-IqI	0	2	f		460
919	Projects - Part 1	google-clo-projects-1-97b9	https://www.youtube.com/embed/0q3d7R6-IqI	0	1	f		461
920	Projects - Part 2	google-clo-projects-2-7bfe	https://www.youtube.com/embed/0q3d7R6-IqI	0	2	f		461
921	Advanced Topics - Part 1	google-clo-advanced-topics-1-4948	https://www.youtube.com/embed/0q3d7R6-IqI	0	1	f		462
922	Advanced Topics - Part 2	google-clo-advanced-topics-2-859f	https://www.youtube.com/embed/0q3d7R6-IqI	0	2	f		462
923	Introduction - Part 1	cloud-arch-introduction-1-906c	https://www.youtube.com/embed/X4A2Ps0kH4U	0	1	f		463
924	Introduction - Part 2	cloud-arch-introduction-2-9a9c	https://www.youtube.com/embed/X4A2Ps0kH4U	0	2	f		463
925	Core Concepts - Part 1	cloud-arch-core-concepts-1-a727	https://www.youtube.com/embed/X4A2Ps0kH4U	0	1	f		464
926	Core Concepts - Part 2	cloud-arch-core-concepts-2-4284	https://www.youtube.com/embed/X4A2Ps0kH4U	0	2	f		464
927	Practical Examples - Part 1	cloud-arch-practical-examples-1-85ff	https://www.youtube.com/embed/X4A2Ps0kH4U	0	1	f		465
928	Practical Examples - Part 2	cloud-arch-practical-examples-2-d1b8	https://www.youtube.com/embed/X4A2Ps0kH4U	0	2	f		465
929	Projects - Part 1	cloud-arch-projects-1-7593	https://www.youtube.com/embed/X4A2Ps0kH4U	0	1	f		466
930	Projects - Part 2	cloud-arch-projects-2-94bc	https://www.youtube.com/embed/X4A2Ps0kH4U	0	2	f		466
931	Advanced Topics - Part 1	cloud-arch-advanced-topics-1-1a90	https://www.youtube.com/embed/X4A2Ps0kH4U	0	1	f		467
932	Advanced Topics - Part 2	cloud-arch-advanced-topics-2-913e	https://www.youtube.com/embed/X4A2Ps0kH4U	0	2	f		467
933	Introduction - Part 1	machine-le-introduction-1-3a9f	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		468
934	Introduction - Part 2	machine-le-introduction-2-072a	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		468
935	Core Concepts - Part 1	machine-le-core-concepts-1-4717	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		469
936	Core Concepts - Part 2	machine-le-core-concepts-2-2565	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		469
937	Practical Examples - Part 1	machine-le-practical-examples-1-f503	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		470
938	Practical Examples - Part 2	machine-le-practical-examples-2-6360	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		470
939	Projects - Part 1	machine-le-projects-1-ec92	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		471
940	Projects - Part 2	machine-le-projects-2-9e66	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		471
941	Advanced Topics - Part 1	machine-le-advanced-topics-1-0c35	https://www.youtube.com/embed/5NgNicANyqM	0	1	f		472
942	Advanced Topics - Part 2	machine-le-advanced-topics-2-ae92	https://www.youtube.com/embed/5NgNicANyqM	0	2	f		472
943	Introduction - Part 1	machine-le-introduction-1-5d95	https://www.youtube.com/embed/0FgDpuS9HzU	0	1	f		473
944	Introduction - Part 2	machine-le-introduction-2-7fb5	https://www.youtube.com/embed/0FgDpuS9HzU	0	2	f		473
945	Core Concepts - Part 1	machine-le-core-concepts-1-46e1	https://www.youtube.com/embed/0FgDpuS9HzU	0	1	f		474
946	Core Concepts - Part 2	machine-le-core-concepts-2-73a1	https://www.youtube.com/embed/0FgDpuS9HzU	0	2	f		474
947	Practical Examples - Part 1	machine-le-practical-examples-1-5ddc	https://www.youtube.com/embed/0FgDpuS9HzU	0	1	f		475
948	Practical Examples - Part 2	machine-le-practical-examples-2-7456	https://www.youtube.com/embed/0FgDpuS9HzU	0	2	f		475
949	Projects - Part 1	machine-le-projects-1-aa44	https://www.youtube.com/embed/0FgDpuS9HzU	0	1	f		476
950	Projects - Part 2	machine-le-projects-2-5af7	https://www.youtube.com/embed/0FgDpuS9HzU	0	2	f		476
951	Advanced Topics - Part 1	machine-le-advanced-topics-1-31f5	https://www.youtube.com/embed/0FgDpuS9HzU	0	1	f		477
952	Advanced Topics - Part 2	machine-le-advanced-topics-2-e8d1	https://www.youtube.com/embed/0FgDpuS9HzU	0	2	f		477
953	Introduction - Part 1	deep-learn-introduction-1-bc5d	https://www.youtube.com/embed/tPYj3fFJGjk	0	1	f		478
954	Introduction - Part 2	deep-learn-introduction-2-b3cc	https://www.youtube.com/embed/tPYj3fFJGjk	0	2	f		478
955	Core Concepts - Part 1	deep-learn-core-concepts-1-3fa7	https://www.youtube.com/embed/tPYj3fFJGjk	0	1	f		479
956	Core Concepts - Part 2	deep-learn-core-concepts-2-41cb	https://www.youtube.com/embed/tPYj3fFJGjk	0	2	f		479
957	Practical Examples - Part 1	deep-learn-practical-examples-1-c2eb	https://www.youtube.com/embed/tPYj3fFJGjk	0	1	f		480
958	Practical Examples - Part 2	deep-learn-practical-examples-2-e653	https://www.youtube.com/embed/tPYj3fFJGjk	0	2	f		480
959	Projects - Part 1	deep-learn-projects-1-d7f0	https://www.youtube.com/embed/tPYj3fFJGjk	0	1	f		481
960	Projects - Part 2	deep-learn-projects-2-eed4	https://www.youtube.com/embed/tPYj3fFJGjk	0	2	f		481
961	Advanced Topics - Part 1	deep-learn-advanced-topics-1-0014	https://www.youtube.com/embed/tPYj3fFJGjk	0	1	f		482
962	Advanced Topics - Part 2	deep-learn-advanced-topics-2-f2d4	https://www.youtube.com/embed/tPYj3fFJGjk	0	2	f		482
963	Introduction - Part 1	natural-la-introduction-1-db02	https://www.youtube.com/embed/CM6mNo3hQeg	0	1	f		483
964	Introduction - Part 2	natural-la-introduction-2-75d7	https://www.youtube.com/embed/CM6mNo3hQeg	0	2	f		483
965	Core Concepts - Part 1	natural-la-core-concepts-1-0ae3	https://www.youtube.com/embed/CM6mNo3hQeg	0	1	f		484
966	Core Concepts - Part 2	natural-la-core-concepts-2-f1a9	https://www.youtube.com/embed/CM6mNo3hQeg	0	2	f		484
967	Practical Examples - Part 1	natural-la-practical-examples-1-7def	https://www.youtube.com/embed/CM6mNo3hQeg	0	1	f		485
968	Practical Examples - Part 2	natural-la-practical-examples-2-8e96	https://www.youtube.com/embed/CM6mNo3hQeg	0	2	f		485
969	Projects - Part 1	natural-la-projects-1-8720	https://www.youtube.com/embed/CM6mNo3hQeg	0	1	f		486
970	Projects - Part 2	natural-la-projects-2-ea4f	https://www.youtube.com/embed/CM6mNo3hQeg	0	2	f		486
971	Advanced Topics - Part 1	natural-la-advanced-topics-1-5d02	https://www.youtube.com/embed/CM6mNo3hQeg	0	1	f		487
972	Advanced Topics - Part 2	natural-la-advanced-topics-2-4446	https://www.youtube.com/embed/CM6mNo3hQeg	0	2	f		487
973	Introduction - Part 1	computer-v-introduction-1-6213	https://www.youtube.com/embed/oXlwWbU8l2o	0	1	f		488
974	Introduction - Part 2	computer-v-introduction-2-d4ed	https://www.youtube.com/embed/oXlwWbU8l2o	0	2	f		488
975	Core Concepts - Part 1	computer-v-core-concepts-1-e864	https://www.youtube.com/embed/oXlwWbU8l2o	0	1	f		489
976	Core Concepts - Part 2	computer-v-core-concepts-2-076c	https://www.youtube.com/embed/oXlwWbU8l2o	0	2	f		489
977	Practical Examples - Part 1	computer-v-practical-examples-1-3f24	https://www.youtube.com/embed/oXlwWbU8l2o	0	1	f		490
978	Practical Examples - Part 2	computer-v-practical-examples-2-3d79	https://www.youtube.com/embed/oXlwWbU8l2o	0	2	f		490
979	Projects - Part 1	computer-v-projects-1-f0b3	https://www.youtube.com/embed/oXlwWbU8l2o	0	1	f		491
980	Projects - Part 2	computer-v-projects-2-3dae	https://www.youtube.com/embed/oXlwWbU8l2o	0	2	f		491
981	Advanced Topics - Part 1	computer-v-advanced-topics-1-efca	https://www.youtube.com/embed/oXlwWbU8l2o	0	1	f		492
982	Advanced Topics - Part 2	computer-v-advanced-topics-2-58af	https://www.youtube.com/embed/oXlwWbU8l2o	0	2	f		492
\.


--
-- Data for Name: courses_module; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses_module (id, title, "order", course_id) FROM stdin;
243	Introduction	1	51
244	Core Concepts	2	51
245	Practical Examples	3	51
246	Projects	4	51
247	Advanced Topics	5	51
248	Introduction	1	52
249	Core Concepts	2	52
250	Practical Examples	3	52
251	Projects	4	52
252	Advanced Topics	5	52
253	Introduction	1	53
254	Core Concepts	2	53
255	Practical Examples	3	53
256	Projects	4	53
257	Advanced Topics	5	53
258	Introduction	1	54
259	Core Concepts	2	54
260	Practical Examples	3	54
261	Projects	4	54
262	Advanced Topics	5	54
263	Introduction	1	55
264	Core Concepts	2	55
265	Practical Examples	3	55
266	Projects	4	55
267	Advanced Topics	5	55
268	Introduction	1	56
269	Core Concepts	2	56
270	Practical Examples	3	56
271	Projects	4	56
272	Advanced Topics	5	56
273	Introduction	1	57
274	Core Concepts	2	57
275	Practical Examples	3	57
276	Projects	4	57
277	Advanced Topics	5	57
278	Introduction	1	58
279	Core Concepts	2	58
280	Practical Examples	3	58
281	Projects	4	58
282	Advanced Topics	5	58
283	Introduction	1	59
284	Core Concepts	2	59
285	Practical Examples	3	59
286	Projects	4	59
287	Advanced Topics	5	59
288	Introduction	1	60
289	Core Concepts	2	60
290	Practical Examples	3	60
291	Projects	4	60
292	Advanced Topics	5	60
293	Introduction	1	61
294	Core Concepts	2	61
295	Practical Examples	3	61
296	Projects	4	61
297	Advanced Topics	5	61
298	Introduction	1	62
299	Core Concepts	2	62
300	Practical Examples	3	62
301	Projects	4	62
302	Advanced Topics	5	62
303	Introduction	1	63
304	Core Concepts	2	63
305	Practical Examples	3	63
306	Projects	4	63
307	Advanced Topics	5	63
308	Introduction	1	64
309	Core Concepts	2	64
310	Practical Examples	3	64
311	Projects	4	64
312	Advanced Topics	5	64
313	Introduction	1	65
314	Core Concepts	2	65
315	Practical Examples	3	65
316	Projects	4	65
317	Advanced Topics	5	65
318	Introduction	1	66
319	Core Concepts	2	66
320	Practical Examples	3	66
321	Projects	4	66
322	Advanced Topics	5	66
323	Introduction	1	67
324	Core Concepts	2	67
325	Practical Examples	3	67
326	Projects	4	67
327	Advanced Topics	5	67
328	Introduction	1	68
329	Core Concepts	2	68
330	Practical Examples	3	68
331	Projects	4	68
332	Advanced Topics	5	68
333	Introduction	1	69
334	Core Concepts	2	69
335	Practical Examples	3	69
336	Projects	4	69
337	Advanced Topics	5	69
338	Introduction	1	70
339	Core Concepts	2	70
340	Practical Examples	3	70
341	Projects	4	70
342	Advanced Topics	5	70
343	Introduction	1	71
344	Core Concepts	2	71
345	Practical Examples	3	71
346	Projects	4	71
347	Advanced Topics	5	71
348	Introduction	1	72
349	Core Concepts	2	72
350	Practical Examples	3	72
351	Projects	4	72
352	Advanced Topics	5	72
353	Introduction	1	73
354	Core Concepts	2	73
355	Practical Examples	3	73
356	Projects	4	73
357	Advanced Topics	5	73
358	Introduction	1	74
359	Core Concepts	2	74
360	Practical Examples	3	74
361	Projects	4	74
362	Advanced Topics	5	74
363	Introduction	1	75
364	Core Concepts	2	75
365	Practical Examples	3	75
366	Projects	4	75
367	Advanced Topics	5	75
368	Introduction	1	76
369	Core Concepts	2	76
370	Practical Examples	3	76
371	Projects	4	76
372	Advanced Topics	5	76
373	Introduction	1	77
374	Core Concepts	2	77
375	Practical Examples	3	77
376	Projects	4	77
377	Advanced Topics	5	77
378	Introduction	1	78
379	Core Concepts	2	78
380	Practical Examples	3	78
381	Projects	4	78
382	Advanced Topics	5	78
383	Introduction	1	79
384	Core Concepts	2	79
385	Practical Examples	3	79
386	Projects	4	79
387	Advanced Topics	5	79
388	Introduction	1	80
389	Core Concepts	2	80
390	Practical Examples	3	80
391	Projects	4	80
392	Advanced Topics	5	80
393	Introduction	1	81
394	Core Concepts	2	81
395	Practical Examples	3	81
396	Projects	4	81
397	Advanced Topics	5	81
398	Introduction	1	82
399	Core Concepts	2	82
400	Practical Examples	3	82
401	Projects	4	82
402	Advanced Topics	5	82
403	Introduction	1	83
404	Core Concepts	2	83
405	Practical Examples	3	83
406	Projects	4	83
407	Advanced Topics	5	83
408	Introduction	1	84
409	Core Concepts	2	84
410	Practical Examples	3	84
411	Projects	4	84
412	Advanced Topics	5	84
413	Introduction	1	85
414	Core Concepts	2	85
415	Practical Examples	3	85
416	Projects	4	85
417	Advanced Topics	5	85
418	Introduction	1	86
419	Core Concepts	2	86
420	Practical Examples	3	86
421	Projects	4	86
422	Advanced Topics	5	86
423	Introduction	1	87
424	Core Concepts	2	87
425	Practical Examples	3	87
426	Projects	4	87
427	Advanced Topics	5	87
428	Introduction	1	88
429	Core Concepts	2	88
430	Practical Examples	3	88
431	Projects	4	88
432	Advanced Topics	5	88
433	Introduction	1	89
434	Core Concepts	2	89
435	Practical Examples	3	89
436	Projects	4	89
437	Advanced Topics	5	89
438	Introduction	1	90
439	Core Concepts	2	90
440	Practical Examples	3	90
441	Projects	4	90
442	Advanced Topics	5	90
443	Introduction	1	91
444	Core Concepts	2	91
445	Practical Examples	3	91
446	Projects	4	91
447	Advanced Topics	5	91
448	Introduction	1	92
449	Core Concepts	2	92
450	Practical Examples	3	92
451	Projects	4	92
452	Advanced Topics	5	92
453	Introduction	1	93
454	Core Concepts	2	93
455	Practical Examples	3	93
456	Projects	4	93
457	Advanced Topics	5	93
458	Introduction	1	94
459	Core Concepts	2	94
460	Practical Examples	3	94
461	Projects	4	94
462	Advanced Topics	5	94
463	Introduction	1	95
464	Core Concepts	2	95
465	Practical Examples	3	95
466	Projects	4	95
467	Advanced Topics	5	95
468	Introduction	1	96
469	Core Concepts	2	96
470	Practical Examples	3	96
471	Projects	4	96
472	Advanced Topics	5	96
473	Introduction	1	97
474	Core Concepts	2	97
475	Practical Examples	3	97
476	Projects	4	97
477	Advanced Topics	5	97
478	Introduction	1	98
479	Core Concepts	2	98
480	Practical Examples	3	98
481	Projects	4	98
482	Advanced Topics	5	98
483	Introduction	1	99
484	Core Concepts	2	99
485	Practical Examples	3	99
486	Projects	4	99
487	Advanced Topics	5	99
488	Introduction	1	100
489	Core Concepts	2	100
490	Practical Examples	3	100
491	Projects	4	100
492	Advanced Topics	5	100
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	contenttypes	contenttype
5	sessions	session
6	accounts	user
7	courses	category
8	courses	course
9	courses	lesson
10	courses	module
11	enrollments	enrollment
12	enrollments	lessonprogress
13	payments	order
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-09-04 09:29:58.37739+00
2	contenttypes	0002_remove_content_type_name	2026-09-04 09:29:58.386211+00
3	auth	0001_initial	2026-09-04 09:29:58.442859+00
4	auth	0002_alter_permission_name_max_length	2026-09-04 09:29:58.448548+00
5	auth	0003_alter_user_email_max_length	2026-09-04 09:29:58.454532+00
6	auth	0004_alter_user_username_opts	2026-09-04 09:29:58.460425+00
7	auth	0005_alter_user_last_login_null	2026-09-04 09:29:58.467104+00
8	auth	0006_require_contenttypes_0002	2026-09-04 09:29:58.470138+00
9	auth	0007_alter_validators_add_error_messages	2026-09-04 09:29:58.480078+00
10	auth	0008_alter_user_username_max_length	2026-09-04 09:29:58.491093+00
11	auth	0009_alter_user_last_name_max_length	2026-09-04 09:29:58.50005+00
12	auth	0010_alter_group_name_max_length	2026-09-04 09:29:58.509563+00
13	auth	0011_update_proxy_permissions	2026-09-04 09:29:58.519234+00
14	auth	0012_alter_user_first_name_max_length	2026-09-04 09:29:58.529101+00
15	accounts	0001_initial	2026-09-04 09:29:58.601549+00
16	admin	0001_initial	2026-09-04 09:29:58.628106+00
17	admin	0002_logentry_remove_auto_add	2026-09-04 09:29:58.640577+00
18	admin	0003_logentry_add_action_flag_choices	2026-09-04 09:29:58.654835+00
19	courses	0001_initial	2026-09-04 09:29:58.758527+00
20	enrollments	0001_initial	2026-09-04 09:29:58.820535+00
21	payments	0001_initial	2026-09-04 09:29:58.855439+00
22	sessions	0001_initial	2026-09-04 09:29:58.874737+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
zn803qm42t94ye0g2qv1j5xozlftsfpo	.eJxVjMsOwiAQRf-FtSE8OjxcuvcbyDCAVA0kpV0Z_12bdKHbe865LxZwW2vYRl7CnNiZOXb63SLSI7cdpDu2W-fU27rMke8KP-jg157y83K4fwcVR_3Wk4k-uaiKjl5oi9FYkMoUyNqjIkJvtCORwSuDkElKshOA9VYUsEKx9wfcJTcm:1x2oSj:Cs75TeH8FE_l5Q7zFQFNB_Ljs0K3B-pCIUZPMcOCnf4	2026-09-19 11:21:33.539065+00
\.


--
-- Data for Name: enrollments_enrollment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.enrollments_enrollment (id, enrolled_at, is_active, progress_percent, course_id, student_id) FROM stdin;
1	2026-09-04 10:38:51.994501+00	t	0	96	3
2	2026-09-04 10:42:18.539369+00	t	0	51	3
3	2026-09-04 11:11:18.014694+00	t	0	86	4
4	2026-09-04 13:28:09.091518+00	t	0	51	5
5	2026-09-04 16:52:26.725484+00	t	0	51	6
6	2026-09-04 17:28:58.124539+00	t	0	61	7
7	2026-09-04 17:29:19.777613+00	t	0	51	7
8	2026-09-05 11:20:00.729514+00	t	0	51	8
\.


--
-- Data for Name: enrollments_lessonprogress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.enrollments_lessonprogress (id, is_completed, completed_at, enrollment_id, lesson_id) FROM stdin;
\.


--
-- Data for Name: payments_order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payments_order (id, amount, currency, stripe_checkout_session_id, stripe_payment_intent_id, status, created_at, paid_at, course_id, student_id) FROM stdin;
12b9669c-3a5f-4514-9f7a-a29e7d3261ec	35.00	usd	cs_test_a1VY7qEXr7Z5NwYFZR6qUgFmPSgyf1FI7JMosTfhHSZ7EMSQLXyYz6VNDJ	\N	pending	2026-09-04 16:53:18.22698+00	\N	100	6
6ead7b31-27a8-4671-9321-fd273e8d7100	35.00	usd	cs_test_a1DnXr5Sve8XSt35B1YgyQIMVj1SGBJhy0Nj6Wos0MczCG9LPuNwuQD5ou	\N	pending	2026-09-04 17:31:18.157389+00	\N	55	7
a70a57c3-ab71-42df-a7a4-5b9a1f4a8532	35.00	usd	cs_test_a1eudPRf5z3ZFyBtJaw5VhMVC1krAgj7dmI1PNsDnELCn3tch8vtGYerNA	\N	pending	2026-09-04 17:31:19.828227+00	\N	55	7
c8a4b741-be97-44dc-8095-099d208204c1	35.00	usd	cs_test_a1NhIsCX5g8IhQ2KEG1KLFHB4MwC43h38SZqfQeuwoeIWbwglEeUWLZDXj	\N	pending	2026-09-05 11:49:24.117705+00	\N	100	8
\.


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 8, true);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: courses_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_category_id_seq', 10, true);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 101, true);


--
-- Name: courses_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_lesson_id_seq', 982, true);


--
-- Name: courses_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_module_id_seq', 492, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.enrollments_enrollment_id_seq', 8, true);


--
-- Name: enrollments_lessonprogress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.enrollments_lessonprogress_id_seq', 1, false);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: courses_category courses_category_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_category
    ADD CONSTRAINT courses_category_name_key UNIQUE (name);


--
-- Name: courses_category courses_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_category
    ADD CONSTRAINT courses_category_pkey PRIMARY KEY (id);


--
-- Name: courses_category courses_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_category
    ADD CONSTRAINT courses_category_slug_key UNIQUE (slug);


--
-- Name: courses_course courses_course_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_course
    ADD CONSTRAINT courses_course_pkey PRIMARY KEY (id);


--
-- Name: courses_course courses_course_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_course
    ADD CONSTRAINT courses_course_slug_key UNIQUE (slug);


--
-- Name: courses_lesson courses_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_lesson
    ADD CONSTRAINT courses_lesson_pkey PRIMARY KEY (id);


--
-- Name: courses_lesson courses_lesson_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_lesson
    ADD CONSTRAINT courses_lesson_slug_key UNIQUE (slug);


--
-- Name: courses_module courses_module_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_module
    ADD CONSTRAINT courses_module_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: enrollments_enrollment enrollments_enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrollments_enrollment
    ADD CONSTRAINT enrollments_enrollment_pkey PRIMARY KEY (id);


--
-- Name: enrollments_enrollment enrollments_enrollment_student_id_course_id_88ca0934_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrollments_enrollment
    ADD CONSTRAINT enrollments_enrollment_student_id_course_id_88ca0934_uniq UNIQUE (student_id, course_id);


--
-- Name: enrollments_lessonprogress enrollments_lessonprogre_enrollment_id_lesson_id_635d5cf3_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrollments_lessonprogress
    ADD CONSTRAINT enrollments_lessonprogre_enrollment_id_lesson_id_635d5cf3_uniq UNIQUE (enrollment_id, lesson_id);


--
-- Name: enrollments_lessonprogress enrollments_lessonprogress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrollments_lessonprogress
    ADD CONSTRAINT enrollments_lessonprogress_pkey PRIMARY KEY (id);


--
-- Name: payments_order payments_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments_order
    ADD CONSTRAINT payments_order_pkey PRIMARY KEY (id);


--
-- Name: payments_order payments_order_stripe_checkout_session_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments_order
    ADD CONSTRAINT payments_order_stripe_checkout_session_id_key UNIQUE (stripe_checkout_session_id);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


--
-- Name: accounts_user_username_6088629e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX accounts_user_username_6088629e_like ON public.accounts_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: courses_category_name_016b219d_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_category_name_016b219d_like ON public.courses_category USING btree (name varchar_pattern_ops);


--
-- Name: courses_category_slug_33267d74_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_category_slug_33267d74_like ON public.courses_category USING btree (slug varchar_pattern_ops);


--
-- Name: courses_course_category_id_d64b93bf; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_course_category_id_d64b93bf ON public.courses_course USING btree (category_id);


--
-- Name: courses_course_instructor_id_5b0643dc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_course_instructor_id_5b0643dc ON public.courses_course USING btree (instructor_id);


--
-- Name: courses_course_slug_9c670f14_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_course_slug_9c670f14_like ON public.courses_course USING btree (slug varchar_pattern_ops);


--
-- Name: courses_lesson_module_id_41252914; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_lesson_module_id_41252914 ON public.courses_lesson USING btree (module_id);


--
-- Name: courses_lesson_slug_708303e2_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_lesson_slug_708303e2_like ON public.courses_lesson USING btree (slug varchar_pattern_ops);


--
-- Name: courses_module_course_id_7d4820de; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_module_course_id_7d4820de ON public.courses_module USING btree (course_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: enrollments_enrollment_course_id_c54c9325; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX enrollments_enrollment_course_id_c54c9325 ON public.enrollments_enrollment USING btree (course_id);


--
-- Name: enrollments_enrollment_student_id_92696b89; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX enrollments_enrollment_student_id_92696b89 ON public.enrollments_enrollment USING btree (student_id);


--
-- Name: enrollments_lessonprogress_enrollment_id_0749b788; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX enrollments_lessonprogress_enrollment_id_0749b788 ON public.enrollments_lessonprogress USING btree (enrollment_id);


--
-- Name: enrollments_lessonprogress_lesson_id_6e77b767; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX enrollments_lessonprogress_lesson_id_6e77b767 ON public.enrollments_lessonprogress USING btree (lesson_id);


--
-- Name: payments_order_course_id_43e5a346; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payments_order_course_id_43e5a346 ON public.payments_order USING btree (course_id);


--
-- Name: payments_order_stripe_checkout_session_id_304f293e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payments_order_stripe_checkout_session_id_304f293e_like ON public.payments_order USING btree (stripe_checkout_session_id varchar_pattern_ops);


--
-- Name: payments_order_student_id_b8294c27; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payments_order_student_id_b8294c27 ON public.payments_order USING btree (student_id);


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: courses_course courses_course_category_id_d64b93bf_fk_courses_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_course
    ADD CONSTRAINT courses_course_category_id_d64b93bf_fk_courses_category_id FOREIGN KEY (category_id) REFERENCES public.courses_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: courses_course courses_course_instructor_id_5b0643dc_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_course
    ADD CONSTRAINT courses_course_instructor_id_5b0643dc_fk_accounts_user_id FOREIGN KEY (instructor_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: courses_lesson courses_lesson_module_id_41252914_fk_courses_module_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_lesson
    ADD CONSTRAINT courses_lesson_module_id_41252914_fk_courses_module_id FOREIGN KEY (module_id) REFERENCES public.courses_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: courses_module courses_module_course_id_7d4820de_fk_courses_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_module
    ADD CONSTRAINT courses_module_course_id_7d4820de_fk_courses_course_id FOREIGN KEY (course_id) REFERENCES public.courses_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: enrollments_enrollment enrollments_enrollment_course_id_c54c9325_fk_courses_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrollments_enrollment
    ADD CONSTRAINT enrollments_enrollment_course_id_c54c9325_fk_courses_course_id FOREIGN KEY (course_id) REFERENCES public.courses_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: enrollments_enrollment enrollments_enrollment_student_id_92696b89_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrollments_enrollment
    ADD CONSTRAINT enrollments_enrollment_student_id_92696b89_fk_accounts_user_id FOREIGN KEY (student_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: enrollments_lessonprogress enrollments_lessonpr_enrollment_id_0749b788_fk_enrollmen; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrollments_lessonprogress
    ADD CONSTRAINT enrollments_lessonpr_enrollment_id_0749b788_fk_enrollmen FOREIGN KEY (enrollment_id) REFERENCES public.enrollments_enrollment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: enrollments_lessonprogress enrollments_lessonpr_lesson_id_6e77b767_fk_courses_l; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrollments_lessonprogress
    ADD CONSTRAINT enrollments_lessonpr_lesson_id_6e77b767_fk_courses_l FOREIGN KEY (lesson_id) REFERENCES public.courses_lesson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_order payments_order_course_id_43e5a346_fk_courses_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments_order
    ADD CONSTRAINT payments_order_course_id_43e5a346_fk_courses_course_id FOREIGN KEY (course_id) REFERENCES public.courses_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_order payments_order_student_id_b8294c27_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments_order
    ADD CONSTRAINT payments_order_student_id_b8294c27_fk_accounts_user_id FOREIGN KEY (student_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\unrestrict f9mA4rZVFEOq9bZWrTpsNNMQ5XeOmi5Bw8CIUWg3dyimFBa3O0HfYDFsh3I2fq7

