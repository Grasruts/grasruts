--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: campaign_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campaign_categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    uuid uuid DEFAULT public.gen_random_uuid() NOT NULL
);


ALTER TABLE public.campaign_categories OWNER TO postgres;

--
-- Name: campaign_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campaign_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campaign_categories_id_seq OWNER TO postgres;

--
-- Name: campaign_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campaign_categories_id_seq OWNED BY public.campaign_categories.id;


--
-- Name: campaign_updates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campaign_updates (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    campaign_id bigint,
    discarded_at timestamp without time zone,
    uuid uuid DEFAULT public.gen_random_uuid() NOT NULL
);


ALTER TABLE public.campaign_updates OWNER TO postgres;

--
-- Name: campaign_updates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campaign_updates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campaign_updates_id_seq OWNER TO postgres;

--
-- Name: campaign_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campaign_updates_id_seq OWNED BY public.campaign_updates.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campaigns (
    id bigint NOT NULL,
    name character varying,
    uri character varying,
    about text,
    goal integer,
    faq text,
    card_description character varying,
    mode integer DEFAULT 0,
    status integer DEFAULT 0,
    deadline integer,
    location character varying,
    video character varying,
    video_image character varying,
    recommended boolean,
    video_id character varying,
    published_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    discarded_at timestamp without time zone,
    user_id bigint,
    card_image_file_name character varying,
    card_image_content_type character varying,
    card_image_file_size integer,
    card_image_updated_at timestamp without time zone,
    campaign_category_id bigint,
    uuid uuid DEFAULT public.gen_random_uuid() NOT NULL
);


ALTER TABLE public.campaigns OWNER TO postgres;

--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campaigns_id_seq OWNER TO postgres;

--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campaigns_id_seq OWNED BY public.campaigns.id;


--
-- Name: contributions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contributions (
    id bigint NOT NULL,
    amount integer,
    gateway integer,
    anonymous boolean,
    state integer,
    raw jsonb DEFAULT '{}'::jsonb,
    ref_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint,
    campaign_id bigint,
    reward_id bigint,
    uuid uuid DEFAULT public.gen_random_uuid() NOT NULL
);


ALTER TABLE public.contributions OWNER TO postgres;

--
-- Name: contributions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contributions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contributions_id_seq OWNER TO postgres;

--
-- Name: contributions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contributions_id_seq OWNED BY public.contributions.id;


--
-- Name: faqs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faqs (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    campaign_id bigint,
    uuid uuid DEFAULT public.gen_random_uuid() NOT NULL
);


ALTER TABLE public.faqs OWNER TO postgres;

--
-- Name: faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faqs_id_seq OWNER TO postgres;

--
-- Name: faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faqs_id_seq OWNED BY public.faqs.id;


--
-- Name: rewards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rewards (
    id bigint NOT NULL,
    name character varying,
    price integer,
    description text,
    total_reward integer,
    claimed_reward integer,
    shipping_date timestamp without time zone,
    limited boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    campaign_id bigint,
    uuid uuid DEFAULT public.gen_random_uuid() NOT NULL
);


ALTER TABLE public.rewards OWNER TO postgres;

--
-- Name: rewards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rewards_id_seq OWNER TO postgres;

--
-- Name: rewards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rewards_id_seq OWNED BY public.rewards.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    image character varying,
    provider character varying,
    uid character varying,
    address character varying,
    country character varying,
    contact_number character varying,
    pan character varying,
    city character varying,
    about text,
    facebook character varying,
    twitter character varying,
    admin boolean,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    uuid uuid DEFAULT public.gen_random_uuid() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: campaign_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign_categories ALTER COLUMN id SET DEFAULT nextval('public.campaign_categories_id_seq'::regclass);


--
-- Name: campaign_updates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign_updates ALTER COLUMN id SET DEFAULT nextval('public.campaign_updates_id_seq'::regclass);


--
-- Name: campaigns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaigns ALTER COLUMN id SET DEFAULT nextval('public.campaigns_id_seq'::regclass);


--
-- Name: contributions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contributions ALTER COLUMN id SET DEFAULT nextval('public.contributions_id_seq'::regclass);


--
-- Name: faqs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs ALTER COLUMN id SET DEFAULT nextval('public.faqs_id_seq'::regclass);


