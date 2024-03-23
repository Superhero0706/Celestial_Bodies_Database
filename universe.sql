--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(50) NOT NULL,
    galaxy_types character varying(50) NOT NULL,
    description text,
    distance_from_earth_light_years integer
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
    name character varying(50) NOT NULL,
    description text,
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    planet_types character varying(30),
    has_life boolean,
    within_solar_system integer NOT NULL,
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    star_types character varying(30),
    distance_from_earth_light_years numeric(13,8),
    galaxy_id integer NOT NULL
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
-- Name: within_solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.within_solar_system (
    within_solar_system_id integer NOT NULL,
    name character varying(10) NOT NULL,
    meaning character varying(10) NOT NULL
);


ALTER TABLE public.within_solar_system OWNER TO freecodecamp;

--
-- Name: within_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.within_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.within_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: within_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.within_solar_system_id_seq OWNED BY public.within_solar_system.within_solar_system_id;


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
-- Name: within_solar_system within_solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.within_solar_system ALTER COLUMN within_solar_system_id SET DEFAULT nextval('public.within_solar_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral Galaxy', 'Spiral galaxies are surrounded by halos, mixtures of old stars, star clusters, and dark matter – invisible material that does not emit or reflect light but still has a gravitational pull on other matter.', 26670);
INSERT INTO public.galaxy VALUES (2, 'MGC 2865', 'Elliptical Galaxy', 'elliptical galaxies usually contain little gas and dust and show very little organization or structure. The stars orbit around the core in random directions and are generally older than those in spiral galaxies since little of the gas needed to form new stars remains.', 100000000);
INSERT INTO public.galaxy VALUES (3, 'NGC 4886', 'Lenticular Galaxy', 'Lenticular galaxies are a kind of cross between spirals and ellipticals. They have the central bulge and disk common to spiral galaxies but no arms. But like ellipticals, lenticular galaxies have older stellar populations and little ongoing star formation.', 327000000);
INSERT INTO public.galaxy VALUES (4, 'NGC 5264', 'Irregular Galaxy', 'Irregular galaxies have unusual shapes, like toothpicks, rings, or even little groupings of stars. They range from dwarf irregular galaxies with 100 million times the Sun’s mass to large ones weighing 10 billion solar masses.', 90000000);
INSERT INTO public.galaxy VALUES (5, 'NGC 5728', 'Seyfert Galaxy', 'All Seyferts look like normal galaxies in visible light, but they emit considerable infrared radiation. When observed in the infrared, some reveal bright emission from the donut-shaped torus. Some also emit X-rays. Seyfert galaxies tend to have lower radio luminosities, although some produce radio jets.', 130000000);
INSERT INTO public.galaxy VALUES (6, 'Markarian 231', 'Quasars', 'Quasars are the most luminous type of active galaxy. They emit light across the electromagnetic spectrum, produce powerful particle jets, and can radiate thousands of times the energy emitted by a galaxy like the Milky Way.', 600000000);
INSERT INTO public.galaxy VALUES (7, 'Markarian 421', 'Blazars', 'Blazars produce light across the electromagnetic spectrum. Their powerful jets point almost directly at Earth, so they appear brighter than other active galaxies.', 434000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 'Moon of Mars', false, 8);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Moon of Mars', false, 8);
INSERT INTO public.moon VALUES (3, 'Moon', 'Moon of Earth', false, 7);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Moon of Jupyter', false, 1);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Moon of Jupyter', true, 1);
INSERT INTO public.moon VALUES (6, 'Lo', 'Moon of Jupyter', false, 1);
INSERT INTO public.moon VALUES (7, 'Europa', 'Moon of Jupyter', true, 1);
INSERT INTO public.moon VALUES (8, 'Titan', 'Moon of Saturn', false, 2);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Moon of Saturn', false, 2);
INSERT INTO public.moon VALUES (10, 'Hyperion', 'Moon of Saturn', false, 2);
INSERT INTO public.moon VALUES (11, 'Miranda', 'Moon of Uranus', false, 3);
INSERT INTO public.moon VALUES (12, 'Ariel', 'Moon of Uranus', true, 3);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'Moon of Uranus', true, 3);
INSERT INTO public.moon VALUES (14, 'Titania', 'Moon of Uranus', true, 3);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Moon of Uranus', false, 3);
INSERT INTO public.moon VALUES (16, 'Despina', 'Moon of Neptune', false, 4);
INSERT INTO public.moon VALUES (17, 'Galatea', 'Moon of Neptune', false, 4);
INSERT INTO public.moon VALUES (18, 'Halimede', 'Moon of Neptune', false, 4);
INSERT INTO public.moon VALUES (19, 'Hippocamp', 'Moon of Neptune', true, 4);
INSERT INTO public.moon VALUES (20, 'Laomedeia', 'Moon of Neptune', false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupyter', 'Gas Giant', false, 1, 3);
INSERT INTO public.planet VALUES (2, 'Saturn', 'Gas Giant', false, 1, 3);
INSERT INTO public.planet VALUES (3, 'Uranus', 'Neptunian', false, 1, 3);
INSERT INTO public.planet VALUES (4, 'Neptune', 'Neptunian', false, 1, 3);
INSERT INTO public.planet VALUES (5, 'GJ 15A b', 'Super Earth', false, 2, 8);
INSERT INTO public.planet VALUES (6, '55 Cancrie', 'Super Earth', false, 2, 7);
INSERT INTO public.planet VALUES (7, 'Earth', 'Terrestrial', true, 1, 3);
INSERT INTO public.planet VALUES (8, 'Mars', 'Terrestrial', false, 1, 3);
INSERT INTO public.planet VALUES (9, 'Mecury', 'Terrestrial', false, 1, 3);
INSERT INTO public.planet VALUES (10, 'Venus', 'Terrestrial', false, 1, 3);
INSERT INTO public.planet VALUES (11, 'KELT-9 b', 'Gas Giant', false, 2, 9);
INSERT INTO public.planet VALUES (12, 'Kepler-7 b', 'Gas Giant', false, 2, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', 'Red Giants', 5219.00000000, 1);
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 'Red Giants', 3900.00000000, 1);
INSERT INTO public.star VALUES (3, 'Sun', 'Main Sequence Star', 0.00157600, 1);
INSERT INTO public.star VALUES (4, 'RW Cephei', 'Red Giants', 3500.00000000, 1);
INSERT INTO public.star VALUES (5, 'Antares', 'Red Giants', 550.00000000, 1);
INSERT INTO public.star VALUES (6, 'Sirius B', 'Whire Dwarf', 8.61100000, 1);
INSERT INTO public.star VALUES (7, 'Copernicus', 'Main Sequence Star', 41.00000000, 1);
INSERT INTO public.star VALUES (8, 'GJ 15A', 'Main Sequence Star', 12.00000000, 1);
INSERT INTO public.star VALUES (9, 'KELT-9', 'Main Sequence Star', 667.00000000, 1);
INSERT INTO public.star VALUES (10, 'Kepler-7', 'Main Sequence Star', 3009.00000000, 1);


--
-- Data for Name: within_solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.within_solar_system VALUES (1, '1', 'Yes');
INSERT INTO public.within_solar_system VALUES (2, '2', 'No');
INSERT INTO public.within_solar_system VALUES (3, '3', 'Unknown');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: within_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.within_solar_system_id_seq', 3, true);


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
-- Name: within_solar_system within_solar_system_meaning_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.within_solar_system
    ADD CONSTRAINT within_solar_system_meaning_key UNIQUE (meaning);


--
-- Name: within_solar_system within_solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.within_solar_system
    ADD CONSTRAINT within_solar_system_pkey PRIMARY KEY (within_solar_system_id);


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

