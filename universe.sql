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
    distance_in_million_ly numeric,
    stars_in_billions integer,
    age_in_millions_of_years numeric
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
-- Name: galaxy_to_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_to_moons (
    galaxy_to_moons_id integer NOT NULL,
    galaxy_name character varying(30) NOT NULL,
    star_name character varying(50) NOT NULL,
    planet_name character varying(50) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.galaxy_to_moons OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_spheric boolean,
    orbit_period character varying(50)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_rocky boolean,
    has_life boolean,
    distance_in_millions_of_km numeric,
    age_in_millions_of_years numeric,
    moons integer
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
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(50),
    distance_in_ly numeric,
    planets integer,
    age_in_millions_of_years numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is the galaxy that includes our Solar System, with the name describing it''s appearence from Earth', 0, 400, 13610);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Is a barred spiral galaxy and the nearest large galaxy to the Milky Way', 2.5, 1000, 10000);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 'Is a Starburst galaxy approximately 12 million light years away in the constellation Ursa Major', 11.4, 30, 13300);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy', 'Is a face-on spiral galaxy 21 million light years away in the constellation Ursa Major', 21, 1000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Is a peculiar galaxy of unclear classification, in the constellation borders of Virgo and Corvus', 29.35, 100, 13250);
INSERT INTO public.galaxy VALUES (6, 'Whirpool Galaxy', 'Is an interacting grand-design spiral galaxy', 61, 100, 400);


