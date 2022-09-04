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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    description text,
    name character varying(256) NOT NULL,
    apparent_magnitude numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    planet_id integer,
    description text,
    name character varying(256) NOT NULL,
    is_spherical boolean
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    star_id integer,
    description text,
    name character varying(256) NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_id integer,
    description text,
    name character varying(256) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', NULL);
INSERT INTO public.constellation VALUES (2, 'Corvus', NULL);
INSERT INTO public.constellation VALUES (3, 'Centaurus', NULL);
INSERT INTO public.constellation VALUES (4, 'Coma Berenices', NULL);
INSERT INTO public.constellation VALUES (5, 'Ursa Major', NULL);
INSERT INTO public.constellation VALUES (6, 'Virgo', NULL);
INSERT INTO public.constellation VALUES (7, 'Sculptor', NULL);
INSERT INTO public.constellation VALUES (8, 'Sagittarius', NULL);
INSERT INTO public.constellation VALUES (9, 'Dorado/Mensa', NULL);
INSERT INTO public.constellation VALUES (10, 'Tucana', NULL);
INSERT INTO public.constellation VALUES (11, 'Triangulum', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, -7, 12, NULL, 'Milky Way', NULL);
INSERT INTO public.galaxy VALUES (2, 1, 10, NULL, 'Large Magellanic Cloud', NULL);
INSERT INTO public.galaxy VALUES (3, 3, 10, NULL, 'Small Mag clod', NULL);
INSERT INTO public.galaxy VALUES (4, 3, 10, NULL, 'Andromeda', NULL);
INSERT INTO public.galaxy VALUES (5, 1, 2, NULL, 'Triangulum', NULL);
INSERT INTO public.galaxy VALUES (6, 4, 21, NULL, 'Centaurus A', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 1, 1, NULL, 'mercurio', NULL);
INSERT INTO public.moon VALUES (2, 1, 1, 1, NULL, 'venus', NULL);
INSERT INTO public.moon VALUES (3, 1, 1, 1, NULL, 'tierra', NULL);
INSERT INTO public.moon VALUES (4, 1, 1, 1, NULL, 'marte', NULL);
INSERT INTO public.moon VALUES (5, 1, 1, 1, NULL, 'mostoles', NULL);
INSERT INTO public.moon VALUES (6, 1, 1, 1, NULL, 'benicasim', NULL);
INSERT INTO public.moon VALUES (7, 1, 1, 1, NULL, 'urano', NULL);
INSERT INTO public.moon VALUES (8, 1, 1, 1, NULL, 'teruel', NULL);
INSERT INTO public.moon VALUES (9, 1, 1, 1, NULL, 'mordor', NULL);
INSERT INTO public.moon VALUES (10, 1, 1, 1, NULL, 'castellon', NULL);
INSERT INTO public.moon VALUES (11, 1, 1, 1, NULL, 'barcelona', NULL);
INSERT INTO public.moon VALUES (12, 1, 1, 1, NULL, 'el prat', NULL);
INSERT INTO public.moon VALUES (13, 1, 1, 1, NULL, 'madrid', NULL);
INSERT INTO public.moon VALUES (14, 1, 1, 1, NULL, 'onda', NULL);
INSERT INTO public.moon VALUES (15, 1, 1, 1, NULL, 'mercuria', NULL);
INSERT INTO public.moon VALUES (16, 1, 1, 1, NULL, 'venusa', NULL);
INSERT INTO public.moon VALUES (17, 1, 1, 1, NULL, 'tierro', NULL);
INSERT INTO public.moon VALUES (18, 1, 1, 1, NULL, 'martes', NULL);
INSERT INTO public.moon VALUES (19, 1, 1, 1, NULL, 'mostoleset', NULL);
INSERT INTO public.moon VALUES (20, 1, 1, 1, NULL, 'benicasima', NULL);
INSERT INTO public.moon VALUES (21, 1, 1, 1, NULL, 'urana', NULL);
INSERT INTO public.moon VALUES (22, 1, 1, 1, NULL, 'teruela', NULL);
INSERT INTO public.moon VALUES (23, 1, 1, 1, NULL, 'mordora', NULL);
INSERT INTO public.moon VALUES (24, 1, 1, 1, NULL, 'castellona', NULL);
INSERT INTO public.moon VALUES (25, 1, 1, 1, NULL, 'barcelone', NULL);
INSERT INTO public.moon VALUES (26, 1, 1, 1, NULL, 'el prato', NULL);
INSERT INTO public.moon VALUES (27, 1, 1, 1, NULL, 'madride', NULL);
INSERT INTO public.moon VALUES (28, 1, 1, 1, NULL, 'ondo', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 1, 1, NULL, 'mercurio', NULL);
INSERT INTO public.planet VALUES (2, 1, 1, 1, NULL, 'venus', NULL);
INSERT INTO public.planet VALUES (3, 1, 1, 1, NULL, 'tierra', NULL);
INSERT INTO public.planet VALUES (4, 1, 1, 1, NULL, 'marte', NULL);
INSERT INTO public.planet VALUES (5, 1, 1, 1, NULL, 'mostoles', NULL);
INSERT INTO public.planet VALUES (6, 1, 1, 1, NULL, 'benicasim', NULL);
INSERT INTO public.planet VALUES (7, 1, 1, 1, NULL, 'urano', NULL);
INSERT INTO public.planet VALUES (8, 1, 1, 1, NULL, 'teruel', NULL);
INSERT INTO public.planet VALUES (9, 1, 1, 1, NULL, 'mordor', NULL);
INSERT INTO public.planet VALUES (10, 1, 1, 1, NULL, 'castellon', NULL);
INSERT INTO public.planet VALUES (11, 1, 1, 1, NULL, 'barcelona', NULL);
INSERT INTO public.planet VALUES (12, 1, 1, 1, NULL, 'el prat', NULL);
INSERT INTO public.planet VALUES (13, 1, 1, 1, NULL, 'madrid', NULL);
INSERT INTO public.planet VALUES (14, 1, 1, 1, NULL, 'onda', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 550, 10, 1, NULL, 'Antares');
INSERT INTO public.star VALUES (2, 643, 12, 1, NULL, 'Betelgeuse');
INSERT INTO public.star VALUES (3, 7800, 1, 1, NULL, 'KW Sagittarii');
INSERT INTO public.star VALUES (4, 4900, 20, 1, NULL, 'VV Cephei A');
INSERT INTO public.star VALUES (5, 6000, 12, 1, NULL, 'Mu Cephei');
INSERT INTO public.star VALUES (6, 5000, 100, 1, NULL, 'KY Cygni');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 11, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

