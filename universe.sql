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
-- Name: celestial_properties; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_properties (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(60),
    mass numeric,
    diameter numeric,
    distance_fs numeric,
    tilt numeric,
    orbital_period integer,
    rotation_period integer,
    density text,
    volume numeric,
    gravity numeric,
    celestial_properties_id integer NOT NULL
);


ALTER TABLE public.celestial_properties OWNER TO freecodecamp;

--
-- Name: celestial_properties_celestial_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_properties_celestial_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_properties_celestial_properties_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_properties_celestial_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_properties_celestial_properties_id_seq OWNED BY public.celestial_properties.celestial_properties_id;


--
-- Name: celestial_properties_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_properties_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_properties_planet_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_properties_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_properties_planet_id_seq OWNED BY public.celestial_properties.planet_id;


--
-- Name: celestial_properties_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_properties_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_properties_star_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_properties_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_properties_star_id_seq OWNED BY public.celestial_properties.star_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    shape text NOT NULL,
    is_active boolean,
    distance_fs integer,
    is_blue_s boolean,
    is_red_s boolean,
    diameter numeric(18,4)
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
    planet_id integer,
    star_id integer,
    name character varying(60) NOT NULL,
    mass numeric,
    diameter numeric,
    period numeric
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
    star_id integer,
    name character varying(60) NOT NULL,
    is_rocky boolean,
    is_gas boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 2
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
    name character varying(60),
    type text NOT NULL,
    mass numeric,
    diameter numeric,
    distance_fs integer,
    lumosity numeric,
    is_main boolean,
    has_planet boolean,
    age numeric,
    metallicity text,
    rotation numeric,
    temperature numeric,
    is_binary boolean,
    number_of_planets integer,
    galaxy_id integer NOT NULL
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
-- Name: celestial_properties planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_properties ALTER COLUMN planet_id SET DEFAULT nextval('public.celestial_properties_planet_id_seq'::regclass);


--
-- Name: celestial_properties star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_properties ALTER COLUMN star_id SET DEFAULT nextval('public.celestial_properties_star_id_seq'::regclass);


