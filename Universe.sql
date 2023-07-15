--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_millions_of_years integer,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: monster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.monster (
    monster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.monster OWNER TO freecodecamp;

--
-- Name: monster_monster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.monster_monster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monster_monster_id_seq OWNER TO freecodecamp;

--
-- Name: monster_monster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.monster_monster_id_seq OWNED BY public.monster.monster_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_km numeric(10,1),
    planet_id integer NOT NULL,
    has_mineral boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_km numeric(10,1),
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_millions_of_years integer,
    galaxy_id integer NOT NULL,
    radius_in_km numeric(10,1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: monster monster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.monster ALTER COLUMN monster_id SET DEFAULT nextval('public.monster_monster_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'alpha', 'First galaxy', 1000000, true);
INSERT INTO public.galaxy VALUES (2, 'beta', 'second galaxy', 1000, false);
INSERT INTO public.galaxy VALUES (3, 'delta', 'third galaxy', 10, false);
INSERT INTO public.galaxy VALUES (4, 'alpha2', 'Split from First galaxy ', 900000, true);
INSERT INTO public.galaxy VALUES (5, 'alpha3', 'Seoncd split from First galaxy ', 800000, true);
INSERT INTO public.galaxy VALUES (6, 'beta2', 'Split from second galaxy', 900, false);


--
-- Data for Name: monster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.monster VALUES (1, 'Gorzila', 1);
INSERT INTO public.monster VALUES (2, 'Super Pig', 2);
INSERT INTO public.monster VALUES (3, 'Titan', 3);
INSERT INTO public.monster VALUES (4, 'Great Dragon', 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'm1', 100.0, 1, false);
INSERT INTO public.moon VALUES (2, 'm2', 200.0, 1, false);
INSERT INTO public.moon VALUES (3, 'm3', 300.0, 1, false);
INSERT INTO public.moon VALUES (4, 'm4', 400.0, 1, false);
INSERT INTO public.moon VALUES (5, 'm5', 500.0, 2, false);
INSERT INTO public.moon VALUES (6, 'm6', 500.0, 2, false);
INSERT INTO public.moon VALUES (7, 'm7', 700.0, 2, false);
INSERT INTO public.moon VALUES (8, 'm8', 800.0, 2, false);
INSERT INTO public.moon VALUES (9, 'm9', 900.0, 2, false);
INSERT INTO public.moon VALUES (10, 'mX', 900.0, 2, false);
INSERT INTO public.moon VALUES (11, 'mXI', 1100.0, 3, false);
INSERT INTO public.moon VALUES (12, 'mXII', 1300.0, 3, false);
INSERT INTO public.moon VALUES (13, 'mXIII', 1400.0, 3, false);
INSERT INTO public.moon VALUES (14, 'mXIV', 1600.0, 4, false);
INSERT INTO public.moon VALUES (15, 'mXV', 1600.0, 4, false);
INSERT INTO public.moon VALUES (16, 'mXVI', 200.0, 5, false);
INSERT INTO public.moon VALUES (17, 'mXVII', 200.0, 5, false);
INSERT INTO public.moon VALUES (18, 'mXVIII', 10.0, 5, false);
INSERT INTO public.moon VALUES (19, 'mXIX', 5.0, 5, false);
INSERT INTO public.moon VALUES (20, 'mXX', 666.0, 6, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'P1', 500000.0, true, 1);
INSERT INTO public.planet VALUES (2, 'P2', 600000.0, true, 1);
INSERT INTO public.planet VALUES (3, 'P3', 5500000.0, false, 2);
INSERT INTO public.planet VALUES (4, 'P4', 45500000.0, false, 2);
INSERT INTO public.planet VALUES (5, 'P5', 345500000.0, false, 3);
INSERT INTO public.planet VALUES (6, 'P6', 2200000.0, false, 3);
INSERT INTO public.planet VALUES (7, 'P7', 122200000.0, false, 4);
INSERT INTO public.planet VALUES (8, 'P8', 122200110.0, true, 4);
INSERT INTO public.planet VALUES (9, 'P9', 66200110.0, false, 5);
INSERT INTO public.planet VALUES (10, 'PX', 110.0, false, 5);
INSERT INTO public.planet VALUES (11, 'PXI', 777110.0, false, 6);
INSERT INTO public.planet VALUES (12, 'PXII', 557110.0, false, 6);
INSERT INTO public.planet VALUES (13, 'PXIII', 997110.0, true, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Red', 3000, 1, 777.0);
INSERT INTO public.star VALUES (2, 'Orange', 2999, 1, 777.0);
INSERT INTO public.star VALUES (3, 'Aoi', 1999, 1, 777.0);
INSERT INTO public.star VALUES (4, 'Yellow', 999, 2, 777.0);
INSERT INTO public.star VALUES (5, 'Green', 888, 3, 999.0);
INSERT INTO public.star VALUES (6, 'Blue', 777, 4, 999.0);
INSERT INTO public.star VALUES (7, 'Purple', 555, 5, 999.0);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: monster_monster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.monster_monster_id_seq', 4, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: monster monster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.monster
    ADD CONSTRAINT monster_name_key UNIQUE (name);


--
-- Name: monster monster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.monster
    ADD CONSTRAINT monster_pkey PRIMARY KEY (monster_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: monster monster_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.monster
    ADD CONSTRAINT monster_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

