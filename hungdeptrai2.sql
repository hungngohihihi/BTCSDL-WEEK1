--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-13 23:47:01 +07

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
-- TOC entry 210 (class 1259 OID 16492)
-- Name: countries; Type: TABLE; Schema: public; Owner: hung
--

CREATE TABLE public.countries (
    country_id character(1) NOT NULL,
    region_id integer,
    country_name character varying(40)
);


ALTER TABLE public.countries OWNER TO hung;

--
-- TOC entry 212 (class 1259 OID 16512)
-- Name: departments; Type: TABLE; Schema: public; Owner: hung
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    location_id integer,
    department_name character varying(30),
    manager_id integer
);


ALTER TABLE public.departments OWNER TO hung;

--
-- TOC entry 214 (class 1259 OID 16555)
-- Name: employees; Type: TABLE; Schema: public; Owner: hung
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25),
    email character varying(25),
    phone_number character varying(20),
    hire_date date,
    job_id character varying(10) NOT NULL,
    salary integer,
    commission_pct integer,
    manager_id integer,
    department_id integer NOT NULL
);


ALTER TABLE public.employees OWNER TO hung;

--
-- TOC entry 216 (class 1259 OID 16579)
-- Name: job_grades; Type: TABLE; Schema: public; Owner: hung
--

CREATE TABLE public.job_grades (
    grade_level character varying(2) NOT NULL,
    lowest_sal integer,
    highest_sal integer
);


ALTER TABLE public.job_grades OWNER TO hung;

--
-- TOC entry 213 (class 1259 OID 16542)
-- Name: job_history; Type: TABLE; Schema: public; Owner: hung
--

CREATE TABLE public.job_history (
    employee_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date,
    job_id character varying(10) NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.job_history OWNER TO hung;

--
-- TOC entry 215 (class 1259 OID 16564)
-- Name: jobs; Type: TABLE; Schema: public; Owner: hung
--

CREATE TABLE public.jobs (
    job_id character varying(10) NOT NULL,
    job_title character varying(35),
    min_salary integer,
    max_salary integer
);


ALTER TABLE public.jobs OWNER TO hung;

--
-- TOC entry 211 (class 1259 OID 16502)
-- Name: locations; Type: TABLE; Schema: public; Owner: hung
--

CREATE TABLE public.locations (
    location_id integer NOT NULL,
    country_id character(2),
    street_address character varying(25),
    postal_code character varying(12),
    city character varying(30),
    state_province character varying(12)
);


ALTER TABLE public.locations OWNER TO hung;

--
-- TOC entry 209 (class 1259 OID 16467)
-- Name: regions; Type: TABLE; Schema: public; Owner: hung
--

CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(25)
);


ALTER TABLE public.regions OWNER TO hung;

--
-- TOC entry 3461 (class 2606 OID 16496)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- TOC entry 3465 (class 2606 OID 16516)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- TOC entry 3471 (class 2606 OID 16583)
-- Name: job_grades job_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.job_grades
    ADD CONSTRAINT job_grades_pkey PRIMARY KEY (grade_level);


--
-- TOC entry 3469 (class 2606 OID 16568)
-- Name: jobs job_id; Type: CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT job_id PRIMARY KEY (job_id);


--
-- TOC entry 3467 (class 2606 OID 16551)
-- Name: job_history khoangoai1; Type: CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT khoangoai1 PRIMARY KEY (employee_id, start_date);


--
-- TOC entry 3463 (class 2606 OID 16506)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- TOC entry 3459 (class 2606 OID 16471)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);


--
-- TOC entry 3473 (class 2606 OID 16507)
-- Name: locations country_id; Type: FK CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT country_id FOREIGN KEY (country_id) REFERENCES public.countries(country_id);


--
-- TOC entry 3475 (class 2606 OID 16545)
-- Name: job_history department_id; Type: FK CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT department_id FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 3477 (class 2606 OID 16559)
-- Name: employees department_id; Type: FK CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT department_id FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 3478 (class 2606 OID 16569)
-- Name: employees job_id; Type: FK CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT job_id FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);


--
-- TOC entry 3476 (class 2606 OID 16574)
-- Name: job_history job_id; Type: FK CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_id FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);


--
-- TOC entry 3474 (class 2606 OID 16517)
-- Name: departments location_id; Type: FK CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT location_id FOREIGN KEY (location_id) REFERENCES public.locations(location_id);


--
-- TOC entry 3472 (class 2606 OID 16497)
-- Name: countries region_id; Type: FK CONSTRAINT; Schema: public; Owner: hung
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT region_id FOREIGN KEY (region_id) REFERENCES public.regions(region_id);


-- Completed on 2022-04-13 23:47:01 +07

--
-- PostgreSQL database dump complete
--