--
-- Name: celestial_properties celestial_properties_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_properties ALTER COLUMN celestial_properties_id SET DEFAULT nextval('public.celestial_properties_celestial_properties_id_seq'::regclass);


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
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: celestial_properties; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_properties VALUES (3, 1, 'Jupiter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.celestial_properties VALUES (19, 1, 'Saturn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.celestial_properties VALUES (20, 1, 'Uranus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.celestial_properties VALUES (21, 1, 'Neptune', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.celestial_properties VALUES (6, 3, 'Gliese_581_b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.celestial_properties VALUES (7, 3, 'Gliese_581_c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.celestial_properties VALUES (8, 3, 'Gliese_581_e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.celestial_properties VALUES (9, 4, 'Gliese_1061_b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO public.celestial_properties VALUES (10, 4, 'Gliese_1061_c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO public.celestial_properties VALUES (11, 4, 'Gliese_1061_d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14);
INSERT INTO public.celestial_properties VALUES (12, 5, '82 G Eridani_b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.celestial_properties VALUES (13, 5, '82 G Eridani_d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16);
INSERT INTO public.celestial_properties VALUES (14, 5, '82 G Eridani_e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17);
INSERT INTO public.celestial_properties VALUES (15, 6, 'Tau Ceti e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18);
INSERT INTO public.celestial_properties VALUES (16, 6, 'Tau Ceti f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO public.celestial_properties VALUES (17, 6, 'Tau Ceti g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20);
INSERT INTO public.celestial_properties VALUES (18, 6, 'Tau Ceti h', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO public.celestial_properties VALUES (1, 1, 'Earth', 5972200000000000000000000, 12714, 0.0000158125, 23, 365, 24, '5.504', 1083210000000, 9.81, 1);
INSERT INTO public.celestial_properties VALUES (2, 1, 'Mars', 641710000000000000000000, 6779, 0.0000262488, 25, 686, 24, '3.395', 163118000000, 3.720, 2);
INSERT INTO public.celestial_properties VALUES (5, 2, 'Proxima Centuri d', 6390254000000000000000000, 16528.2, 4.2465, NULL, 5, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.celestial_properties VALUES (4, 2, 'Proxima Centuri b', 1552772000000000000000000, 10298.4, 4.2465, NULL, 11, NULL, NULL, NULL, NULL, 8);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 'Spiral', false, 26500, false, false, 105700.0000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Spiral', false, 2500000, true, false, 152000.0000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral', false, 3200000, true, false, 61000.0000);
INSERT INTO public.galaxy VALUES (4, 'Messier 82', 'Spiral', false, 12000000, false, true, 48000.0000);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'Spiral', true, 11800000, true, false, 96000.0000);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Spiral', true, 12390000, false, true, 60000.0000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 2, 1, 'Phobos', 10800000000000000, 22.2, 0.4632);
INSERT INTO public.moon VALUES (2, 2, 1, 'Deimos', 1500000000000000, 12.6, 5.44);
INSERT INTO public.moon VALUES (7, 19, 1, 'Encladus', 37493000000000000000, 396.4, 0.94242);
INSERT INTO public.moon VALUES (8, 19, 1, 'Tethys', 108022000000000000000, 504.2, 1.370);
INSERT INTO public.moon VALUES (9, 19, 1, 'Dione', 617440000000000000000, 1062.2, 1.887);
INSERT INTO public.moon VALUES (10, 19, 1, 'Rhea', 1095452000000000000000, 1122.8, 2.736);
INSERT INTO public.moon VALUES (11, 19, 1, 'Titan', 2304518000000000000000, 1527.6, 4.518);
INSERT INTO public.moon VALUES (12, 20, 1, 'Ariel', 134520000000000000000000, 5149.46, 15.9457);
INSERT INTO public.moon VALUES (13, 20, 1, 'Umbriel', 1251000000000000000000, 1157.8, 2.520);
INSERT INTO public.moon VALUES (14, 20, 1, 'Titania', 1275000000000000000000, 1169.4, 4.144);
INSERT INTO public.moon VALUES (15, 20, 1, 'Oberon', 3400000000000000000000, 1576, 8.705);
INSERT INTO public.moon VALUES (16, 21, 1, 'Triton', 3076000000000000000000, 1522.8, 13.4632);
INSERT INTO public.moon VALUES (17, 21, 1, 'Nereid', 21390000000000000000000, 2705.2, 5.8769);
INSERT INTO public.moon VALUES (18, 21, 1, 'Naiad', 24000000000000000000, 357, 360.14);
INSERT INTO public.moon VALUES (19, 21, 1, 'Thalassa', 130000000000000000, 60.4, 0.2944);
INSERT INTO public.moon VALUES (20, 21, 1, 'Despina', 350000000000000000, 81.4, 0.3115);
INSERT INTO public.moon VALUES (21, 21, 1, 'Galatea', 1560000000000000000, 156, 0.3346);
INSERT INTO public.moon VALUES (3, 3, 1, 'IO', 89319000000000000000000, 3643, 1.7627);
INSERT INTO public.moon VALUES (4, 3, 1, 'Europa', 47998000000000000000000, 3121.6, 3.5255);
INSERT INTO public.moon VALUES (5, 3, 1, 'Ganymede', 148190000000000000000000, 5268.2, 7.1554);
INSERT INTO public.moon VALUES (6, 3, 1, 'Callisto', 107590000000000000000000, 4820, 16.690);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', true, false);
INSERT INTO public.planet VALUES (2, 1, 'Mars', true, false);
INSERT INTO public.planet VALUES (3, 1, 'Jupiter', false, true);
INSERT INTO public.planet VALUES (19, 1, 'Saturn', false, true);
INSERT INTO public.planet VALUES (20, 1, 'Uranus', false, true);
INSERT INTO public.planet VALUES (21, 1, 'Neptune', false, true);
INSERT INTO public.planet VALUES (5, 2, 'Proxima Centuri d', true, false);
INSERT INTO public.planet VALUES (4, 2, 'Proxima Centuri b', true, false);
INSERT INTO public.planet VALUES (6, 3, 'Gliese_581_b', false, true);
INSERT INTO public.planet VALUES (7, 3, 'Gliese_581_c', true, false);
INSERT INTO public.planet VALUES (8, 3, 'Gliese_581_e', true, false);
INSERT INTO public.planet VALUES (9, 4, 'Gliese_1061_b', true, false);
INSERT INTO public.planet VALUES (10, 4, 'Gliese_1061_c', true, false);
INSERT INTO public.planet VALUES (11, 4, 'Gliese_1061_d', true, false);
INSERT INTO public.planet VALUES (12, 5, '82 G Eridani_b', true, false);
INSERT INTO public.planet VALUES (13, 5, '82 G Eridani_d', true, false);
INSERT INTO public.planet VALUES (14, 5, '82 G Eridani_e', true, false);
INSERT INTO public.planet VALUES (15, 6, 'Tau Ceti e', true, false);
INSERT INTO public.planet VALUES (16, 6, 'Tau Ceti f', true, false);
INSERT INTO public.planet VALUES (17, 6, 'Tau Ceti g', true, false);
INSERT INTO public.planet VALUES (18, 6, 'Tau Ceti h', true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red Dwarf', 242000000000000000000000000000, 214553, 4, 599800000000000000000000, true, true, 4900000000, '0.21', 82.6, 2727, true, 2, 1);
INSERT INTO public.star VALUES (3, 'Gliese 581', 'Red Dwarf', 610316000000000000000000000000, 431334, 20, 734000000000000000000000, true, true, 8000000000, '-0.33', 132.6, 3151, true, 2, 1);
INSERT INTO public.star VALUES (4, 'Gliese 1061', 'Red Dwarf', 248500000000000000000000000000, 211492, 12, 627792000000000000000000, true, true, 7000000000, '-0.03', 1.538, 2704, false, 3, 1);
INSERT INTO public.star VALUES (1, 'Sol', 'Yellow Dwarf', 1988500000000000000000000000000, 1391400, 0, 38280000000000000000000000000, true, true, 4600000000, 'Population III/0.012', 24.47, 5499, false, 8, 1);
INSERT INTO public.star VALUES (5, '82 G Eridani', 'Yellow Dwarf', 1391600000000000000000000000000, 1280088, 20, 283272000000000000000000000, true, true, 6100000000, '-0.40', 6.282, 5128, false, 3, 1);
INSERT INTO public.star VALUES (6, 'Tau Ceti', 'Yellow Dwarf', 1556604000000000000000000000000, 1103380, 12, 1868044000000000000000000, true, true, 5800000000, '-0.55', 34, 5071, false, 4, 1);


--
-- Name: celestial_properties_celestial_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_properties_celestial_properties_id_seq', 25, true);


--
-- Name: celestial_properties_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_properties_planet_id_seq', 1, true);


--
-- Name: celestial_properties_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_properties_star_id_seq', 1, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 3, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: celestial_properties celestial_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_properties
    ADD CONSTRAINT celestial_name_unique UNIQUE (name);


--
-- Name: celestial_properties celestial_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_properties
    ADD CONSTRAINT celestial_properties_pkey PRIMARY KEY (celestial_properties_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: celestial_properties fk_celestial_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_properties
    ADD CONSTRAINT fk_celestial_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: celestial_properties fk_planet_celestial; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_properties
    ADD CONSTRAINT fk_planet_celestial FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fk_planet_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