--
-- Name: rewards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rewards ALTER COLUMN id SET DEFAULT nextval('public.rewards_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-09-23 06:39:38.560536	2018-09-23 06:39:38.560536
\.


--
-- Data for Name: campaign_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campaign_categories (id, name, created_at, updated_at, uuid) FROM stdin;
1	Art & Design	2018-09-23 06:40:22.618015	2018-09-23 06:40:22.618015	af8fdee6-d1f7-451a-973b-5e5180006965
2	Film & Video	2018-09-23 06:40:22.625817	2018-09-23 06:40:22.625817	b2bf316e-a61a-4839-909b-122e8a855ecf
3	Technology	2018-09-23 06:40:22.629859	2018-09-23 06:40:22.629859	ce13f5e5-6745-41bc-9388-b5fa7bb366e4
4	Game	2018-09-23 06:40:22.633736	2018-09-23 06:40:22.633736	b3b7eb77-e027-4e2e-91e0-5e657a416766
5	Book	2018-09-23 06:40:22.640059	2018-09-23 06:40:22.640059	ec1d074b-0c1d-4c55-a575-e67485ab4b5f
6	Community	2018-09-23 06:40:22.644658	2018-09-23 06:40:22.644658	ad3f17e2-f055-42be-88ff-8b2d2fe664cd
7	Travel	2018-09-23 06:40:22.648448	2018-09-23 06:40:22.648448	06450141-d90d-4005-96f2-df78e843878d
8	Social Cause	2018-09-23 06:40:22.654453	2018-09-23 06:40:22.654453	f0f52e39-7c59-4380-95f0-96c2d94d5a9e
\.


--
-- Data for Name: campaign_updates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campaign_updates (id, name, description, created_at, updated_at, campaign_id, discarded_at, uuid) FROM stdin;
1	News 1	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam feugiat suscipit massa, tempus ultrices neque efficitur malesuada. Proin ac iaculis arcu. Mauris vel lacinia neque. Donec ac elementum tortor. Nunc dui sem, luctus at bibendum sollicitudin, pellentesque ac magna. Nulla quam elit, tincidunt eget enim sed, condimentum accumsan magna. Donec sapien lacus, molestie ut diam sit amet, semper congue libero. Nulla ullamcorper commodo lacus, in mattis felis scelerisque sit amet. Maecenas justo velit, blandit finibus orci sed, finibus dignissim elit.</p><p>Integer id elementum mauris. Curabitur euismod, metus vel lacinia sagittis, mauris ante euismod odio, vitae bibendum lorem odio et ipsum. Donec ac consectetur nisi. Etiam sed venenatis ipsum. Praesent quis molestie arcu. Pellentesque tellus justo, scelerisque eu fermentum at, gravida eu nunc. Pellentesque tincidunt nulla ut facilisis rhoncus. Aliquam ullamcorper, augue ac tincidunt gravida, felis diam faucibus turpis, non pharetra metus nibh ut risus. Nullam eget dui malesuada, placerat felis a, laoreet risus.</p><p>Fusce tincidunt sollicitudin nisi vel dapibus. Donec mi nulla, auctor vitae sem eget, tempus posuere justo. Donec non purus sem. Sed nec sapien ac lacus ornare sagittis. Phasellus vitae tincidunt metus, ac tincidunt augue. Sed quis ligula arcu. Suspendisse volutpat interdum varius. Aliquam ut purus sit amet nibh dignissim egestas.</p><p>Vivamus porttitor consectetur orci, sed fringilla nulla dictum in. Aliquam eget purus facilisis neque facilisis porttitor. Sed vulputate euismod sem, eget ornare diam sodales quis. Phasellus in lacinia ex. Vivamus vitae diam sed risus laoreet tempor sed sit amet nisl. Proin efficitur felis ipsum, vitae commodo turpis aliquet eu. Ut aliquam molestie sem non hendrerit. Vestibulum ullamcorper tellus at lorem vulputate maximus vitae non dui. Donec tempus neque eget augue fringilla sagittis. Nunc accumsan magna vitae tortor varius, in pharetra eros maximus. Morbi id elit faucibus, gravida mi in, finibus elit.</p><p>Nam varius mi id lectus blandit commodo. Nulla pretium lectus nisi, pellentesque efficitur sapien commodo vel. In lorem metus, viverra et faucibus quis, lobortis et justo. Aliquam accumsan metus ut nunc feugiat ultricies. In id arcu tincidunt, commodo sapien in, venenatis magna. Aliquam eleifend erat et rhoncus condimentum. Integer magna nisi, semper et pharetra vitae, mattis vitae quam. Mauris eget interdum risus. Integer aliquam nisl eget nibh posuere gravida. Ut nec blandit dolor.</p>	2018-09-23 07:27:47.637366	2018-09-23 07:27:47.637366	11	\N	60c0cfcf-6c9d-46f2-a0f1-7127b9468123
\.


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campaigns (id, name, uri, about, goal, faq, card_description, mode, status, deadline, location, video, video_image, recommended, video_id, published_date, created_at, updated_at, discarded_at, user_id, card_image_file_name, card_image_content_type, card_image_file_size, card_image_updated_at, campaign_category_id, uuid) FROM stdin;
1	sushant bajracharya	UcXFYKmERs	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	2018-09-23 06:47:28.119434	2018-09-23 06:47:28.119434	\N	\N	\N	\N	\N	\N	1	0688e1c8-ef2a-472a-ab48-e65cb5822df0
2	manjushree trail	HlqbPoGbts	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	2018-09-23 06:49:56.097742	2018-09-23 06:49:56.097742	\N	\N	\N	\N	\N	\N	1	24b58da3-f290-4128-83b9-f77278764806
3	manjushree trail	YagdPuTBBh	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	2018-09-23 06:51:46.45164	2018-09-23 06:51:46.45164	\N	\N	\N	\N	\N	\N	1	5004cb37-b9f8-49a1-a35f-466c1e291afe
4	manjushree trail	jypRMzrlmD	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	2018-09-23 06:53:51.78416	2018-09-23 06:53:51.78416	\N	\N	\N	\N	\N	\N	1	283070e8-2c13-4031-b2ab-6874549d2317
5	manjushree trail	NwsEopIkxu	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	2018-09-23 06:54:46.11686	2018-09-23 06:54:46.11686	\N	\N	\N	\N	\N	\N	1	1cecbffd-fb68-4f05-8b1b-4f2eceaa9033
6	manjushree trail	kBVChKkGmy	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	2018-09-23 06:55:25.618631	2018-09-23 06:55:25.618631	\N	\N	\N	\N	\N	\N	1	9dbe2e77-6607-40b9-bfde-58496c767b95
7	mna tra	IAaqobTkGz	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	2018-09-23 06:55:46.074158	2018-09-23 06:55:46.074158	\N	\N	\N	\N	\N	\N	1	2781d72a-e638-4ae5-90de-145a14b05895
8	te sdf	yuXLFhkMbz	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	2018-09-23 06:56:42.40781	2018-09-23 06:56:42.40781	\N	\N	\N	\N	\N	\N	1	1d04a83f-a680-4129-b8c5-3566be05d85d
9	manjsu ree trail	gnZNBxCHcT	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	2018-09-23 06:57:58.486263	2018-09-23 06:57:58.486263	\N	1	\N	\N	\N	\N	1	74645d5a-4ade-4978-a291-024ceb15b0a8
10	manjsu ree trail	XpMbhprngI	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	2018-09-23 06:58:35.664844	2018-09-23 06:58:35.664844	\N	1	\N	\N	\N	\N	1	8f4eaed2-804c-406e-a377-a43e2a05f780
13	Logged out uyser	eKFgbsoHTk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	2018-09-23 07:03:25.895044	2018-09-23 07:03:43.07473	\N	2	\N	\N	\N	\N	1	af069fb8-34e0-46f6-9f06-f727da7e8cf0
11	te ssdf	test1	<p><img src="/download_file/PaMRlkqU61SEj9LA2bxM1w.png" style="width: 300px;" class="fr-fic fr-dib"></p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam feugiat suscipit massa, tempus ultrices neque efficitur malesuada. Proin ac iaculis arcu. Mauris vel lacinia neque. Donec ac elementum tortor. Nunc dui sem, luctus at bibendum sollicitudin, pellentesque ac magna. Nulla quam elit, tincidunt eget enim sed, condimentum accumsan magna. Donec sapien lacus, molestie ut diam sit amet, semper congue libero. Nulla ullamcorper commodo lacus, in mattis felis scelerisque sit amet. Maecenas justo velit, blandit finibus orci sed, finibus dignissim elit.</p><p>Integer id elementum mauris. Curabitur euismod, metus vel lacinia sagittis, mauris ante euismod odio, vitae bibendum lorem odio et ipsum. Donec ac consectetur nisi. Etiam sed venenatis ipsum. Praesent quis molestie arcu. Pellentesque tellus justo, scelerisque eu fermentum at, gravida eu nunc. Pellentesque tincidunt nulla ut facilisis rhoncus. Aliquam ullamcorper, augue ac tincidunt gravida, felis diam faucibus turpis, non pharetra metus nibh ut risus. Nullam eget dui malesuada, placerat felis a, laoreet risus.</p><p>Fusce tincidunt sollicitudin nisi vel dapibus. Donec mi nulla, auctor vitae sem eget, tempus posuere justo. Donec non purus sem. Sed nec sapien ac lacus ornare sagittis. Phasellus vitae tincidunt metus, ac tincidunt augue. Sed quis ligula arcu. Suspendisse volutpat interdum varius. Aliquam ut purus sit amet nibh dignissim egestas.</p><p>Vivamus porttitor consectetur orci, sed fringilla nulla dictum in. Aliquam eget purus facilisis neque facilisis porttitor. Sed vulputate euismod sem, eget ornare diam sodales quis. Phasellus in lacinia ex. Vivamus vitae diam sed risus laoreet tempor sed sit amet nisl. Proin efficitur felis ipsum, vitae commodo turpis aliquet eu. Ut aliquam molestie sem non hendrerit. Vestibulum ullamcorper tellus at lorem vulputate maximus vitae non dui. Donec tempus neque eget augue fringilla sagittis. Nunc accumsan magna vitae tortor varius, in pharetra eros maximus. Morbi id elit faucibus, gravida mi in, finibus elit.</p><p>Nam varius mi id lectus blandit commodo. Nulla pretium lectus nisi, pellentesque efficitur sapien commodo vel. In lorem metus, viverra et faucibus quis, lobortis et justo. Aliquam accumsan metus ut nunc feugiat ultricies. In id arcu tincidunt, commodo sapien in, venenatis magna. Aliquam eleifend erat et rhoncus condimentum. Integer magna nisi, semper et pharetra vitae, mattis vitae quam. Mauris eget interdum risus. Integer aliquam nisl eget nibh posuere gravida. Ut nec blandit dolor.</p>	30000	\N	Lorem ipsum dolor sit amet, consectetur adipiscing elit. 	0	2	1	kathmandu	https://www.youtube.com/watch?v=MZaj9v0rI40&start_radio=1&list=RDMZaj9v0rI40	\N	\N	MZaj9v0rI40	2018-09-23 07:25:22.894105	2018-09-23 06:59:27.988667	2018-09-23 07:25:22.905456	\N	1	Screenshot_from_2018-09-23_09-28-03.png	image/png	63644	2018-09-23 07:23:27.248277	1	c34eed9c-bb45-41cb-86e2-ab59f41b50c8
\.


--
-- Data for Name: contributions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contributions (id, amount, gateway, anonymous, state, raw, ref_id, created_at, updated_at, user_id, campaign_id, reward_id, uuid) FROM stdin;
1	30000	\N	f	\N	{}	\N	2018-09-23 07:43:08.107005	2018-09-23 07:43:17.342221	1	11	\N	3b369fb2-5e8e-4f95-bd4c-a560bdd7e1d4
2	10000	\N	f	\N	{}	\N	2018-09-23 07:43:56.18916	2018-09-23 07:44:00.041634	1	11	\N	4b4e0213-e1f4-421e-a07b-4fab2c40115d
3	30000	2	f	1	{}	["331d6845-7631-49dd-afb9-5a720eb26605", 0]	2018-09-23 07:44:29.088049	2018-09-23 07:44:39.547552	1	11	\N	0c42e113-9794-435f-937e-15e9a6e7983c
4	20000	2	f	1	{}	["dcaf0d94-1cea-41e9-9b1b-85115e6d2475", 0]	2018-09-23 07:52:49.184393	2018-09-23 07:52:55.24352	1	11	\N	22d45bcb-82b5-4879-bba5-5153f19dc081
5	500	\N	f	\N	{}	\N	2018-09-23 11:50:57.213307	2018-09-23 11:51:00.990442	2	11	\N	aff1535f-1812-475f-bbc5-182242235320
7	400	\N	f	\N	{}	\N	2018-09-23 11:59:33.784034	2018-09-23 11:59:36.590416	2	11	\N	77b8d79c-df98-4147-afae-97240da63d6b
8	214	\N	f	\N	{}	\N	2018-09-23 13:24:24.250679	2018-09-23 13:24:26.654376	2	11	\N	c4d4df45-eac1-4c4c-9f3c-01130cf42475
9	100	\N	f	\N	{}	\N	2018-09-23 13:25:38.943521	2018-09-23 13:25:41.373744	2	11	\N	28ad1994-8421-4488-82be-dd29ede4a1f0
10	20	\N	f	\N	{}	\N	2018-09-23 13:28:02.367475	2018-09-23 13:28:04.627841	2	11	\N	ad5d5d77-6bdb-4976-8b1d-83f96337cce1
11	10	\N	f	\N	{}	\N	2018-09-23 13:31:33.062134	2018-09-23 13:31:35.693874	2	11	\N	e0c83a27-22d3-420f-bf30-823aa2087821
12	10	\N	f	\N	{}	\N	2018-09-23 13:33:14.428863	2018-09-23 13:33:16.792302	2	11	\N	4398a22a-4084-403e-b15c-eb429ae58606
13	10	\N	f	\N	{}	\N	2018-09-23 13:33:55.042152	2018-09-23 13:33:57.502732	2	11	\N	ff34c1df-a479-4de3-8f59-bc7282a5dec6
14	10	\N	f	\N	{}	\N	2018-09-23 13:34:54.276236	2018-09-23 13:34:58.115098	2	11	\N	3ae9b3b1-3134-4a98-ae05-f60c1c440fe2
15	20	0	f	0	{}	["92758fb9-f592-4273-973d-4ef4f6fffe9c", 0]	2018-09-23 13:43:07.781804	2018-09-23 13:43:16.223816	2	11	\N	5372f42c-74a3-4aa5-ac81-444a284865f2
16	10	0	f	1	{}	["9981d5c7-84f9-4d38-8d9b-af2d7841ef1d", 1]	2018-09-23 13:48:20.845197	2018-09-23 13:48:33.162202	2	11	\N	bffa6297-04cd-47c0-8cef-f01f00decc28
17	10	\N	f	\N	{}	\N	2018-09-23 13:48:41.387273	2018-09-23 13:48:43.681566	2	11	\N	5c049653-32fa-41b8-a800-2978b814793b
18	\N	\N	\N	\N	{}	\N	2018-09-26 02:12:56.741847	2018-09-26 02:12:56.741847	1	11	\N	de615f9b-a743-40d2-b092-ac4a1370a64c
19	100	2	f	0	{}	["71f33602-1335-4cdb-8e23-1d8f21f69333", 0]	2018-09-26 02:13:16.023668	2018-09-26 02:18:43.483789	1	11	2	e6cbe27a-b6cf-4f19-98d9-c780cd683a88
6	325	\N	f	\N	{}	5eddc3a0-6691-4ddc-93e7-90641633f8f3	2018-09-23 11:58:54.574168	2018-09-26 02:23:59.121822	2	11	\N	912b5d8f-52ce-40c7-af91-62df7e49e6b6
20	100	2	t	0	{}	["80f1a04f-a027-4b41-b922-be559eff8bfc", 0]	2018-09-26 02:20:30.007997	2018-09-26 02:24:35.027072	1	11	\N	d6f9fee4-1ffb-4d5e-a0fd-56c589406690
21	100	\N	f	\N	{}	\N	2018-09-26 02:28:37.602504	2018-09-26 02:28:40.807383	1	11	\N	6acab2c4-78c0-49c4-bf39-988e0576dd68
22	100	0	f	1	{}	19a6fafb-c1b1-4856-9971-c69e2f1dd8e5	2018-09-26 02:34:20.335586	2018-09-26 02:34:30.776744	1	11	2	ed6a2841-df7c-4382-a874-e9ace10635e5
\.


--
-- Data for Name: faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faqs (id, name, description, created_at, updated_at, campaign_id, uuid) FROM stdin;
1	FAQ 1	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam feugiat suscipit massa, tempus ultrices neque efficitur malesuada. Proin ac iaculis arcu. Mauris vel lacinia neque. Donec ac elementum tortor. Nunc dui sem, luctus at bibendum sollicitudin, pellentesque ac magna. Nulla quam elit, tincidunt eget enim sed, condimentum accumsan magna. Donec sapien lacus, molestie ut diam sit amet, semper congue libero. Nulla ullamcorper commodo lacus, in mattis felis scelerisque sit amet. Maecenas justo velit, blandit finibus orci sed, finibus dignissim elit.</p><p>Integer id elementum mauris. Curabitur euismod, metus vel lacinia sagittis, mauris ante euismod odio, vitae bibendum lorem odio et ipsum. Donec ac consectetur nisi. Etiam sed venenatis ipsum. Praesent quis molestie arcu. Pellentesque tellus justo, scelerisque eu fermentum at, gravida eu nunc. Pellentesque tincidunt nulla ut facilisis rhoncus. Aliquam ullamcorper, augue ac tincidunt gravida, felis diam faucibus turpis, non pharetra metus nibh ut risus. Nullam eget dui malesuada, placerat felis a, laoreet risus.</p><p>Fusce tincidunt sollicitudin nisi vel dapibus. Donec mi nulla, auctor vitae sem eget, tempus posuere justo. Donec non purus sem. Sed nec sapien ac lacus ornare sagittis. Phasellus vitae tincidunt metus, ac tincidunt augue. Sed quis ligula arcu. Suspendisse volutpat interdum varius. Aliquam ut purus sit amet nibh dignissim egestas.</p><p>Vivamus porttitor consectetur orci, sed fringilla nulla dictum in. Aliquam eget purus facilisis neque facilisis porttitor. Sed vulputate euismod sem, eget ornare diam sodales quis. Phasellus in lacinia ex. Vivamus vitae diam sed risus laoreet tempor sed sit amet nisl. Proin efficitur felis ipsum, vitae commodo turpis aliquet eu. Ut aliquam molestie sem non hendrerit. Vestibulum ullamcorper tellus at lorem vulputate maximus vitae non dui. Donec tempus neque eget augue fringilla sagittis. Nunc accumsan magna vitae tortor varius, in pharetra eros maximus. Morbi id elit faucibus, gravida mi in, finibus elit.</p><p>Nam varius mi id lectus blandit commodo. Nulla pretium lectus nisi, pellentesque efficitur sapien commodo vel. In lorem metus, viverra et faucibus quis, lobortis et justo. Aliquam accumsan metus ut nunc feugiat ultricies. In id arcu tincidunt, commodo sapien in, venenatis magna. Aliquam eleifend erat et rhoncus condimentum. Integer magna nisi, semper et pharetra vitae, mattis vitae quam. Mauris eget interdum risus. Integer aliquam nisl eget nibh posuere gravida. Ut nec blandit dolor.</p>	2018-09-23 07:28:41.771948	2018-09-23 07:28:41.771948	11	9b0ff2c8-7e52-4e8c-8549-7697f9e7f3c5
\.


--
-- Data for Name: rewards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rewards (id, name, price, description, total_reward, claimed_reward, shipping_date, limited, created_at, updated_at, campaign_id, uuid) FROM stdin;
2	Reward 1	100	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam feugiat suscipit massa, tempus ultrices neque efficitur malesuada. Proin ac iaculis arcu. Mauris vel lacinia neque. Donec ac elementum tortor. Nunc dui sem, luctus at bibendum sollicitudin, pellentesque ac magna. Nulla quam elit, tincidunt eget enim sed, condimentum accumsan magna. Donec sapien lacus, molestie ut diam sit amet, semper congue libero. Nulla ullamcorper commodo lacus, in mattis felis scelerisque sit amet. Maecenas justo velit, blandit finibus orci sed, finibus dignissim elit.\r\n\r\n	5	\N	2018-11-30 18:15:00	t	2018-09-23 07:24:46.909146	2018-09-23 07:24:46.909146	11	4dfd7a18-0dce-431c-b606-28e8e86901ea
3	Reward 2	200	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam feugiat suscipit massa, tempus ultrices neque efficitur malesuada. Proin ac iaculis arcu. Mauris vel lacinia neque. Donec ac elementum tortor. Nunc dui sem, luctus at bibendum sollicitudin, pellentesque ac magna. Nulla quam elit, tincidunt eget enim sed, condimentum accumsan magna. Donec sapien lacus, molestie ut diam sit amet, semper congue libero. Nulla ullamcorper commodo lacus, in mattis felis scelerisque sit amet. Maecenas justo velit, blandit finibus orci sed, finibus dignissim elit.\r\n\r\n	\N	\N	2018-11-30 18:15:00	f	2018-09-23 07:25:02.768158	2018-09-23 07:25:02.768158	11	ab61067f-6ad8-4ee3-b577-7fd3ffe61f0d
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20180819042538
20180819070040
20180819083130
20180819083415
20180819085835
20180819085848
20180819091341
20180819094440
20180820145510
20180826040404
20180826040605
20180829010258
20180829010413
20180901082812
20180901085229
20180901115843
20180917122543
20180917122632
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, created_at, updated_at, name, image, provider, uid, address, country, contact_number, pan, city, about, facebook, twitter, admin, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, uuid) FROM stdin;
1	admin@gmail.com	$2a$11$a4UJbFFoZwHMR.G..jartOyv/.mIYfZQl9mNEU1D32IxJBS9RFWfS	\N	\N	\N	9	2018-09-28 01:02:08.077888	2018-09-27 13:28:22.749681	127.0.0.1	127.0.0.1	hz2Gxi9__h7DXWHHyiy-	2018-09-23 06:57:39.325878	2018-09-23 06:57:35.662068	\N	2018-09-23 06:57:35.661896	2018-09-28 01:02:08.079291	sushant bajracharya	\N	\N	\N	kaldhara	AF	9813725427		kathmandu	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam feugiat suscipit massa, tempus ultrices neque efficitur malesuada. Proin ac iaculis arcu. Mauris vel lacinia neque. Donec ac elementum tortor. Nunc dui sem, luctus at bibendum sollicitudin, pellentesque ac magna. Nulla quam elit, tincidunt eget enim sed, condimentum accumsan magna. Donec sapien lacus, molestie ut diam sit amet, semper congue libero. Nulla ullamcorper commodo lacus, in mattis felis scelerisque sit amet. Maecenas justo velit, blandit finibus orci sed, finibus dignissim elit.</p><p>Integer id elementum mauris. Curabitur euismod, metus vel lacinia sagittis, mauris ante euismod odio, vitae bibendum lorem odio et ipsum. Donec ac consectetur nisi. Etiam sed venenatis ipsum. Praesent quis molestie arcu. Pellentesque tellus justo, scelerisque eu fermentum at, gravida eu nunc. Pellentesque tincidunt nulla ut facilisis rhoncus. Aliquam ullamcorper, augue ac tincidunt gravida, felis diam faucibus turpis, non pharetra metus nibh ut risus. Nullam eget dui malesuada, placerat felis a, laoreet risus.</p><p>Fusce tincidunt sollicitudin nisi vel dapibus. Donec mi nulla, auctor vitae sem eget, tempus posuere justo. Donec non purus sem. Sed nec sapien ac lacus ornare sagittis. Phasellus vitae tincidunt metus, ac tincidunt augue. Sed quis ligula arcu. Suspendisse volutpat interdum varius. Aliquam ut purus sit amet nibh dignissim egestas.</p><p>Vivamus porttitor consectetur orci, sed fringilla nulla dictum in. Aliquam eget purus facilisis neque facilisis porttitor. Sed vulputate euismod sem, eget ornare diam sodales quis. Phasellus in lacinia ex. Vivamus vitae diam sed risus laoreet tempor sed sit amet nisl. Proin efficitur felis ipsum, vitae commodo turpis aliquet eu. Ut aliquam molestie sem non hendrerit. Vestibulum ullamcorper tellus at lorem vulputate maximus vitae non dui. Donec tempus neque eget augue fringilla sagittis. Nunc accumsan magna vitae tortor varius, in pharetra eros maximus. Morbi id elit faucibus, gravida mi in, finibus elit.</p><p>Nam varius mi id lectus blandit commodo. Nulla pretium lectus nisi, pellentesque efficitur sapien commodo vel. In lorem metus, viverra et faucibus quis, lobortis et justo. Aliquam accumsan metus ut nunc feugiat ultricies. In id arcu tincidunt, commodo sapien in, venenatis magna. Aliquam eleifend erat et rhoncus condimentum. Integer magna nisi, semper et pharetra vitae, mattis vitae quam. Mauris eget interdum risus. Integer aliquam nisl eget nibh posuere gravida. Ut nec blandit dolor.</p>			\N	Screenshot_from_2018-08-04_08-26-20.png	image/png	36269	2018-09-23 07:26:10.071574	011a611c-b147-44f8-b056-806bf5900d48
2	sushatnbajracharya@gmail.com	$2a$11$CwKDOLRERee3Eg4Xz/w9N.ux.cueOdZW8eAbDoK2VY33ADTW6JeK2	\N	\N	\N	2	2018-09-23 11:47:58.29509	2018-09-23 07:03:43.028017	127.0.0.1	127.0.0.1	8MzzM2-2MdPJxKC_a5Cz	2018-09-23 07:03:33.318885	2018-09-23 07:03:31.574581	\N	2018-09-23 07:03:31.574482	2018-09-23 11:52:20.461118	Sushant Bajracharya	http://graph.facebook.com/v2.10/840342839441091/picture	facebook	840342839441091	kaldhara	AF	9813725427		kathmandu	\N	\N	\N	\N	\N	\N	\N	\N	0a91f56e-07af-465e-927a-afb525bef332
\.


