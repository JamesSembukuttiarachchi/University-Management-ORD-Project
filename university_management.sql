--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Homebrew)
-- Dumped by pg_dump version 14.13 (Homebrew)
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
-- Name: address; Type: TYPE; Schema: public; Owner: database_user
--

CREATE TYPE public.address AS (
    street character varying(50),
    city character varying(30),
    zip_code character(6)
);
ALTER TYPE public.address OWNER TO database_user;
SET default_tablespace = '';
SET default_table_access_method = heap;
--
-- Name: course; Type: TABLE; Schema: public; Owner: database_user
--

CREATE TABLE public.course (
    course_id integer NOT NULL,
    course_name character varying(100),
    credits integer
);
ALTER TABLE public.course OWNER TO database_user;
--
-- Name: course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: database_user
--

CREATE SEQUENCE public.course_course_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.course_course_id_seq OWNER TO database_user;
--
-- Name: course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database_user
--

ALTER SEQUENCE public.course_course_id_seq OWNED BY public.course.course_id;
--
-- Name: enrollment; Type: TABLE; Schema: public; Owner: database_user
--

CREATE TABLE public.enrollment (
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    grade character(1)
);
ALTER TABLE public.enrollment OWNER TO database_user;
--
-- Name: person; Type: TABLE; Schema: public; Owner: database_user
--

CREATE TABLE public.person (
    person_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    dob date,
    address public.address
);
ALTER TABLE public.person OWNER TO database_user;
--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: database_user
--

CREATE SEQUENCE public.person_person_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.person_person_id_seq OWNER TO database_user;
--
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database_user
--

ALTER SEQUENCE public.person_person_id_seq OWNED BY public.person.person_id;
--
-- Name: professor; Type: TABLE; Schema: public; Owner: database_user
--

CREATE TABLE public.professor (
    professor_id integer NOT NULL,
    hire_date date
) INHERITS (public.person);
ALTER TABLE public.professor OWNER TO database_user;
--
-- Name: professor_professor_id_seq; Type: SEQUENCE; Schema: public; Owner: database_user
--

CREATE SEQUENCE public.professor_professor_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.professor_professor_id_seq OWNER TO database_user;
--
-- Name: professor_professor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database_user
--

ALTER SEQUENCE public.professor_professor_id_seq OWNED BY public.professor.professor_id;
--
-- Name: student; Type: TABLE; Schema: public; Owner: database_user
--

CREATE TABLE public.student (
    student_id integer NOT NULL,
    enrollment_year integer
) INHERITS (public.person);
ALTER TABLE public.student OWNER TO database_user;
--
-- Name: student_student_id_seq; Type: SEQUENCE; Schema: public; Owner: database_user
--

CREATE SEQUENCE public.student_student_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.student_student_id_seq OWNER TO database_user;
--
-- Name: student_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database_user
--

ALTER SEQUENCE public.student_student_id_seq OWNED BY public.student.student_id;
--
-- Name: course course_id; Type: DEFAULT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.course
ALTER COLUMN course_id
SET DEFAULT nextval('public.course_course_id_seq'::regclass);
--
-- Name: person person_id; Type: DEFAULT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.person
ALTER COLUMN person_id
SET DEFAULT nextval('public.person_person_id_seq'::regclass);
--
-- Name: professor person_id; Type: DEFAULT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.professor
ALTER COLUMN person_id
SET DEFAULT nextval('public.person_person_id_seq'::regclass);
--
-- Name: professor professor_id; Type: DEFAULT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.professor
ALTER COLUMN professor_id
SET DEFAULT nextval('public.professor_professor_id_seq'::regclass);
--
-- Name: student person_id; Type: DEFAULT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.student
ALTER COLUMN person_id
SET DEFAULT nextval('public.person_person_id_seq'::regclass);
--
-- Name: student student_id; Type: DEFAULT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.student
ALTER COLUMN student_id
SET DEFAULT nextval('public.student_student_id_seq'::regclass);
--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: database_user
--

COPY public.course (course_id, course_name, credits)
FROM stdin;
1 Database Systems 3 2 Operating Systems 4 \.--
-- Data for Name: enrollment; Type: TABLE DATA; Schema: public; Owner: database_user
--

COPY public.enrollment (student_id, course_id, grade)
FROM stdin;
1 1 A 1 2 B \.--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: database_user
--

COPY public.person (person_id, first_name, last_name, dob, address)
FROM stdin;
1 John Doe 2000 -01 -01 ("123 Main St", Springfield, 123456) 3 Jane Smith 1980 -05 -20 ("456 Oak St", Greenville, 654321) \.--
-- Data for Name: professor; Type: TABLE DATA; Schema: public; Owner: database_user
--

COPY public.professor (
    person_id,
    first_name,
    last_name,
    dob,
    address,
    professor_id,
    hire_date
)
FROM stdin;
4 \ N \ N \ N \ N 1 2010 -08 -15 \.--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: database_user
--

COPY public.student (
    person_id,
    first_name,
    last_name,
    dob,
    address,
    student_id,
    enrollment_year
)
FROM stdin;
2 \ N \ N \ N \ N 1 2020 \.--
-- Name: course_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database_user
--

SELECT pg_catalog.setval('public.course_course_id_seq', 2, true);
--
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database_user
--

SELECT pg_catalog.setval('public.person_person_id_seq', 4, true);
--
-- Name: professor_professor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database_user
--

SELECT pg_catalog.setval('public.professor_professor_id_seq', 1, true);
--
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database_user
--

SELECT pg_catalog.setval('public.student_student_id_seq', 1, true);
--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.course
ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);
--
-- Name: enrollment enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.enrollment
ADD CONSTRAINT enrollment_pkey PRIMARY KEY (student_id, course_id);
--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.person
ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);
--
-- Name: professor professor_pkey; Type: CONSTRAINT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.professor
ADD CONSTRAINT professor_pkey PRIMARY KEY (professor_id);
--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.student
ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);
--
-- Name: enrollment enrollment_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.enrollment
ADD CONSTRAINT enrollment_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);
--
-- Name: enrollment enrollment_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: database_user
--

ALTER TABLE ONLY public.enrollment
ADD CONSTRAINT enrollment_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id);
--
-- PostgreSQL database dump complete
--