--
-- Data for Name: galaxy_to_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_to_moons VALUES (8, 'Milky Way', 'Sun', 'Mars', 'Deimos');
INSERT INTO public.galaxy_to_moons VALUES (7, 'Milky Way', 'Sun', 'Mars', 'Fobos');
INSERT INTO public.galaxy_to_moons VALUES (14, 'Milky Way', 'Sun', 'Jupiter', 'Adrastea');
INSERT INTO public.galaxy_to_moons VALUES (15, 'Milky Way', 'Sun', 'Jupiter', 'Amaltea');
INSERT INTO public.galaxy_to_moons VALUES (13, 'Milky Way', 'Sun', 'Jupiter', 'Calisto');
INSERT INTO public.galaxy_to_moons VALUES (10, 'Milky Way', 'Sun', 'Jupiter', 'Europa');
INSERT INTO public.galaxy_to_moons VALUES (11, 'Milky Way', 'Sun', 'Jupiter', 'Ganimedes');
INSERT INTO public.galaxy_to_moons VALUES (12, 'Milky Way', 'Sun', 'Jupiter', 'Metis');
INSERT INTO public.galaxy_to_moons VALUES (16, 'Milky Way', 'Sun', 'Jupiter', 'Tebe');
INSERT INTO public.galaxy_to_moons VALUES (20, 'Milky Way', 'Sun', 'Saturn', 'Dione');
INSERT INTO public.galaxy_to_moons VALUES (18, 'Milky Way', 'Sun', 'Saturn', 'Encelado');
INSERT INTO public.galaxy_to_moons VALUES (21, 'Milky Way', 'Sun', 'Saturn', 'Rea');
INSERT INTO public.galaxy_to_moons VALUES (1, 'Milky Way', 'Sun', 'Neptune', 'Triton');
INSERT INTO public.galaxy_to_moons VALUES (2, 'Milky Way', 'Sun', 'Uranus', 'Miranda');
INSERT INTO public.galaxy_to_moons VALUES (3, 'Milky Way', 'Sun', 'Uranus', 'Ariel');
INSERT INTO public.galaxy_to_moons VALUES (4, 'Milky Way', 'Sun', 'Uranus', 'Umbriel');
INSERT INTO public.galaxy_to_moons VALUES (5, 'Milky Way', 'Sun', 'Uranus', 'Titania');
INSERT INTO public.galaxy_to_moons VALUES (6, 'Milky Way', 'Sun', 'Uranus', 'Oberon');
INSERT INTO public.galaxy_to_moons VALUES (9, 'Milky Way', 'Sun', 'Jupiter', 'Io');
INSERT INTO public.galaxy_to_moons VALUES (17, 'Milky Way', 'Sun', 'Saturn', 'Mimas');
INSERT INTO public.galaxy_to_moons VALUES (19, 'Milky Way', 'Sun', 'Saturn', 'Tetis');
INSERT INTO public.galaxy_to_moons VALUES (22, 'Milky Way', 'Sun', 'Earth', 'Moon');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (8, 4, 'Deimos', false, '1d');
INSERT INTO public.moon VALUES (7, 4, 'Fobos', false, '7h');
INSERT INTO public.moon VALUES (14, 5, 'Adrastea', false, '7h');
INSERT INTO public.moon VALUES (15, 5, 'Amaltea', false, '11h');
INSERT INTO public.moon VALUES (13, 5, 'Calisto', true, '16d');
INSERT INTO public.moon VALUES (10, 5, 'Europa', true, '3d');
INSERT INTO public.moon VALUES (11, 5, 'Ganimedes', true, '7d');
INSERT INTO public.moon VALUES (12, 5, 'Metis', false, '7h');
INSERT INTO public.moon VALUES (16, 5, 'Tebe', false, '16h');
INSERT INTO public.moon VALUES (20, 6, 'Dione', true, '2d');
INSERT INTO public.moon VALUES (18, 6, 'Encelado', true, '32h');
INSERT INTO public.moon VALUES (21, 6, 'Rea', true, '4d');
INSERT INTO public.moon VALUES (1, 8, 'Triton', true, '5d');
INSERT INTO public.moon VALUES (2, 7, 'Miranda', true, '1d');
INSERT INTO public.moon VALUES (3, 7, 'Ariel', true, '2d');
INSERT INTO public.moon VALUES (4, 7, 'Umbriel', true, '4d');
INSERT INTO public.moon VALUES (5, 7, 'Titania', true, '8d');
INSERT INTO public.moon VALUES (6, 7, 'Oberon', true, '13d');
INSERT INTO public.moon VALUES (9, 5, 'Io', true, '1d');
INSERT INTO public.moon VALUES (17, 6, 'Mimas', true, '22h');
INSERT INTO public.moon VALUES (19, 6, 'Tetis', true, '1d');
INSERT INTO public.moon VALUES (22, 2, 'Moon', true, '29d');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Venus', true, false, 261, 4503, 0);
INSERT INTO public.planet VALUES (2, 1, 'Earth', true, true, 0, 4550, 1);
INSERT INTO public.planet VALUES (3, 1, 'Mercury', true, false, 82, 4503, 0);
INSERT INTO public.planet VALUES (4, 1, 'Mars', true, false, 54.6, 4603, 2);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', false, false, 588, 4603, 8);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', false, false, 1195, 4503, 9);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', false, false, 2600, 4503, 5);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', false, false, 4300, 4503, 14);
INSERT INTO public.planet VALUES (9, 7, 'K2-18b', false, false, NULL, NULL, 0);
INSERT INTO public.planet VALUES (10, 7, 'K2-18c', false, false, NULL, NULL, 0);
INSERT INTO public.planet VALUES (11, 5, 'Gliese 180 b', true, false, NULL, NULL, 0);
INSERT INTO public.planet VALUES (12, 5, 'Gliese 180 c', true, false, NULL, NULL, 0);
INSERT INTO public.planet VALUES (13, 5, 'Gliese 180 d', false, false, NULL, NULL, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'yellow dwarf', 0, 8, 4600);
INSERT INTO public.star VALUES (2, 1, 'Achernar', 'B6-Vep + A1V - A3V', 139, 0, 17.3);
INSERT INTO public.star VALUES (3, 1, 'Canopus', 'F0II', 309, 0, 25.1);
INSERT INTO public.star VALUES (4, 1, 'Furud', 'B2.5 V', 362, 0, 32);
INSERT INTO public.star VALUES (5, 1, 'Gliese 180', 'red dwarf', 38.96, 3, 5000);
INSERT INTO public.star VALUES (7, 1, 'K2-18', 'red dwarf', 124.2, 2, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_to_moons galaxy_to_moons_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_to_moons
    ADD CONSTRAINT galaxy_to_moons_pk PRIMARY KEY (galaxy_to_moons_id);


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
-- Name: galaxy_to_moons name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_to_moons
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


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