--
-- Name: campaign_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campaign_categories_id_seq', 8, true);


--
-- Name: campaign_updates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campaign_updates_id_seq', 1, true);


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campaigns_id_seq', 13, true);


--
-- Name: contributions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contributions_id_seq', 22, true);


--
-- Name: faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faqs_id_seq', 1, true);


--
-- Name: rewards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rewards_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: campaign_categories campaign_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign_categories
    ADD CONSTRAINT campaign_categories_pkey PRIMARY KEY (id);


--
-- Name: campaign_updates campaign_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign_updates
    ADD CONSTRAINT campaign_updates_pkey PRIMARY KEY (id);


--
-- Name: campaigns campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: contributions contributions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contributions
    ADD CONSTRAINT contributions_pkey PRIMARY KEY (id);


--
-- Name: faqs faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT faqs_pkey PRIMARY KEY (id);


--
-- Name: rewards rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rewards
    ADD CONSTRAINT rewards_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_campaign_updates_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaign_updates_on_campaign_id ON public.campaign_updates USING btree (campaign_id);


--
-- Name: index_campaign_updates_on_discarded_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaign_updates_on_discarded_at ON public.campaign_updates USING btree (discarded_at);


--
-- Name: index_campaigns_on_campaign_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaigns_on_campaign_category_id ON public.campaigns USING btree (campaign_category_id);


