PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: adneef
--

CREATE TABLE contacts (
    id integer NOT NULL,
    type character varying(255),
    value character varying(255),
    user_id integer
);


ALTER TABLE contacts OWNER TO adneef;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: adneef
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contacts_id_seq OWNER TO adneef;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adneef
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: adneef
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    date_of_birth character varying(255),
    biography text
);


ALTER TABLE users OWNER TO adneef;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: adneef
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO adneef;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adneef
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: adneef
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: adneef
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: adneef
--

COPY contacts (id, type, value, user_id) FROM stdin;
1	email	kyle.coberly@galvanize.com	1
2	email	cj.reynolds@galvanize.com	2
3	email	danny.fritz@galvanize.com	3
4	email	roberto.ortega@galvanize.com	4
6	home phone number	0	3
5	mobile phone number	911	1
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adneef
--

SELECT pg_catalog.setval('contacts_id_seq', 6, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: adneef
--

COPY users (id, first_name, last_name, date_of_birth, biography) FROM stdin;
1	Kyle	Coberly	2/18/1961	Web app developer, business dork, amateur economist
3	Danny	Fritz	9/15/1805	Definitely a human instructor, not a robot.
4	Roberto	Ortega	10/17/2015	Llamas age faster than people.
2	CJ	Reynolds	4/28/2031	Does the man have the moustache, or does the moustache have the man?
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adneef
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: adneef
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: adneef
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: adneef
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- Name: contacts; Type: ACL; Schema: public; Owner: adneef
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE contacts TO galvanize_admin;


--
-- Name: contacts_id_seq; Type: ACL; Schema: public; Owner: adneef
--

GRANT ALL ON SEQUENCE contacts_id_seq TO galvanize_admin;


--
-- Name: users; Type: ACL; Schema: public; Owner: adneef
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE users TO galvanize_admin;


--
-- Name: users_id_seq; Type: ACL; Schema: public; Owner: adneef
--

GRANT ALL ON SEQUENCE users_id_seq TO galvanize_admin;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: adneef
--

ALTER DEFAULT PRIVILEGES FOR ROLE adneef IN SCHEMA public REVOKE ALL ON SEQUENCES  FROM adneef;
ALTER DEFAULT PRIVILEGES FOR ROLE adneef IN SCHEMA public GRANT ALL ON SEQUENCES  TO galvanize_admin;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: adneef
--

ALTER DEFAULT PRIVILEGES FOR ROLE adneef IN SCHEMA public REVOKE ALL ON TABLES  FROM adneef;
ALTER DEFAULT PRIVILEGES FOR ROLE adneef IN SCHEMA public GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO galvanize_admin;


--
-- PostgreSQL database dump complete
--
