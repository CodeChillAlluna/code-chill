--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authority; Type: TABLE; Schema: public; Owner: code
--

CREATE TABLE public.authority (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.authority OWNER TO code;

--
-- Name: authority_seq; Type: SEQUENCE; Schema: public; Owner: code
--

CREATE SEQUENCE public.authority_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authority_seq OWNER TO code;

--
-- Name: codechilluser; Type: TABLE; Schema: public; Owner: code
--

CREATE TABLE public.codechilluser (
    id bigint NOT NULL,
    email character varying(50) NOT NULL,
    enabled boolean NOT NULL,
    firstname character varying(50) NOT NULL,
    lastpasswordresetdate timestamp without time zone NOT NULL,
    lastname character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    tokenpassword character varying(255),
    username character varying(100) NOT NULL
);


ALTER TABLE public.codechilluser OWNER TO code;

--
-- Name: codechilluser_docker; Type: TABLE; Schema: public; Owner: code
--

CREATE TABLE public.codechilluser_docker (
    codechilluser_id bigint NOT NULL,
    docker_id bigint NOT NULL
);


ALTER TABLE public.codechilluser_docker OWNER TO code;

--
-- Name: codechilluser_id_seq; Type: SEQUENCE; Schema: public; Owner: code
--

CREATE SEQUENCE public.codechilluser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.codechilluser_id_seq OWNER TO code;

--
-- Name: codechilluser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: code
--

ALTER SEQUENCE public.codechilluser_id_seq OWNED BY public.codechilluser.id;


--
-- Name: docker; Type: TABLE; Schema: public; Owner: code
--

CREATE TABLE public.docker (
    id bigint NOT NULL,
    container_id character varying(255),
    image bytea,
    name character varying(255),
    port integer NOT NULL
);


ALTER TABLE public.docker OWNER TO code;

--
-- Name: docker_language; Type: TABLE; Schema: public; Owner: code
--

CREATE TABLE public.docker_language (
    docker_id bigint NOT NULL,
    language_id bigint NOT NULL
);


ALTER TABLE public.docker_language OWNER TO code;

--
-- Name: docker_share; Type: TABLE; Schema: public; Owner: code
--

CREATE TABLE public.docker_share (
    id bigint NOT NULL,
    docker_id bigint NOT NULL,
    date timestamp without time zone,
    read_only boolean NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.docker_share OWNER TO code;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: code
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO code;

--
-- Name: image; Type: TABLE; Schema: public; Owner: code
--

CREATE TABLE public.image (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    owner bytea,
    private boolean NOT NULL,
    version character varying(255) NOT NULL
);


ALTER TABLE public.image OWNER TO code;

--
-- Name: language; Type: TABLE; Schema: public; Owner: code
--

CREATE TABLE public.language (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.language OWNER TO code;

--
-- Name: user_authority; Type: TABLE; Schema: public; Owner: code
--

CREATE TABLE public.user_authority (
    user_id bigint NOT NULL,
    authority_id bigint NOT NULL
);


ALTER TABLE public.user_authority OWNER TO code;

--
-- Name: codechilluser id; Type: DEFAULT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.codechilluser ALTER COLUMN id SET DEFAULT nextval('public.codechilluser_id_seq'::regclass);


--
-- Data for Name: authority; Type: TABLE DATA; Schema: public; Owner: code
--

COPY public.authority (id, name) FROM stdin;
1	ROLE_USER
2	ROLE_ADMIN
\.


--
-- Data for Name: codechilluser; Type: TABLE DATA; Schema: public; Owner: code
--

COPY public.codechilluser (id, email, enabled, firstname, lastpasswordresetdate, lastname, password, tokenpassword, username) FROM stdin;
1	admin@admin.com	t	admin	2016-01-01 00:00:00	admin	$2a$08$lDnHPz7eUkSi6ao14Twuau08mzhWrL4kyZGGU5xfiGALO/Vxd5DOi	\N	dummy
2	enabled@user.com	t	user	2016-01-01 00:00:00	user	$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC	\N	user
3	disabled@user.com	f	user	2016-01-01 00:00:00	user	$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC	\N	disabled
\.


--
-- Data for Name: codechilluser_docker; Type: TABLE DATA; Schema: public; Owner: code
--

COPY public.codechilluser_docker (codechilluser_id, docker_id) FROM stdin;
\.


--
-- Data for Name: docker; Type: TABLE DATA; Schema: public; Owner: code
--

COPY public.docker (id, container_id, image, name, port) FROM stdin;
\.


--
-- Data for Name: docker_language; Type: TABLE DATA; Schema: public; Owner: code
--

COPY public.docker_language (docker_id, language_id) FROM stdin;
\.


--
-- Data for Name: docker_share; Type: TABLE DATA; Schema: public; Owner: code
--

COPY public.docker_share (id, docker_id, date, read_only, user_id) FROM stdin;
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: code
--

COPY public.image (id, name, owner, private, version) FROM stdin;
1	codechillaluna/code-chill-ide	\N	f	latest
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: code
--

COPY public.language (id, name) FROM stdin;
\.


--
-- Data for Name: user_authority; Type: TABLE DATA; Schema: public; Owner: code
--

COPY public.user_authority (user_id, authority_id) FROM stdin;
1	1
1	2
2	1
3	1
\.


--
-- Name: authority_seq; Type: SEQUENCE SET; Schema: public; Owner: code
--

SELECT pg_catalog.setval('public.authority_seq', 1, false);


--
-- Name: codechilluser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: code
--

SELECT pg_catalog.setval('public.codechilluser_id_seq', 3, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: code
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- Name: authority authority_pkey; Type: CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.authority
    ADD CONSTRAINT authority_pkey PRIMARY KEY (id);


--
-- Name: codechilluser codechilluser_pkey; Type: CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.codechilluser
    ADD CONSTRAINT codechilluser_pkey PRIMARY KEY (id);


--
-- Name: docker docker_pkey; Type: CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.docker
    ADD CONSTRAINT docker_pkey PRIMARY KEY (id);


--
-- Name: docker_share docker_share_pkey; Type: CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.docker_share
    ADD CONSTRAINT docker_share_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Name: image uk7wx8imdjjcht5rh97sqbvgokp; Type: CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT uk7wx8imdjjcht5rh97sqbvgokp UNIQUE (name, version);


--
-- Name: codechilluser uk_1o9lfhw1hx56swq2ffa0v59of; Type: CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.codechilluser
    ADD CONSTRAINT uk_1o9lfhw1hx56swq2ffa0v59of UNIQUE (username);


--
-- Name: docker_language fk47o6c3aeifhbdn4ymtm7uyn8u; Type: FK CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.docker_language
    ADD CONSTRAINT fk47o6c3aeifhbdn4ymtm7uyn8u FOREIGN KEY (docker_id) REFERENCES public.docker(id);


--
-- Name: user_authority fkgvxjs381k6f48d5d2yi11uh89; Type: FK CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.user_authority
    ADD CONSTRAINT fkgvxjs381k6f48d5d2yi11uh89 FOREIGN KEY (authority_id) REFERENCES public.authority(id);


--
-- Name: user_authority fkjt49mymwj6nf2ntg5uak1b3xq; Type: FK CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.user_authority
    ADD CONSTRAINT fkjt49mymwj6nf2ntg5uak1b3xq FOREIGN KEY (user_id) REFERENCES public.codechilluser(id);


--
-- Name: codechilluser_docker fkmpb99lwip9ngwallvua6allst; Type: FK CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.codechilluser_docker
    ADD CONSTRAINT fkmpb99lwip9ngwallvua6allst FOREIGN KEY (codechilluser_id) REFERENCES public.codechilluser(id);


--
-- Name: docker_language fknx2699i72ppm3u3iuto5i0t1a; Type: FK CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.docker_language
    ADD CONSTRAINT fknx2699i72ppm3u3iuto5i0t1a FOREIGN KEY (language_id) REFERENCES public.language(id);


--
-- Name: codechilluser_docker fkrf52x9ydy7ifi2p2vfna8cqlw; Type: FK CONSTRAINT; Schema: public; Owner: code
--

ALTER TABLE ONLY public.codechilluser_docker
    ADD CONSTRAINT fkrf52x9ydy7ifi2p2vfna8cqlw FOREIGN KEY (docker_id) REFERENCES public.docker(id);


--
-- PostgreSQL database dump complete
--