--
-- Name: index_campaigns_on_discarded_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaigns_on_discarded_at ON public.campaigns USING btree (discarded_at);


--
-- Name: index_campaigns_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaigns_on_name ON public.campaigns USING btree (name);


--
-- Name: index_campaigns_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaigns_on_user_id ON public.campaigns USING btree (user_id);


--
-- Name: index_contributions_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_contributions_on_campaign_id ON public.contributions USING btree (campaign_id);


--
-- Name: index_contributions_on_reward_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_contributions_on_reward_id ON public.contributions USING btree (reward_id);


--
-- Name: index_contributions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_contributions_on_user_id ON public.contributions USING btree (user_id);


--
-- Name: index_faqs_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_faqs_on_campaign_id ON public.faqs USING btree (campaign_id);


--
-- Name: index_rewards_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_rewards_on_campaign_id ON public.rewards USING btree (campaign_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: contributions fk_rails_44757e51f2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contributions
    ADD CONSTRAINT fk_rails_44757e51f2 FOREIGN KEY (campaign_id) REFERENCES public.campaigns(id);


--
-- Name: campaigns fk_rails_72eb2a12de; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT fk_rails_72eb2a12de FOREIGN KEY (campaign_category_id) REFERENCES public.campaign_categories(id);


--
-- Name: contributions fk_rails_9089fe7626; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contributions
    ADD CONSTRAINT fk_rails_9089fe7626 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: campaign_updates fk_rails_91d955c579; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign_updates
    ADD CONSTRAINT fk_rails_91d955c579 FOREIGN KEY (campaign_id) REFERENCES public.campaigns(id);


--
-- Name: contributions fk_rails_97f16cd387; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contributions
    ADD CONSTRAINT fk_rails_97f16cd387 FOREIGN KEY (reward_id) REFERENCES public.rewards(id);


--
-- Name: campaigns fk_rails_9eb8249bf2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT fk_rails_9eb8249bf2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: rewards fk_rails_d8077706a2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rewards
    ADD CONSTRAINT fk_rails_d8077706a2 FOREIGN KEY (campaign_id) REFERENCES public.campaigns(id);


--
-- Name: faqs fk_rails_e1ce4fc2bf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT fk_rails_e1ce4fc2bf FOREIGN KEY (campaign_id) REFERENCES public.campaigns(id);


--
-- PostgreSQL database dump complete
--

