--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-16 17:57:30

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
-- TOC entry 213 (class 1259 OID 17391)
-- Name: email_verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_verification (
    id integer NOT NULL,
    user_id integer NOT NULL,
    auth_toke character varying(250) NOT NULL,
    is_verified boolean NOT NULL
);


ALTER TABLE public.email_verification OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17389)
-- Name: email_verification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_verification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_verification_id_seq OWNER TO postgres;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 212
-- Name: email_verification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_verification_id_seq OWNED BY public.email_verification.id;


--
-- TOC entry 207 (class 1259 OID 17359)
-- Name: employers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employers (
    id integer NOT NULL,
    company_name character varying(200) NOT NULL,
    website_adress character varying(100) NOT NULL,
    company_mail character varying(100) NOT NULL,
    phone_number character varying(100) NOT NULL
);


ALTER TABLE public.employers OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17330)
-- Name: job_seekers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_seekers (
    id integer NOT NULL,
    first_name character varying(75) NOT NULL,
    last_name character varying(75) NOT NULL,
    identity_number character varying(11) NOT NULL,
    birth_date date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.job_seekers OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17328)
-- Name: job_seekers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_seekers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_seekers_id_seq OWNER TO postgres;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 200
-- Name: job_seekers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_seekers_id_seq OWNED BY public.job_seekers.id;


--
-- TOC entry 211 (class 1259 OID 17378)
-- Name: mernis_verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mernis_verification (
    id integer NOT NULL,
    user_id integer NOT NULL,
    is_verified boolean NOT NULL
);


ALTER TABLE public.mernis_verification OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17376)
-- Name: mernis_verification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mernis_verification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mernis_verification_id_seq OWNER TO postgres;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 210
-- Name: mernis_verification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mernis_verification_id_seq OWNED BY public.mernis_verification.id;


--
-- TOC entry 206 (class 1259 OID 17357)
-- Name: omployers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.omployers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.omployers_id_seq OWNER TO postgres;

--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 206
-- Name: omployers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.omployers_id_seq OWNED BY public.employers.id;


--
-- TOC entry 205 (class 1259 OID 17351)
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    id integer NOT NULL,
    position_name character varying(200) NOT NULL
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17349)
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_id_seq OWNER TO postgres;

--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 204
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.id;


--
-- TOC entry 209 (class 1259 OID 17370)
-- Name: system_personnel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_personnel (
    id integer NOT NULL,
    position_name character varying(100) NOT NULL,
    first_name character varying(75) NOT NULL,
    last_name character varying(75) NOT NULL
);


ALTER TABLE public.system_personnel OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17368)
-- Name: system_personnel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.system_personnel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_personnel_id_seq OWNER TO postgres;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 208
-- Name: system_personnel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.system_personnel_id_seq OWNED BY public.system_personnel.id;


--
-- TOC entry 215 (class 1259 OID 17404)
-- Name: system_personnel_verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_personnel_verification (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    competent_system_personnel_id integer NOT NULL,
    is_verified boolean NOT NULL
);


ALTER TABLE public.system_personnel_verification OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17402)
-- Name: system_personnel_verification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.system_personnel_verification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_personnel_verification_id_seq OWNER TO postgres;

--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 214
-- Name: system_personnel_verification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.system_personnel_verification_id_seq OWNED BY public.system_personnel_verification.id;


