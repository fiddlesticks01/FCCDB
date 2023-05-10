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
    stars_with_planets integer NOT NULL,
    galaxy_id integer,
    star_id integer
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
    name character varying NOT NULL,
    size numeric,
    type text NOT NULL,
    distance numeric,
    constellation_id integer
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
    name character varying NOT NULL,
    mean_radius numeric,
    discovered_by text,
    discovered_year integer,
    planet_id integer
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
    name character varying NOT NULL,
    rotation_period numeric NOT NULL,
    orbital_period numeric NOT NULL,
    has_rings boolean NOT NULL,
    has_moons boolean NOT NULL,
    star_id integer
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
    name character varying NOT NULL,
    constellation_id integer,
    mass numeric NOT NULL,
    luminosity numeric NOT NULL,
    galaxy_id integer
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

INSERT INTO public.constellation VALUES (181, 'Sagittarius', 32, 250, 208);
INSERT INTO public.constellation VALUES (182, 'Andromeda', 12, 247, 209);
INSERT INTO public.constellation VALUES (183, 'Ursa Major', 21, 248, 210);
INSERT INTO public.constellation VALUES (184, 'Dorado', 5, 252, 211);
INSERT INTO public.constellation VALUES (185, 'Triangulum', 3, 251, 212);
INSERT INTO public.constellation VALUES (186, 'Sculptor', 6, 249, 213);
INSERT INTO public.constellation VALUES (187, 'Pisces', 13, 253, 214);
INSERT INTO public.constellation VALUES (188, 'Aries', 6, 254, 215);
INSERT INTO public.constellation VALUES (189, 'Centaurus', 15, 250, 216);
INSERT INTO public.constellation VALUES (190, 'Taurus', 9, 255, 217);
INSERT INTO public.constellation VALUES (191, 'Coma Berenices', 5, 256, 218);
INSERT INTO public.constellation VALUES (192, 'Capricornus', 5, 257, 219);
INSERT INTO public.constellation VALUES (193, 'Bootes', 10, 258, 220);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (247, 'Andromeda', 46.56, 'Barred Spiral', 765, 182);
INSERT INTO public.galaxy VALUES (248, 'Messier 82', 12.52, 'Starburst', 3800, 183);
INSERT INTO public.galaxy VALUES (249, 'NGC 623', 246.49, 'Elliptical', 121430, 186);
INSERT INTO public.galaxy VALUES (250, 'Milky Way', 26.80, 'Barred Spiral', 8.277, 181);
INSERT INTO public.galaxy VALUES (251, 'Triangulum', 18.74, 'Spiral', 970, 185);
INSERT INTO public.galaxy VALUES (252, 'Nubecula Major', 9.86, 'Magellanic Spiral', 49.97, 184);
INSERT INTO public.galaxy VALUES (253, 'Messier 74', 29.13, 'Large Spiral', 9198.042, 187);
INSERT INTO public.galaxy VALUES (254, 'NGC 772', 61.32, 'Unbarred Spiral', 39858, 188);
INSERT INTO public.galaxy VALUES (255, 'NGC 1589', 49.06, 'Spiral', 51509, 190);
INSERT INTO public.galaxy VALUES (256, 'Coma Berenices', 0, 'Dwarf Spheroidal', 44, 191);
INSERT INTO public.galaxy VALUES (257, 'Messier 30', 0.03, 'Globular Cluster', 8.3, 192);
INSERT INTO public.galaxy VALUES (258, 'NGC 5466', 0, 'Globular Cluster', 15.9, 193);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (186, 'Moon', 1738, '', NULL, 111);
INSERT INTO public.moon VALUES (187, 'Phobos', 11.267, 'Asaph Hall', 1877, 112);
INSERT INTO public.moon VALUES (188, 'Deimos', 6.2, 'Asaph Hall', 1877, 112);
INSERT INTO public.moon VALUES (189, 'Io', 1821.6, 'Galileo', 1610, 113);
INSERT INTO public.moon VALUES (190, 'Europa', 1560.8, 'Galileo', 1610, 113);
INSERT INTO public.moon VALUES (191, 'Ganymede', 2634, 'Galileo', 1610, 113);
INSERT INTO public.moon VALUES (192, 'Callisto', 2410, 'Galileo', 1610, 113);
INSERT INTO public.moon VALUES (193, 'Amalthea', 83.5, 'E.E.Barnard', 1892, 113);
INSERT INTO public.moon VALUES (194, 'Himalia', 69.8, 'Charles Perrine', 1904, 113);
INSERT INTO public.moon VALUES (195, 'Elara', 43, 'Charles Perrine', 1905, 113);
INSERT INTO public.moon VALUES (196, 'Pasiphae', 30, 'Philibert Melotte', 1908, 113);
INSERT INTO public.moon VALUES (197, 'Sinope', 19, 'Seth Nicholson', 1914, 113);
INSERT INTO public.moon VALUES (198, 'Lysithea', 18, 'Seth Nicholson', 1938, 113);
INSERT INTO public.moon VALUES (199, 'Carme', 23, 'Seth Nicholson', 1938, 113);
INSERT INTO public.moon VALUES (200, 'Ananke', 14, 'Seth Nicholson', 1951, 113);
INSERT INTO public.moon VALUES (201, 'Leda', 10, 'Charles Kowal', 1974, 113);
INSERT INTO public.moon VALUES (202, 'Mimas', 198.2, 'Frederick Herschel', 1789, 114);
INSERT INTO public.moon VALUES (203, 'Enceladus', 252.1, 'Frederick Herschel', 1789, 114);
INSERT INTO public.moon VALUES (204, 'Ariel', 578.9, 'William Lassell', 1851, 115);
INSERT INTO public.moon VALUES (205, 'Umbriel', 584.7, 'William Lassell', 1851, 115);
INSERT INTO public.moon VALUES (206, 'Titania', 788.9, 'Frederick Herschel', 1787, 115);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (109, 'Mercury', 58.646, 0.241, false, false, 214);
INSERT INTO public.planet VALUES (110, 'Venus', 243.019, 0.615, false, false, 215);
INSERT INTO public.planet VALUES (111, 'Earth', 0.997, 1, false, true, 216);
INSERT INTO public.planet VALUES (112, 'Mars', 1.026, 1.881, false, true, 217);
INSERT INTO public.planet VALUES (113, 'Jupiter', 0.414, 11.863, true, true, 214);
INSERT INTO public.planet VALUES (114, 'Saturn', 0.444, 29.447, true, true, 216);
INSERT INTO public.planet VALUES (115, 'Uranus', 0.718, 84.017, true, true, 215);
INSERT INTO public.planet VALUES (116, 'Neptune', 0.671, 164.791, true, true, 214);
INSERT INTO public.planet VALUES (117, 'Ceres', 0.378, 4.599, false, false, 218);
INSERT INTO public.planet VALUES (118, 'Pluto', 6.387, 247.9, false, true, 219);
INSERT INTO public.planet VALUES (119, 'Haumea', 0.163, 283.8, true, true, 220);
INSERT INTO public.planet VALUES (120, 'Makemake', 0.951, 306.2, false, true, 218);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (208, 'Epsilon Sagittarii', 181, 3.515, 363, 250);
INSERT INTO public.star VALUES (209, 'Alpheratz', 182, 3.8, 240, 247);
INSERT INTO public.star VALUES (210, 'Alioth', 183, 2.91, 102, 248);
INSERT INTO public.star VALUES (211, 'Alpha Doradus', 184, 3.33, 195, 252);
INSERT INTO public.star VALUES (212, 'Beta Trianguli', 185, 3.5, 74, 251);
INSERT INTO public.star VALUES (213, 'Alpha Sculptoris', 186, 5.01, 1549, 249);
INSERT INTO public.star VALUES (214, 'Eta Piscium', 187, 3.78, 457, 253);
INSERT INTO public.star VALUES (215, 'Hamal', 188, 1.5, 91, 254);
INSERT INTO public.star VALUES (216, 'Alpha Centauri', 189, 1.0788, 1.5059, 250);
INSERT INTO public.star VALUES (217, 'Aldebaran', 190, 1.16, 439, 255);
INSERT INTO public.star VALUES (218, 'Beta Comae Berenices', 191, 1.15, 1.357, 256);
INSERT INTO public.star VALUES (219, 'Delta Capricorni', 192, 2, 8.5, 257);
INSERT INTO public.star VALUES (220, 'Arcturus', 193, 1.08, 170, 258);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 193, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 258, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 206, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 120, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 220, true);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