--
-- TOC entry 203 (class 1259 OID 17341)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    password_repeat character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17339)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2900 (class 2604 OID 17394)
-- Name: email_verification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_verification ALTER COLUMN id SET DEFAULT nextval('public.email_verification_id_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 17362)
-- Name: employers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers ALTER COLUMN id SET DEFAULT nextval('public.omployers_id_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 17333)
-- Name: job_seekers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_seekers ALTER COLUMN id SET DEFAULT nextval('public.job_seekers_id_seq'::regclass);


--
-- TOC entry 2899 (class 2604 OID 17381)
-- Name: mernis_verification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mernis_verification ALTER COLUMN id SET DEFAULT nextval('public.mernis_verification_id_seq'::regclass);


--
-- TOC entry 2896 (class 2604 OID 17354)
-- Name: positions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions ALTER COLUMN id SET DEFAULT nextval('public.positions_id_seq'::regclass);


--
-- TOC entry 2898 (class 2604 OID 17373)
-- Name: system_personnel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_personnel ALTER COLUMN id SET DEFAULT nextval('public.system_personnel_id_seq'::regclass);


--
-- TOC entry 2901 (class 2604 OID 17407)
-- Name: system_personnel_verification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_personnel_verification ALTER COLUMN id SET DEFAULT nextval('public.system_personnel_verification_id_seq'::regclass);


--
-- TOC entry 2895 (class 2604 OID 17344)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2919 (class 2606 OID 17396)
-- Name: email_verification PK_id_email_verification; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_verification
    ADD CONSTRAINT "PK_id_email_verification" PRIMARY KEY (id);


--
-- TOC entry 2913 (class 2606 OID 17367)
-- Name: employers PK_id_employer; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT "PK_id_employer" PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 17336)
-- Name: job_seekers PK_id_job_seekers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_seekers
    ADD CONSTRAINT "PK_id_job_seekers" PRIMARY KEY (id);


--
-- TOC entry 2917 (class 2606 OID 17383)
-- Name: mernis_verification PK_id_mernis_verification; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mernis_verification
    ADD CONSTRAINT "PK_id_mernis_verification" PRIMARY KEY (id);


--
-- TOC entry 2911 (class 2606 OID 17356)
-- Name: positions PK_id_positions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT "PK_id_positions" PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 17375)
-- Name: system_personnel PK_id_system_personnel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_personnel
    ADD CONSTRAINT "PK_id_system_personnel" PRIMARY KEY (id);


--
-- TOC entry 2921 (class 2606 OID 17409)
-- Name: system_personnel_verification PK_id_system_personnel_verification; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_personnel_verification
    ADD CONSTRAINT "PK_id_system_personnel_verification" PRIMARY KEY (id);


--
-- TOC entry 2907 (class 2606 OID 17346)
-- Name: users PK_id_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_id_users" PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 17348)
-- Name: users UK_email_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UK_email_users" UNIQUE (email);


--
-- TOC entry 2905 (class 2606 OID 17338)
-- Name: job_seekers UK_identity_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_seekers
    ADD CONSTRAINT "UK_identity_number" UNIQUE (identity_number);


--
-- TOC entry 2925 (class 2606 OID 17397)
-- Name: email_verification FK_email_verification_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_verification
    ADD CONSTRAINT "FK_email_verification_users" FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2922 (class 2606 OID 17420)
-- Name: job_seekers FK_job_seekers_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_seekers
    ADD CONSTRAINT "FK_job_seekers_users" FOREIGN KEY (id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2924 (class 2606 OID 17384)
-- Name: mernis_verification FK_mernis_verification_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mernis_verification
    ADD CONSTRAINT "FK_mernis_verification_users" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2923 (class 2606 OID 17425)
-- Name: system_personnel FK_system_personnel_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_personnel
    ADD CONSTRAINT "FK_system_personnel_users" FOREIGN KEY (id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2926 (class 2606 OID 17410)
-- Name: system_personnel_verification FK_system_personnel_verification_employers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_personnel_verification
    ADD CONSTRAINT "FK_system_personnel_verification_employers" FOREIGN KEY (employer_id) REFERENCES public.employers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2927 (class 2606 OID 17415)
-- Name: system_personnel_verification system_personnel_verification_system_personnel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_personnel_verification
    ADD CONSTRAINT system_personnel_verification_system_personnel FOREIGN KEY (competent_system_personnel_id) REFERENCES public.system_personnel(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2021-05-16 17:57:31

--
-- PostgreSQL database dump complete
--

