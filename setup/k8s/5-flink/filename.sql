--
-- PostgreSQL database dump
--

\restrict yjI5Dw2O6OccY5o73sfFgZdfxbOYcaTqx7dCjQccNIyDHjG1vxCnNkRQRzbnlR2

-- Dumped from database version 16.13
-- Dumped by pg_dump version 16.13

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
-- Name: analytics; Type: SCHEMA; Schema: -; Owner: kakarott
--

CREATE SCHEMA analytics;


ALTER SCHEMA analytics OWNER TO kakarott;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: traffic_metric_route_event; Type: TABLE; Schema: analytics; Owner: kakarott
--

CREATE TABLE analytics.traffic_metric_route_event (
    id integer NOT NULL,
    metric_name character varying(255),
    city character varying(255),
    transport character varying(255),
    route_id character varying,
    route_short_name character varying,
    route_long_name character varying,
    route_desc text,
    window_start bigint,
    window_end bigint,
    metric_value double precision,
    event_count integer,
    _updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE analytics.traffic_metric_route_event OWNER TO kakarott;

--
-- Name: traffic_metric_route_event_id_seq; Type: SEQUENCE; Schema: analytics; Owner: kakarott
--

CREATE SEQUENCE analytics.traffic_metric_route_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE analytics.traffic_metric_route_event_id_seq OWNER TO kakarott;

--
-- Name: traffic_metric_route_event_id_seq; Type: SEQUENCE OWNED BY; Schema: analytics; Owner: kakarott
--

ALTER SEQUENCE analytics.traffic_metric_route_event_id_seq OWNED BY analytics.traffic_metric_route_event.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: kakarott
--

CREATE TABLE public.routes (
    id integer NOT NULL,
    route_id character varying NOT NULL,
    agency_id character varying,
    route_short_name character varying,
    route_long_name character varying,
    route_desc text,
    route_type integer,
    route_url character varying,
    route_color character varying(6),
    route_text_color character varying(6),
    route_sort_order integer,
    _source_city character varying NOT NULL,
    _source_transport character varying NOT NULL,
    _updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE ONLY public.routes REPLICA IDENTITY FULL;


ALTER TABLE public.routes OWNER TO kakarott;

--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: kakarott
--

CREATE SEQUENCE public.routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.routes_id_seq OWNER TO kakarott;

--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kakarott
--

ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;


--
-- Name: traffic_metric_route_event id; Type: DEFAULT; Schema: analytics; Owner: kakarott
--

ALTER TABLE ONLY analytics.traffic_metric_route_event ALTER COLUMN id SET DEFAULT nextval('analytics.traffic_metric_route_event_id_seq'::regclass);


--
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: kakarott
--

ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);


--
-- Data for Name: traffic_metric_route_event; Type: TABLE DATA; Schema: analytics; Owner: kakarott
--

COPY analytics.traffic_metric_route_event (id, metric_name, city, transport, route_id, route_short_name, route_long_name, route_desc, window_start, window_end, metric_value, event_count, _updated_at) FROM stdin;
1	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	0	2	2026-03-10 20:17:33.206446
2	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173520000	1773173640000	21.111099243164062	2	2026-03-10 20:17:33.206446
3	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173520000	1773173640000	0.833299994468689	1	2026-03-10 20:17:33.206446
4	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173520000	1773173640000	10.277799606323242	6	2026-03-10 20:17:33.206446
5	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173520000	1773173640000	8.0556001663208	8	2026-03-10 20:17:33.206446
6	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173520000	1773173640000	8.33329963684082	2	2026-03-10 20:17:33.206446
7	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173520000	1773173640000	6.6666998863220215	3	2026-03-10 20:17:33.206446
8	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173520000	1773173640000	13.888899803161621	2	2026-03-10 20:17:33.206446
9	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	0	2	2026-03-10 20:17:33.206446
10	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173520000	1773173640000	14.861099243164062	2	2026-03-10 20:17:33.206446
11	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173520000	1773173640000	0.833299994468689	1	2026-03-10 20:17:33.994811
12	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173520000	1773173640000	4.583333492279053	6	2026-03-10 20:17:33.994811
13	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173520000	1773173640000	12.777799606323242	2	2026-03-10 20:17:33.994811
14	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173520000	1773173640000	8.0556001663208	1	2026-03-10 20:17:33.994811
15	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:17:33.994811
16	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173520000	1773173640000	10.5556001663208	6	2026-03-10 20:17:33.994811
17	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173520000	1773173640000	8.611100196838379	2	2026-03-10 20:17:33.994811
18	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173520000	1773173640000	11.111100196838379	2	2026-03-10 20:17:33.994811
19	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173520000	1773173640000	1.9443999528884888	2	2026-03-10 20:17:33.994811
20	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173520000	1773173640000	10.83329963684082	2	2026-03-10 20:17:33.994811
21	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:17:33.994811
22	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173520000	1773173640000	17.777799606323242	1	2026-03-10 20:17:33.994811
23	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173520000	1773173640000	11.66670036315918	5	2026-03-10 20:17:33.994811
24	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173520000	1773173640000	8.611100196838379	4	2026-03-10 20:17:33.994811
25	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173520000	1773173640000	8.888899803161621	4	2026-03-10 20:17:33.994811
26	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173520000	1773173640000	11.111100196838379	5	2026-03-10 20:17:33.994811
27	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173520000	1773173640000	7.2221999168396	2	2026-03-10 20:17:33.994811
28	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173520000	1773173640000	18.888900756835938	3	2026-03-10 20:17:33.994811
29	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173520000	1773173640000	8.888899803161621	1	2026-03-10 20:17:33.994811
30	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173520000	1773173640000	25.277799606323242	1	2026-03-10 20:17:33.994811
31	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:17:33.994811
32	max.vehicles.speed	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173520000	1773173640000	3.0555999279022217	1	2026-03-10 20:17:33.994811
33	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:17:33.994811
34	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:17:33.994811
35	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173520000	1773173640000	1	1	2026-03-10 20:17:33.994811
36	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173520000	1773173640000	6	6	2026-03-10 20:17:33.994811
37	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173520000	1773173640000	8	8	2026-03-10 20:17:33.994811
38	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173520000	1773173640000	2	2	2026-03-10 20:17:33.994811
39	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173520000	1773173640000	3	3	2026-03-10 20:17:33.994811
40	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173520000	1773173640000	2	2	2026-03-10 20:17:33.994811
163	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173580000	1773173700000	5.277789115905762	9	2026-03-10 20:17:34.217087
41	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:17:33.994811
42	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:17:33.994811
43	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:17:33.994811
44	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173520000	1773173640000	6	6	2026-03-10 20:17:33.994811
45	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:17:33.994811
46	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173520000	1773173640000	2	2	2026-03-10 20:17:33.994811
47	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173520000	1773173640000	2	2	2026-03-10 20:17:33.994811
48	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:17:33.994811
49	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:17:33.994811
50	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:17:33.994811
51	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173520000	1773173640000	5	5	2026-03-10 20:17:33.994811
52	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173520000	1773173640000	4	4	2026-03-10 20:17:33.994811
53	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173520000	1773173640000	4	4	2026-03-10 20:17:33.994811
54	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173520000	1773173640000	5	5	2026-03-10 20:17:33.994811
55	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:17:33.994811
56	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173520000	1773173640000	3	3	2026-03-10 20:17:33.994811
57	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:17:33.994811
58	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:17:33.994811
59	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:17:33.994811
60	count.vehicle.active	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:17:33.994811
61	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:17:33.994811
62	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:17:33.994811
63	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:17:33.994811
64	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	1	1	2026-03-10 20:17:33.994811
65	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173580000	1773173700000	2	4	2026-03-10 20:17:33.994811
66	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173580000	1773173700000	1	2	2026-03-10 20:17:33.994811
67	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	2	2	2026-03-10 20:17:33.994811
68	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:17:33.994811
69	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173580000	1773173700000	3	5	2026-03-10 20:17:33.994811
70	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173580000	1773173700000	8	13	2026-03-10 20:17:33.994811
71	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173580000	1773173700000	6	12	2026-03-10 20:17:33.994811
72	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173580000	1773173700000	2	4	2026-03-10 20:17:33.994811
73	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:17:33.994811
74	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173580000	1773173700000	2	4	2026-03-10 20:17:33.994811
75	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173580000	1773173700000	6	12	2026-03-10 20:17:33.994811
76	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:17:33.994811
77	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:17:33.994811
78	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173520000	1773173640000	2.5347249507904053	8	2026-03-10 20:17:33.994811
79	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173520000	1773173640000	4.305549621582031	2	2026-03-10 20:17:33.994811
80	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173520000	1773173640000	3.9814999103546143	3	2026-03-10 20:17:33.994811
81	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173520000	1773173640000	9.444449424743652	2	2026-03-10 20:17:33.994811
82	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173520000	1773173640000	10.694449424743652	2	2026-03-10 20:17:33.994811
83	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173520000	1773173640000	8.0556001663208	1	2026-03-10 20:17:33.994811
84	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:17:33.994811
85	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173520000	1773173640000	4.444433212280273	6	2026-03-10 20:17:33.994811
86	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173520000	1773173640000	5.138900279998779	2	2026-03-10 20:17:33.994811
87	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173520000	1773173640000	7.777750015258789	2	2026-03-10 20:17:33.994811
88	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173520000	1773173640000	1.527750015258789	2	2026-03-10 20:17:33.994811
89	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173520000	1773173640000	8.888850212097168	2	2026-03-10 20:17:33.994811
90	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:17:33.994811
91	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173520000	1773173640000	17.777799606323242	1	2026-03-10 20:17:33.994811
92	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173520000	1773173640000	4.555580139160156	5	2026-03-10 20:17:33.994811
93	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173520000	1773173640000	6.1805500984191895	4	2026-03-10 20:17:33.994811
94	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173520000	1773173640000	6.250024795532227	4	2026-03-10 20:17:33.994811
95	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173520000	1773173640000	3.277780055999756	5	2026-03-10 20:17:33.994811
96	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173520000	1773173640000	3.6110999584198	2	2026-03-10 20:17:33.994811
97	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173520000	1773173640000	7.870400428771973	3	2026-03-10 20:17:33.994811
98	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173520000	1773173640000	8.888899803161621	1	2026-03-10 20:17:33.994811
99	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173520000	1773173640000	25.277799606323242	1	2026-03-10 20:17:33.994811
100	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:17:33.994811
101	average.vehicle.speed	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173520000	1773173640000	3.0555999279022217	1	2026-03-10 20:17:33.994811
102	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:17:33.994811
103	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173520000	1773173640000	6.527799606323242	2	2026-03-10 20:17:33.994811
104	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173580000	1773173700000	6.666675090789795	4	2026-03-10 20:17:33.994811
105	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	0	1	2026-03-10 20:17:33.994811
106	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173580000	1773173700000	10.208324432373047	4	2026-03-10 20:17:33.994811
107	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:17:33.994811
108	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173520000	1773173640000	8.888899803161621	2	2026-03-10 20:17:33.994811
109	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173580000	1773173700000	8.888899803161621	4	2026-03-10 20:17:33.994811
110	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	0	1	2026-03-10 20:17:33.994811
111	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173580000	1773173700000	13.888899803161621	4	2026-03-10 20:17:34.217087
112	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173580000	1773173700000	1.3889000415802002	2	2026-03-10 20:17:34.217087
113	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:17:34.217087
114	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173580000	1773173700000	21.111099243164062	4	2026-03-10 20:17:34.217087
115	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173580000	1773173700000	6.6666998863220215	5	2026-03-10 20:17:34.217087
116	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173580000	1773173700000	9.16670036315918	13	2026-03-10 20:17:34.217087
117	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173580000	1773173700000	10.5556001663208	12	2026-03-10 20:17:34.217087
118	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:17:34.217087
119	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:17:34.217087
120	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173580000	1773173700000	2	4	2026-03-10 20:17:34.217087
121	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173580000	1773173700000	1	1	2026-03-10 20:17:34.217087
122	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173580000	1773173700000	3	6	2026-03-10 20:17:34.217087
123	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173580000	1773173700000	1.1111000776290894	2	2026-03-10 20:17:34.217087
124	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173580000	1773173700000	8.33329963684082	4	2026-03-10 20:17:34.217087
125	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173580000	1773173700000	10.83329963684082	4	2026-03-10 20:17:34.217087
126	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173580000	1773173700000	5	8	2026-03-10 20:17:34.217087
127	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:17:34.217087
128	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173580000	1773173700000	16.388874053955078	4	2026-03-10 20:17:34.217087
129	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173580000	1773173700000	4.166659832000732	5	2026-03-10 20:17:34.217087
130	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173580000	1773173700000	3.71795392036438	13	2026-03-10 20:17:34.217087
131	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173580000	1773173700000	4.976858139038086	12	2026-03-10 20:17:34.217087
132	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173580000	1773173700000	5.347224712371826	4	2026-03-10 20:17:34.217087
133	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173580000	1773173700000	7.2221999168396	4	2026-03-10 20:17:34.217087
134	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173580000	1773173700000	8.541675567626953	4	2026-03-10 20:17:34.217087
135	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173580000	1773173700000	4.3055500984191895	12	2026-03-10 20:17:34.217087
136	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173580000	1773173700000	4.236100196838379	4	2026-03-10 20:17:34.217087
137	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173580000	1773173700000	8.888875007629395	4	2026-03-10 20:17:34.217087
138	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173580000	1773173700000	11.111100196838379	4	2026-03-10 20:17:34.217087
139	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173580000	1773173700000	10.5556001663208	12	2026-03-10 20:17:34.217087
140	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173580000	1773173700000	8.611100196838379	4	2026-03-10 20:17:34.217087
141	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173580000	1773173700000	12.777799606323242	4	2026-03-10 20:17:34.217087
142	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173580000	1773173700000	8.0556001663208	2	2026-03-10 20:17:34.217087
143	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:17:34.217087
144	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173580000	1773173700000	4.1666998863220215	4	2026-03-10 20:17:34.217087
145	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173580000	1773173700000	0	1	2026-03-10 20:17:34.217087
146	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173580000	1773173700000	18.888900756835938	6	2026-03-10 20:17:34.217087
147	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173580000	1773173700000	4	8	2026-03-10 20:17:34.217087
148	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173580000	1773173700000	5	9	2026-03-10 20:17:34.217087
149	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:17:34.217087
150	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173580000	1773173700000	4	8	2026-03-10 20:17:34.217087
151	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:17:34.217087
152	count.vehicle.active	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173580000	1773173700000	1	1	2026-03-10 20:17:34.217087
153	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:17:34.217087
154	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:17:34.217087
155	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:17:34.217087
156	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173580000	1773173700000	7.361149787902832	2	2026-03-10 20:17:34.217087
157	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:17:34.217087
158	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173580000	1773173700000	2.5	4	2026-03-10 20:17:34.217087
159	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173580000	1773173700000	0	1	2026-03-10 20:17:34.217087
160	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173580000	1773173700000	7.916683673858643	6	2026-03-10 20:17:34.217087
161	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173580000	1773173700000	3.784712553024292	8	2026-03-10 20:17:34.217087
162	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173580000	1773173700000	4.791662693023682	8	2026-03-10 20:17:34.217087
164	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173580000	1773173700000	11.666699409484863	2	2026-03-10 20:17:34.217087
165	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173580000	1773173700000	6.354175090789795	8	2026-03-10 20:17:34.217087
166	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173580000	1773173700000	5.486100196838379	4	2026-03-10 20:17:34.217087
167	average.vehicle.speed	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173580000	1773173700000	3.0555999279022217	1	2026-03-10 20:17:34.217087
168	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:17:34.217087
169	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173580000	1773173700000	24.861101150512695	2	2026-03-10 20:17:34.217087
170	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173580000	1773173700000	9.444449424743652	2	2026-03-10 20:17:34.217087
171	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173580000	1773173700000	11.111100196838379	8	2026-03-10 20:17:34.217087
172	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173580000	1773173700000	8.611100196838379	8	2026-03-10 20:17:34.217087
173	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173580000	1773173700000	12.5	9	2026-03-10 20:17:34.217087
174	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173580000	1773173700000	17.777799606323242	2	2026-03-10 20:17:34.217087
175	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173580000	1773173700000	9.16670036315918	8	2026-03-10 20:17:34.217087
176	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173580000	1773173700000	14.722200393676758	4	2026-03-10 20:17:34.217087
177	max.vehicles.speed	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173580000	1773173700000	3.0555999279022217	1	2026-03-10 20:17:34.217087
178	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:17:34.217087
179	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173580000	1773173700000	25.277799606323242	2	2026-03-10 20:17:34.217087
180	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173580000	1773173700000	10	2	2026-03-10 20:17:34.217087
181	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173640000	1773173760000	1	3	2026-03-10 20:20:45.191737
182	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173640000	1773173760000	11.111100196838379	3	2026-03-10 20:20:45.191737
183	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173640000	1773173760000	6.388899803161621	3	2026-03-10 20:20:45.191737
184	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173640000	1773173760000	1.75926673412323	3	2026-03-10 20:20:45.191737
185	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173640000	1773173760000	12.222200393676758	3	2026-03-10 20:20:45.191737
186	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173640000	1773173760000	1	3	2026-03-10 20:20:45.191737
187	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173640000	1773173760000	1	3	2026-03-10 20:20:45.191737
188	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173640000	1773173760000	5	14	2026-03-10 20:20:45.191737
189	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173640000	1773173760000	11.9443998336792	3	2026-03-10 20:20:45.191737
190	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173640000	1773173760000	5.2778000831604	3	2026-03-10 20:20:45.191737
191	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173640000	1773173760000	9.16670036315918	14	2026-03-10 20:20:45.191737
192	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173640000	1773173760000	0	1	2026-03-10 20:20:45.191737
193	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173640000	1773173760000	12.777799606323242	6	2026-03-10 20:20:45.191737
194	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173640000	1773173760000	6.6666998863220215	6	2026-03-10 20:20:45.191737
195	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173640000	1773173760000	4.1666998863220215	3	2026-03-10 20:20:45.191737
196	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173640000	1773173760000	13.33329963684082	6	2026-03-10 20:20:45.191737
197	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173640000	1773173760000	19.722200393676758	5	2026-03-10 20:20:45.191737
198	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173640000	1773173760000	20.555599212646484	5	2026-03-10 20:20:45.191737
199	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173640000	1773173760000	10.5556001663208	6	2026-03-10 20:20:45.191737
200	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173640000	1773173760000	16.388900756835938	5	2026-03-10 20:20:45.191737
201	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173640000	1773173760000	11.388899803161621	16	2026-03-10 20:20:45.191737
202	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173640000	1773173760000	7.5	5	2026-03-10 20:20:45.191737
203	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173640000	1773173760000	12.5	18	2026-03-10 20:20:45.191737
204	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173640000	1773173760000	11.111100196838379	6	2026-03-10 20:20:45.191737
205	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173640000	1773173760000	24.444400787353516	2	2026-03-10 20:20:45.191737
206	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173640000	1773173760000	9.722200393676758	3	2026-03-10 20:20:45.191737
207	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173640000	1773173760000	13.611100196838379	11	2026-03-10 20:20:45.191737
208	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173640000	1773173760000	12.222200393676758	8	2026-03-10 20:20:45.191737
209	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173640000	1773173760000	0	1	2026-03-10 20:20:45.191737
210	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173640000	1773173760000	4.1666998863220215	5	2026-03-10 20:20:45.191737
211	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173640000	1773173760000	8.33329963684082	10	2026-03-10 20:20:45.191737
212	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173640000	1773173760000	12.5	10	2026-03-10 20:20:45.191737
213	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173640000	1773173760000	0	2	2026-03-10 20:20:45.191737
214	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173640000	1773173760000	14.722200393676758	5	2026-03-10 20:20:45.191737
215	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173640000	1773173760000	10.277799606323242	12	2026-03-10 20:20:45.191737
216	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173640000	1773173760000	5.436507225036621	14	2026-03-10 20:20:45.191737
217	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173640000	1773173760000	1	1	2026-03-10 20:20:45.191737
218	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173640000	1773173760000	0	1	2026-03-10 20:20:45.191737
219	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173640000	1773173760000	2	6	2026-03-10 20:20:45.191737
220	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173640000	1773173760000	2	6	2026-03-10 20:20:45.191737
221	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173640000	1773173760000	1	3	2026-03-10 20:20:45.191737
222	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173640000	1773173760000	7.453700065612793	6	2026-03-10 20:20:45.191737
223	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173640000	1773173760000	5	6	2026-03-10 20:20:45.191737
224	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173640000	1773173760000	2.407433271408081	3	2026-03-10 20:20:45.191737
225	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173640000	1773173760000	9.120367050170898	6	2026-03-10 20:20:45.191737
226	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173640000	1773173760000	16.222219467163086	5	2026-03-10 20:20:45.191737
227	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173640000	1773173760000	10.333319664001465	5	2026-03-10 20:20:45.191737
228	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173640000	1773173760000	5.2778000831604	6	2026-03-10 20:20:45.191737
229	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173640000	1773173760000	9	5	2026-03-10 20:20:45.191737
230	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173640000	1773173760000	5.746531009674072	16	2026-03-10 20:20:45.191737
231	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173640000	1773173760000	4.888899803161621	5	2026-03-10 20:20:45.191737
232	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173640000	1773173760000	5.709866523742676	18	2026-03-10 20:20:45.191737
233	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173640000	1773173760000	5.185183525085449	6	2026-03-10 20:20:45.191737
234	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173640000	1773173760000	2	6	2026-03-10 20:20:45.191737
235	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173640000	1773173760000	2	5	2026-03-10 20:20:45.191737
236	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173640000	1773173760000	23.472200393676758	2	2026-03-10 20:20:45.191737
237	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173640000	1773173760000	7.314833641052246	3	2026-03-10 20:20:45.191737
238	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173640000	1773173760000	5.252527236938477	11	2026-03-10 20:20:45.191737
239	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173640000	1773173760000	6.909725189208984	8	2026-03-10 20:20:45.191737
240	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173640000	1773173760000	0	1	2026-03-10 20:20:45.191737
241	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173640000	1773173760000	2	5	2026-03-10 20:20:45.191737
242	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173640000	1773173760000	2	6	2026-03-10 20:20:45.191737
243	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173640000	1773173760000	2	5	2026-03-10 20:20:45.191737
244	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173640000	1773173760000	2.555579900741577	5	2026-03-10 20:20:46.189125
245	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173640000	1773173760000	3.4999899864196777	10	2026-03-10 20:20:46.189125
246	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173640000	1773173760000	6.888890266418457	10	2026-03-10 20:20:46.189125
247	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173640000	1773173760000	0	2	2026-03-10 20:20:46.189125
248	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173640000	1773173760000	5.611120223999023	5	2026-03-10 20:20:46.189125
249	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173640000	1773173760000	6.203700065612793	12	2026-03-10 20:20:46.189125
250	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173640000	1773173760000	6	16	2026-03-10 20:20:46.189125
251	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173640000	1773173760000	2	5	2026-03-10 20:20:46.189125
252	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173640000	1773173760000	6	18	2026-03-10 20:20:46.189125
253	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173640000	1773173760000	2	6	2026-03-10 20:20:46.189125
254	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173640000	1773173760000	1	2	2026-03-10 20:20:46.189125
255	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173640000	1773173760000	1	3	2026-03-10 20:20:46.189125
256	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173640000	1773173760000	4	11	2026-03-10 20:20:46.189125
257	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173640000	1773173760000	3	8	2026-03-10 20:20:46.189125
258	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173700000	1773173820000	6.410245895385742	13	2026-03-10 20:20:46.189125
259	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173640000	1773173760000	1	1	2026-03-10 20:20:46.189125
260	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173700000	1773173820000	10.277799606323242	13	2026-03-10 20:20:46.189125
261	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173700000	1773173820000	7.2221999168396	6	2026-03-10 20:20:46.189125
262	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173640000	1773173760000	2	5	2026-03-10 20:20:46.189125
263	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173640000	1773173760000	5	10	2026-03-10 20:20:46.189125
264	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173640000	1773173760000	4	10	2026-03-10 20:20:46.189125
265	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173640000	1773173760000	1	2	2026-03-10 20:20:46.189125
266	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173640000	1773173760000	2	5	2026-03-10 20:20:46.189125
267	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173640000	1773173760000	4	12	2026-03-10 20:20:46.189125
268	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173700000	1773173820000	4	13	2026-03-10 20:20:46.189125
269	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173700000	1773173820000	2	6	2026-03-10 20:20:46.189125
270	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173700000	1773173820000	1	4	2026-03-10 20:20:46.189125
271	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173700000	1773173820000	1	4	2026-03-10 20:20:46.189125
272	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173700000	1773173820000	1	4	2026-03-10 20:20:46.189125
273	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173700000	1773173820000	4.212966442108154	6	2026-03-10 20:20:46.189125
274	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173700000	1773173820000	4.305574893951416	4	2026-03-10 20:20:46.189125
275	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173700000	1773173820000	8.680575370788574	4	2026-03-10 20:20:46.189125
276	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173700000	1773173820000	8.611100196838379	4	2026-03-10 20:20:46.189125
277	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173700000	1773173820000	11.9443998336792	4	2026-03-10 20:20:46.189125
278	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173700000	1773173820000	8.888899803161621	4	2026-03-10 20:20:46.189125
279	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173700000	1773173820000	12.222200393676758	4	2026-03-10 20:20:46.189125
280	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173700000	1773173820000	7.5	8	2026-03-10 20:20:46.189125
281	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	7.5	3	2026-03-10 20:20:46.189125
282	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173700000	1773173820000	10	20	2026-03-10 20:20:46.189125
283	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173700000	1773173820000	4.930574893951416	4	2026-03-10 20:20:46.189125
284	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173700000	1773173820000	8.888875007629395	4	2026-03-10 20:20:46.189125
285	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173700000	1773173820000	5.416675090789795	8	2026-03-10 20:20:46.189125
286	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	2.5	3	2026-03-10 20:20:46.189125
287	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173700000	1773173820000	4.708330154418945	20	2026-03-10 20:20:46.189125
288	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173700000	1773173820000	7.986112594604492	8	2026-03-10 20:20:46.189125
289	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173700000	1773173820000	5.046288967132568	18	2026-03-10 20:20:46.189125
290	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173700000	1773173820000	4.7569499015808105	8	2026-03-10 20:20:46.189125
291	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173700000	1773173820000	12.777799606323242	8	2026-03-10 20:20:46.189125
292	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173700000	1773173820000	11.388899803161621	18	2026-03-10 20:20:46.189125
293	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173700000	1773173820000	9.722200393676758	8	2026-03-10 20:20:46.189125
294	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173700000	1773173820000	24.444400787353516	6	2026-03-10 20:20:46.189125
295	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173700000	1773173820000	11.388899803161621	7	2026-03-10 20:20:46.189125
296	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173700000	1773173820000	14.861100196838379	6	2026-03-10 20:20:46.189125
297	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173700000	1773173820000	5.992071628570557	7	2026-03-10 20:20:46.189125
298	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	8.888899803161621	1	2026-03-10 20:20:46.189125
299	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173700000	1773173820000	19.722200393676758	7	2026-03-10 20:20:46.189125
300	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173700000	1773173820000	16.388900756835938	7	2026-03-10 20:20:46.189125
301	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173700000	1773173820000	7.7778000831604	6	2026-03-10 20:20:46.189125
302	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173700000	1773173820000	11.111100196838379	7	2026-03-10 20:20:46.189125
303	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	8.888899803161621	1	2026-03-10 20:20:46.189125
304	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173700000	1773173820000	13.611100196838379	9	2026-03-10 20:20:46.189125
305	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173700000	1773173820000	9.722200393676758	4	2026-03-10 20:20:46.189125
306	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173700000	1773173820000	26.388900756835938	3	2026-03-10 20:20:46.189125
307	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173700000	1773173820000	12.5	24	2026-03-10 20:20:46.189125
308	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173700000	1773173820000	18.33329963684082	8	2026-03-10 20:20:46.189125
309	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173700000	1773173820000	13.611100196838379	14	2026-03-10 20:20:46.189125
310	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173700000	1773173820000	6.111100196838379	3	2026-03-10 20:20:46.189125
311	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173700000	1773173820000	0	3	2026-03-10 20:20:46.189125
312	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173700000	1773173820000	9.4443998336792	11	2026-03-10 20:20:46.189125
313	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173700000	1773173820000	11.111100196838379	17	2026-03-10 20:20:46.189125
314	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173700000	1773173820000	10.515871047973633	7	2026-03-10 20:20:46.189125
315	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173700000	1773173820000	8.650814056396484	7	2026-03-10 20:20:46.189125
316	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173700000	1773173820000	2.9629666805267334	6	2026-03-10 20:20:46.189125
317	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173700000	1773173820000	5.6349287033081055	7	2026-03-10 20:20:46.189125
318	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173700000	1773173820000	7.9938225746154785	9	2026-03-10 20:20:46.189125
319	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173700000	1773173820000	6.8055500984191895	4	2026-03-10 20:20:46.189125
320	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173700000	1773173820000	23.70370101928711	3	2026-03-10 20:20:46.189125
321	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173700000	1773173820000	5.949070930480957	24	2026-03-10 20:20:46.189125
322	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173700000	1773173820000	1	4	2026-03-10 20:20:46.189125
323	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173700000	1773173820000	2	8	2026-03-10 20:20:46.189125
324	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	1	3	2026-03-10 20:20:46.189125
325	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173700000	1773173820000	6	20	2026-03-10 20:20:46.189125
326	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173700000	1773173820000	2	8	2026-03-10 20:20:46.189125
327	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173700000	1773173820000	5	18	2026-03-10 20:20:46.189125
328	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173700000	1773173820000	2	8	2026-03-10 20:20:46.189125
329	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173700000	1773173820000	2	6	2026-03-10 20:20:46.189125
330	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173700000	1773173820000	2	7	2026-03-10 20:20:46.189125
331	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	1	1	2026-03-10 20:20:46.189125
332	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173700000	1773173820000	2	7	2026-03-10 20:20:46.189125
333	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173700000	1773173820000	2	7	2026-03-10 20:20:46.189125
334	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173700000	1773173820000	2	6	2026-03-10 20:20:46.189125
335	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173700000	1773173820000	2	7	2026-03-10 20:20:46.189125
336	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173700000	1773173820000	3	9	2026-03-10 20:20:46.189125
337	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173700000	1773173820000	1	4	2026-03-10 20:20:46.189125
338	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173700000	1773173820000	1	3	2026-03-10 20:20:46.189125
339	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173700000	1773173820000	6	24	2026-03-10 20:20:46.189125
340	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173700000	1773173820000	2	8	2026-03-10 20:20:46.189125
341	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173700000	1773173820000	4	14	2026-03-10 20:20:46.189125
342	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173700000	1773173820000	1	3	2026-03-10 20:20:46.189125
343	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173700000	1773173820000	1	3	2026-03-10 20:20:46.189125
344	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173700000	1773173820000	3	11	2026-03-10 20:20:46.279886
345	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173700000	1773173820000	5	17	2026-03-10 20:20:46.279886
346	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173700000	1773173820000	8.888887405395508	8	2026-03-10 20:20:46.279886
347	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173700000	1773173820000	5.615092754364014	14	2026-03-10 20:20:46.279886
348	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173700000	1773173820000	3.703700065612793	3	2026-03-10 20:20:46.279886
349	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173700000	1773173820000	0	3	2026-03-10 20:20:46.279886
350	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173700000	1773173820000	6.0606184005737305	11	2026-03-10 20:20:46.279886
351	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173700000	1773173820000	4.754905700683594	17	2026-03-10 20:20:46.279886
352	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173760000	1773173880000	11.111100196838379	18	2026-03-10 20:20:47.282811
353	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173760000	1773173880000	5	18	2026-03-10 20:20:47.282811
354	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	8.888899803161621	3	2026-03-10 20:20:47.282811
355	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	1	3	2026-03-10 20:20:47.282811
356	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173760000	1773173880000	5.138894557952881	18	2026-03-10 20:20:48.287576
357	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	6.481466770172119	3	2026-03-10 20:20:48.287576
358	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173760000	1773173880000	15.83329963684082	6	2026-03-10 20:20:48.287576
359	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	8.611100196838379	4	2026-03-10 20:20:48.287576
360	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173760000	1773173880000	6.944433212280273	6	2026-03-10 20:20:48.287576
361	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	5.347225189208984	4	2026-03-10 20:20:48.287576
362	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173760000	1773173880000	5.674600124359131	7	2026-03-10 20:20:48.287576
363	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173760000	1773173880000	6.623930931091309	13	2026-03-10 20:20:48.287576
364	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173760000	1773173880000	5.833337783813477	8	2026-03-10 20:20:48.287576
365	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173760000	1773173880000	8.402800559997559	4	2026-03-10 20:20:48.287576
366	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173760000	1773173880000	5.138899803161621	4	2026-03-10 20:20:48.287576
367	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173760000	1773173880000	9.166666030883789	3	2026-03-10 20:20:48.287576
368	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173760000	1773173880000	9.375	4	2026-03-10 20:20:48.287576
369	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173760000	1773173880000	4.285728454589844	7	2026-03-10 20:20:48.287576
370	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173760000	1773173880000	5.104175090789795	8	2026-03-10 20:20:48.287576
371	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173760000	1773173880000	4.3827223777771	18	2026-03-10 20:20:48.287576
372	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173760000	1773173880000	4.528986930847168	23	2026-03-10 20:20:48.287576
373	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173760000	1773173880000	6.388887405395508	8	2026-03-10 20:20:48.287576
374	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173760000	1773173880000	16.388856887817383	7	2026-03-10 20:20:48.287576
375	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173760000	1773173880000	6.212118148803711	11	2026-03-10 20:20:48.287576
376	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173760000	1773173880000	5.671295642852783	24	2026-03-10 20:20:48.287576
377	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173760000	1773173880000	11.284712791442871	8	2026-03-10 20:20:48.287576
378	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173760000	1773173880000	8.75	4	2026-03-10 20:20:48.287576
379	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173760000	1773173880000	7.499987602233887	8	2026-03-10 20:20:48.287576
380	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173760000	1773173880000	2.5	7	2026-03-10 20:20:48.287576
381	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173760000	1773173880000	8.437512397766113	8	2026-03-10 20:20:48.287576
382	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173760000	1773173880000	11.770825386047363	8	2026-03-10 20:20:48.287576
383	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173760000	1773173880000	18.26387596130371	4	2026-03-10 20:20:48.287576
384	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173760000	1773173880000	4.7221999168396	4	2026-03-10 20:20:48.287576
385	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173760000	1773173880000	8.33329963684082	7	2026-03-10 20:20:48.287576
386	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173760000	1773173880000	9.722200393676758	13	2026-03-10 20:20:48.287576
387	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173760000	1773173880000	8.0556001663208	8	2026-03-10 20:20:48.287576
388	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173760000	1773173880000	11.66670036315918	4	2026-03-10 20:20:48.287576
389	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173760000	1773173880000	8.888899803161621	4	2026-03-10 20:20:48.287576
390	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173760000	1773173880000	16.111099243164062	3	2026-03-10 20:20:48.287576
391	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173760000	1773173880000	16.66670036315918	4	2026-03-10 20:20:48.287576
392	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173760000	1773173880000	10	7	2026-03-10 20:20:48.287576
393	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173760000	1773173880000	9.722200393676758	8	2026-03-10 20:20:48.287576
394	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173760000	1773173880000	10.5556001663208	18	2026-03-10 20:20:48.287576
395	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173760000	1773173880000	10	23	2026-03-10 20:20:48.287576
396	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173760000	1773173880000	10.277799606323242	8	2026-03-10 20:20:48.287576
397	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173760000	1773173880000	26.944400787353516	7	2026-03-10 20:20:48.287576
398	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173760000	1773173880000	9.4443998336792	11	2026-03-10 20:20:48.287576
399	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173760000	1773173880000	10.83329963684082	24	2026-03-10 20:20:48.287576
400	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173760000	1773173880000	18.33329963684082	8	2026-03-10 20:20:48.287576
401	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173760000	1773173880000	16.66670036315918	4	2026-03-10 20:20:48.287576
402	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173760000	1773173880000	11.111100196838379	8	2026-03-10 20:20:48.287576
403	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173760000	1773173880000	6.6666998863220215	7	2026-03-10 20:20:48.287576
404	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173760000	1773173880000	18.33329963684082	8	2026-03-10 20:20:48.287576
405	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173760000	1773173880000	19.16670036315918	8	2026-03-10 20:20:48.287576
406	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173760000	1773173880000	26.388900756835938	4	2026-03-10 20:20:48.287576
407	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173760000	1773173880000	9.4443998336792	4	2026-03-10 20:20:48.287576
408	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173760000	1773173880000	8.888899803161621	4	2026-03-10 20:20:48.287576
409	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173760000	1773173880000	8.888899803161621	12	2026-03-10 20:20:48.287576
410	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173760000	1773173880000	2	6	2026-03-10 20:20:48.287576
411	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:20:48.287576
412	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173760000	1773173880000	2	7	2026-03-10 20:20:48.287576
413	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173760000	1773173880000	4	13	2026-03-10 20:20:48.287576
414	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173760000	1773173880000	2	8	2026-03-10 20:20:48.287576
415	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:20:48.287576
416	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:20:48.287576
417	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173760000	1773173880000	1	3	2026-03-10 20:20:48.287576
418	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:20:48.287576
419	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173760000	1773173880000	2	7	2026-03-10 20:20:48.287576
420	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173760000	1773173880000	2	8	2026-03-10 20:20:48.287576
421	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173760000	1773173880000	5	18	2026-03-10 20:20:48.287576
422	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173760000	1773173880000	6	23	2026-03-10 20:20:48.287576
423	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173760000	1773173880000	2	8	2026-03-10 20:20:48.287576
424	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173760000	1773173880000	2	7	2026-03-10 20:20:48.287576
425	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173760000	1773173880000	3	11	2026-03-10 20:20:48.287576
426	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173760000	1773173880000	6	24	2026-03-10 20:20:48.287576
427	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173760000	1773173880000	2	8	2026-03-10 20:20:48.287576
428	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:20:48.287576
429	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173760000	1773173880000	2	8	2026-03-10 20:20:48.287576
430	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173760000	1773173880000	2	7	2026-03-10 20:20:48.287576
431	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173760000	1773173880000	2	8	2026-03-10 20:20:48.287576
432	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173760000	1773173880000	2	8	2026-03-10 20:20:48.287576
433	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:20:48.287576
434	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:20:48.287576
435	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:20:48.287576
436	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173760000	1773173880000	4	12	2026-03-10 20:20:48.287576
437	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173760000	1773173880000	6.666675090789795	4	2026-03-10 20:20:48.287576
438	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173760000	1773173880000	4.07408332824707	12	2026-03-10 20:20:48.287576
439	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	0	2	2026-03-10 20:27:49.617133
440	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173520000	1773173640000	14.861099243164062	2	2026-03-10 20:27:49.617133
441	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173520000	1773173640000	0.833299994468689	1	2026-03-10 20:27:49.617133
442	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173520000	1773173640000	4.583333492279053	6	2026-03-10 20:27:49.617133
443	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173520000	1773173640000	2.5347249507904053	8	2026-03-10 20:27:49.617133
444	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173520000	1773173640000	4.305549621582031	2	2026-03-10 20:27:49.617133
445	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173520000	1773173640000	3.9814999103546143	3	2026-03-10 20:27:49.617133
446	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173520000	1773173640000	9.444449424743652	2	2026-03-10 20:27:49.617133
447	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173520000	1773173640000	10.694449424743652	2	2026-03-10 20:27:49.617133
448	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173520000	1773173640000	8.0556001663208	1	2026-03-10 20:27:49.617133
449	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:27:49.617133
450	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173520000	1773173640000	4.444433212280273	6	2026-03-10 20:27:49.617133
451	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173520000	1773173640000	5.138900279998779	2	2026-03-10 20:27:49.617133
452	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173520000	1773173640000	7.777750015258789	2	2026-03-10 20:27:49.617133
453	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173520000	1773173640000	1.527750015258789	2	2026-03-10 20:27:49.617133
454	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173520000	1773173640000	8.888850212097168	2	2026-03-10 20:27:49.617133
455	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:27:49.617133
456	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173520000	1773173640000	17.777799606323242	1	2026-03-10 20:27:49.617133
457	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173520000	1773173640000	4.555580139160156	5	2026-03-10 20:27:49.617133
458	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173520000	1773173640000	6.1805500984191895	4	2026-03-10 20:27:49.617133
459	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173520000	1773173640000	6.250024795532227	4	2026-03-10 20:27:49.617133
460	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173520000	1773173640000	3.277780055999756	5	2026-03-10 20:27:49.617133
461	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173520000	1773173640000	3.6110999584198	2	2026-03-10 20:27:49.617133
462	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173520000	1773173640000	7.870400428771973	3	2026-03-10 20:27:49.617133
463	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173520000	1773173640000	8.888899803161621	1	2026-03-10 20:27:49.617133
464	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173520000	1773173640000	25.277799606323242	1	2026-03-10 20:27:49.617133
465	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:27:49.617133
466	average.vehicle.speed	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173520000	1773173640000	3.0555999279022217	1	2026-03-10 20:27:49.617133
467	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:27:49.617133
468	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173520000	1773173640000	6.527799606323242	2	2026-03-10 20:27:49.617133
469	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173580000	1773173700000	6.666675090789795	4	2026-03-10 20:27:49.617133
470	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	0	1	2026-03-10 20:27:49.617133
471	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173580000	1773173700000	10.208324432373047	4	2026-03-10 20:27:49.617133
472	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173580000	1773173700000	1.1111000776290894	2	2026-03-10 20:27:49.617133
473	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:27:49.617133
474	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173580000	1773173700000	16.388874053955078	4	2026-03-10 20:27:49.617133
475	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173580000	1773173700000	4.166659832000732	5	2026-03-10 20:27:49.617133
476	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173580000	1773173700000	3.71795392036438	13	2026-03-10 20:27:49.617133
477	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173580000	1773173700000	4.976858139038086	12	2026-03-10 20:27:49.617133
478	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173580000	1773173700000	5.347224712371826	4	2026-03-10 20:27:49.617133
479	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173580000	1773173700000	7.2221999168396	4	2026-03-10 20:27:49.617133
480	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173580000	1773173700000	8.541675567626953	4	2026-03-10 20:27:49.617133
481	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173580000	1773173700000	4.3055500984191895	12	2026-03-10 20:27:49.617133
482	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173580000	1773173700000	4.236100196838379	4	2026-03-10 20:27:49.617133
483	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173580000	1773173700000	8.888875007629395	4	2026-03-10 20:27:49.617133
484	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173580000	1773173700000	7.361149787902832	2	2026-03-10 20:27:49.617133
485	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:27:49.617133
486	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173580000	1773173700000	2.5	4	2026-03-10 20:27:49.617133
487	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173580000	1773173700000	0	1	2026-03-10 20:27:49.617133
488	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173580000	1773173700000	7.916683673858643	6	2026-03-10 20:27:49.617133
489	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173580000	1773173700000	3.784712553024292	8	2026-03-10 20:27:49.617133
490	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173580000	1773173700000	4.791662693023682	8	2026-03-10 20:27:49.617133
491	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173580000	1773173700000	5.277789115905762	9	2026-03-10 20:27:49.617133
492	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173580000	1773173700000	11.666699409484863	2	2026-03-10 20:27:49.617133
493	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173580000	1773173700000	6.354175090789795	8	2026-03-10 20:27:49.617133
494	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173580000	1773173700000	5.486100196838379	4	2026-03-10 20:27:49.617133
495	average.vehicle.speed	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173580000	1773173700000	3.0555999279022217	1	2026-03-10 20:27:49.617133
496	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:27:49.617133
497	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173580000	1773173700000	24.861101150512695	2	2026-03-10 20:27:49.617133
498	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173580000	1773173700000	9.444449424743652	2	2026-03-10 20:27:49.617133
499	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173640000	1773173760000	11.111100196838379	3	2026-03-10 20:27:49.617133
500	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173640000	1773173760000	6.388899803161621	3	2026-03-10 20:27:49.617133
501	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173640000	1773173760000	1.75926673412323	3	2026-03-10 20:27:49.617133
502	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173640000	1773173760000	5.436507225036621	14	2026-03-10 20:27:49.617133
503	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173640000	1773173760000	0	1	2026-03-10 20:27:49.617133
504	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173640000	1773173760000	7.453700065612793	6	2026-03-10 20:27:49.617133
505	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173640000	1773173760000	5	6	2026-03-10 20:27:49.617133
506	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173640000	1773173760000	2.407433271408081	3	2026-03-10 20:27:49.617133
507	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173640000	1773173760000	9.120367050170898	6	2026-03-10 20:27:49.617133
508	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173640000	1773173760000	16.222219467163086	5	2026-03-10 20:27:49.617133
509	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173640000	1773173760000	10.333319664001465	5	2026-03-10 20:27:49.617133
510	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173640000	1773173760000	5.2778000831604	6	2026-03-10 20:27:49.617133
511	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173640000	1773173760000	9	5	2026-03-10 20:27:49.617133
512	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173640000	1773173760000	5.746531009674072	16	2026-03-10 20:27:49.617133
513	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173640000	1773173760000	4.888899803161621	5	2026-03-10 20:27:49.617133
514	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173640000	1773173760000	5.709866523742676	18	2026-03-10 20:27:49.617133
515	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173640000	1773173760000	5.185183525085449	6	2026-03-10 20:27:49.617133
516	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173640000	1773173760000	23.472200393676758	2	2026-03-10 20:27:49.617133
517	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173640000	1773173760000	7.314833641052246	3	2026-03-10 20:27:49.617133
518	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173640000	1773173760000	5.252527236938477	11	2026-03-10 20:27:49.617133
519	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173640000	1773173760000	6.909725189208984	8	2026-03-10 20:27:49.617133
520	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173640000	1773173760000	0	1	2026-03-10 20:27:49.617133
521	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173640000	1773173760000	2.555579900741577	5	2026-03-10 20:27:49.617133
522	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173640000	1773173760000	3.4999899864196777	10	2026-03-10 20:27:49.617133
523	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173640000	1773173760000	6.888890266418457	10	2026-03-10 20:27:49.617133
524	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173640000	1773173760000	0	2	2026-03-10 20:27:49.617133
525	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173640000	1773173760000	5.611120223999023	5	2026-03-10 20:27:49.617133
526	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173640000	1773173760000	6.203700065612793	12	2026-03-10 20:27:49.617133
527	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173700000	1773173820000	6.410245895385742	13	2026-03-10 20:27:49.617133
528	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173700000	1773173820000	4.212966442108154	6	2026-03-10 20:27:49.617133
529	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173700000	1773173820000	4.305574893951416	4	2026-03-10 20:27:49.617133
530	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173700000	1773173820000	8.680575370788574	4	2026-03-10 20:27:49.617133
531	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173700000	1773173820000	4.930574893951416	4	2026-03-10 20:27:49.617133
532	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173700000	1773173820000	8.888875007629395	4	2026-03-10 20:27:49.617133
533	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173700000	1773173820000	5.416675090789795	8	2026-03-10 20:27:49.617133
534	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	2.5	3	2026-03-10 20:27:49.617133
535	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173700000	1773173820000	4.708330154418945	20	2026-03-10 20:27:49.617133
536	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173700000	1773173820000	7.986112594604492	8	2026-03-10 20:27:49.617133
537	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173700000	1773173820000	5.046288967132568	18	2026-03-10 20:27:49.617133
538	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173700000	1773173820000	4.7569499015808105	8	2026-03-10 20:27:49.617133
539	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173700000	1773173820000	14.861100196838379	6	2026-03-10 20:27:49.808449
540	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173700000	1773173820000	5.992071628570557	7	2026-03-10 20:27:49.808449
541	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	8.888899803161621	1	2026-03-10 20:27:49.808449
542	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173700000	1773173820000	10.515871047973633	7	2026-03-10 20:27:49.808449
543	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173700000	1773173820000	8.650814056396484	7	2026-03-10 20:27:49.808449
544	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173700000	1773173820000	2.9629666805267334	6	2026-03-10 20:27:49.808449
545	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173700000	1773173820000	5.6349287033081055	7	2026-03-10 20:27:49.808449
546	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173700000	1773173820000	7.9938225746154785	9	2026-03-10 20:27:49.808449
547	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173700000	1773173820000	6.8055500984191895	4	2026-03-10 20:27:49.808449
548	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173700000	1773173820000	23.70370101928711	3	2026-03-10 20:27:49.808449
549	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173700000	1773173820000	5.949070930480957	24	2026-03-10 20:27:49.808449
550	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173700000	1773173820000	8.888887405395508	8	2026-03-10 20:27:49.808449
551	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173700000	1773173820000	5.615092754364014	14	2026-03-10 20:27:49.808449
552	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173700000	1773173820000	3.703700065612793	3	2026-03-10 20:27:49.808449
553	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173700000	1773173820000	0	3	2026-03-10 20:27:49.808449
554	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173700000	1773173820000	6.0606184005737305	11	2026-03-10 20:27:49.808449
555	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173700000	1773173820000	4.754905700683594	17	2026-03-10 20:27:49.808449
556	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173760000	1773173880000	5.138894557952881	18	2026-03-10 20:27:49.808449
557	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	6.481466770172119	3	2026-03-10 20:27:49.808449
558	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173760000	1773173880000	6.944433212280273	6	2026-03-10 20:27:49.808449
559	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	5.347225189208984	4	2026-03-10 20:27:49.808449
560	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173760000	1773173880000	5.674600124359131	7	2026-03-10 20:27:49.808449
561	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173760000	1773173880000	6.623930931091309	13	2026-03-10 20:27:49.808449
562	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173760000	1773173880000	5.833337783813477	8	2026-03-10 20:27:49.808449
563	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173760000	1773173880000	8.402800559997559	4	2026-03-10 20:27:49.808449
564	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173760000	1773173880000	5.138899803161621	4	2026-03-10 20:27:49.808449
565	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173760000	1773173880000	9.166666030883789	3	2026-03-10 20:27:49.808449
566	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173760000	1773173880000	9.375	4	2026-03-10 20:27:49.808449
567	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173760000	1773173880000	4.285728454589844	7	2026-03-10 20:27:49.808449
568	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173760000	1773173880000	5.104175090789795	8	2026-03-10 20:27:49.808449
569	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173760000	1773173880000	4.3827223777771	18	2026-03-10 20:27:49.808449
570	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173760000	1773173880000	4.528986930847168	23	2026-03-10 20:27:49.808449
571	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173760000	1773173880000	6.388887405395508	8	2026-03-10 20:27:49.808449
695	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174000000	1773174120000	7.685199737548828	3	2026-03-10 20:27:49.909366
572	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173760000	1773173880000	16.388856887817383	7	2026-03-10 20:27:49.808449
573	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173760000	1773173880000	6.212118148803711	11	2026-03-10 20:27:49.808449
574	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173760000	1773173880000	5.671295642852783	24	2026-03-10 20:27:49.808449
575	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173760000	1773173880000	11.284712791442871	8	2026-03-10 20:27:49.808449
576	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173760000	1773173880000	8.75	4	2026-03-10 20:27:49.808449
577	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173760000	1773173880000	7.499987602233887	8	2026-03-10 20:27:49.808449
578	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173760000	1773173880000	2.5	7	2026-03-10 20:27:49.808449
579	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173760000	1773173880000	8.437512397766113	8	2026-03-10 20:27:49.808449
580	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173760000	1773173880000	11.770825386047363	8	2026-03-10 20:27:49.808449
581	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173760000	1773173880000	18.26387596130371	4	2026-03-10 20:27:49.808449
582	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173760000	1773173880000	4.7221999168396	4	2026-03-10 20:27:49.808449
583	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173760000	1773173880000	6.666675090789795	4	2026-03-10 20:27:49.808449
584	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173760000	1773173880000	4.07408332824707	12	2026-03-10 20:27:49.808449
585	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173820000	1773173940000	3.3333287239074707	7	2026-03-10 20:27:49.808449
586	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173820000	1773173940000	5.952385425567627	7	2026-03-10 20:27:49.808449
587	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173820000	1773173940000	8.125	4	2026-03-10 20:27:49.808449
588	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173820000	1773173940000	5.277774810791016	4	2026-03-10 20:27:49.808449
589	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173820000	1773173940000	3.7499749660491943	4	2026-03-10 20:27:49.808449
590	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173820000	1773173940000	7.569425106048584	4	2026-03-10 20:27:49.808449
591	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173820000	1773173940000	4.148146629333496	15	2026-03-10 20:27:49.808449
592	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173820000	1773173940000	10.20835018157959	8	2026-03-10 20:27:49.808449
593	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173820000	1773173940000	6.8650712966918945	7	2026-03-10 20:27:49.808449
594	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173820000	1773173940000	6.875	4	2026-03-10 20:27:49.808449
595	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173820000	1773173940000	6.282061576843262	13	2026-03-10 20:27:49.808449
596	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173820000	1773173940000	5.02524995803833	22	2026-03-10 20:27:49.808449
597	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173820000	1773173940000	4.365085601806641	7	2026-03-10 20:27:49.808449
598	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173820000	1773173940000	5.6944499015808105	6	2026-03-10 20:27:49.808449
599	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173820000	1773173940000	7.96293306350708	3	2026-03-10 20:27:49.808449
600	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173820000	1773173940000	14.444466590881348	3	2026-03-10 20:27:49.808449
601	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173820000	1773173940000	4.21054220199585	19	2026-03-10 20:27:49.808449
602	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173820000	1773173940000	6.3194499015808105	4	2026-03-10 20:27:49.808449
603	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173820000	1773173940000	8.298600196838379	8	2026-03-10 20:27:49.808449
604	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173820000	1773173940000	6.74601411819458	7	2026-03-10 20:27:49.808449
605	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173820000	1773173940000	5.555547714233398	23	2026-03-10 20:27:49.808449
606	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173820000	1773173940000	10.41664981842041	8	2026-03-10 20:27:49.808449
607	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173820000	1773173940000	6.367507457733154	13	2026-03-10 20:27:49.808449
608	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173820000	1773173940000	13.01584243774414	7	2026-03-10 20:27:49.808449
609	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173820000	1773173940000	13.958324432373047	4	2026-03-10 20:27:49.808449
610	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173820000	1773173940000	4.027783393859863	6	2026-03-10 20:27:49.808449
611	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173820000	1773173940000	9.79164981842041	4	2026-03-10 20:27:49.808449
612	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173820000	1773173940000	15.648133277893066	3	2026-03-10 20:27:49.808449
613	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173820000	1773173940000	12.70835018157959	8	2026-03-10 20:27:49.808449
614	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173880000	1773174000000	12.546316146850586	6	2026-03-10 20:27:49.808449
615	average.vehicle.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173880000	1773174000000	18.055599212646484	1	2026-03-10 20:27:49.808449
616	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173880000	1773174000000	7.29164981842041	4	2026-03-10 20:27:49.808449
617	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173880000	1773174000000	8.222240447998047	5	2026-03-10 20:27:49.808449
618	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173880000	1773174000000	4.814833641052246	3	2026-03-10 20:27:49.808449
619	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173880000	1773174000000	14.953716278076172	6	2026-03-10 20:27:49.808449
620	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173880000	1773174000000	5.3471999168396	4	2026-03-10 20:27:49.808449
621	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173880000	1773174000000	7.685166835784912	3	2026-03-10 20:27:49.808449
622	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173880000	1773174000000	10.370367050170898	3	2026-03-10 20:27:49.808449
623	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173880000	1773174000000	7.037033557891846	3	2026-03-10 20:27:49.808449
624	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173880000	1773174000000	4.3939361572265625	11	2026-03-10 20:27:49.808449
625	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173880000	1773174000000	4.351833343505859	3	2026-03-10 20:27:49.808449
626	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173880000	1773174000000	4.888899803161621	5	2026-03-10 20:27:49.808449
627	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173880000	1773174000000	5.5555500984191895	16	2026-03-10 20:27:49.808449
628	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173880000	1773174000000	6.018499851226807	3	2026-03-10 20:27:49.808449
629	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173880000	1773174000000	5.740744590759277	9	2026-03-10 20:27:49.808449
630	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173880000	1773174000000	7.314800262451172	3	2026-03-10 20:27:49.808449
631	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173880000	1773174000000	22.5	1	2026-03-10 20:27:49.808449
632	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173880000	1773174000000	8.819424629211426	4	2026-03-10 20:27:49.808449
633	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173880000	1773174000000	5.702611923217773	17	2026-03-10 20:27:49.808449
634	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173880000	1773174000000	11.15738296508789	6	2026-03-10 20:27:49.808449
635	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173880000	1773174000000	6.435183525085449	6	2026-03-10 20:27:49.808449
636	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173880000	1773174000000	5.7407331466674805	3	2026-03-10 20:27:49.808449
637	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173880000	1773174000000	5.376992702484131	14	2026-03-10 20:27:49.808449
638	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173880000	1773174000000	6.277760028839111	5	2026-03-10 20:27:49.808449
639	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173880000	1773174000000	4.090909004211426	11	2026-03-10 20:27:49.909366
640	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173880000	1773174000000	8.888899803161621	3	2026-03-10 20:27:49.909366
641	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173880000	1773174000000	4.097225189208984	4	2026-03-10 20:27:49.909366
642	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173880000	1773174000000	15.277766227722168	3	2026-03-10 20:27:49.909366
643	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173940000	1773174060000	11.296299934387207	3	2026-03-10 20:27:49.909366
644	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173940000	1773174060000	5.629640102386475	15	2026-03-10 20:27:49.909366
645	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173940000	1773174060000	6.944425106048584	8	2026-03-10 20:27:49.909366
646	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173940000	1773174060000	6.574066638946533	3	2026-03-10 20:27:49.909366
647	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173940000	1773174060000	11.840262413024902	8	2026-03-10 20:27:49.909366
648	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173940000	1773174060000	12.777756690979004	7	2026-03-10 20:27:49.909366
649	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173940000	1773174060000	8.174613952636719	7	2026-03-10 20:27:49.909366
650	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173940000	1773174060000	5.666659832000732	5	2026-03-10 20:27:49.909366
651	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173940000	1773174060000	5.83335018157959	4	2026-03-10 20:27:49.909366
652	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173940000	1773174060000	5.925899982452393	3	2026-03-10 20:27:49.909366
653	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173940000	1773174060000	3.968271255493164	7	2026-03-10 20:27:49.909366
654	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173940000	1773174060000	4.814833164215088	3	2026-03-10 20:27:49.909366
655	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173940000	1773174060000	11.805550575256348	4	2026-03-10 20:27:49.909366
656	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173940000	1773174060000	9.166675567626953	4	2026-03-10 20:27:49.909366
657	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173940000	1773174060000	4.583335876464844	14	2026-03-10 20:27:49.909366
658	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173940000	1773174060000	5.288461685180664	26	2026-03-10 20:27:49.909366
659	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173940000	1773174060000	3.253971576690674	7	2026-03-10 20:27:49.909366
660	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173940000	1773174060000	6.0648112297058105	18	2026-03-10 20:27:49.909366
661	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173940000	1773174060000	8.33335018157959	6	2026-03-10 20:27:49.909366
662	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173940000	1773174060000	10.694450378417969	4	2026-03-10 20:27:49.909366
663	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173940000	1773174060000	2.777750015258789	2	2026-03-10 20:27:49.909366
664	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173940000	1773174060000	8.95835018157959	4	2026-03-10 20:27:49.909366
665	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173940000	1773174060000	5.833323955535889	21	2026-03-10 20:27:49.909366
666	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173940000	1773174060000	8.298612594604492	8	2026-03-10 20:27:49.909366
667	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173940000	1773174060000	5.1388750076293945	4	2026-03-10 20:27:49.909366
668	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173940000	1773174060000	7.129632949829102	3	2026-03-10 20:27:49.909366
669	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173940000	1773174060000	3.888890027999878	10	2026-03-10 20:27:49.909366
670	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173940000	1773174060000	4.999974727630615	8	2026-03-10 20:27:49.909366
671	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174000000	1773174120000	5.1388750076293945	8	2026-03-10 20:27:49.909366
672	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174000000	1773174120000	4.722221374511719	14	2026-03-10 20:27:49.909366
673	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174000000	1773174120000	7.777785778045654	7	2026-03-10 20:27:49.909366
674	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174000000	1773174120000	12.777766227722168	3	2026-03-10 20:27:49.909366
675	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174000000	1773174120000	10.238085746765137	7	2026-03-10 20:27:49.909366
676	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174000000	1773174120000	7.91664981842041	8	2026-03-10 20:27:49.909366
677	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773174000000	1773174120000	7.314799785614014	3	2026-03-10 20:27:49.909366
678	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174000000	1773174120000	5.299153804779053	13	2026-03-10 20:27:49.909366
679	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174000000	1773174120000	10.416662216186523	8	2026-03-10 20:27:49.909366
680	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174000000	1773174120000	12.708325386047363	4	2026-03-10 20:27:49.909366
681	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174000000	1773174120000	8.541674613952637	4	2026-03-10 20:27:49.909366
682	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174000000	1773174120000	4.087314128875732	7	2026-03-10 20:27:49.909366
683	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174000000	1773174120000	6.481466770172119	3	2026-03-10 20:27:49.909366
684	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174000000	1773174120000	5.740733623504639	6	2026-03-10 20:27:49.909366
685	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174000000	1773174120000	7.013899803161621	4	2026-03-10 20:27:49.909366
686	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174000000	1773174120000	5.462966442108154	3	2026-03-10 20:27:49.909366
687	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174000000	1773174120000	5.034725189208984	8	2026-03-10 20:27:49.909366
688	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174000000	1773174120000	6.805574893951416	4	2026-03-10 20:27:49.909366
689	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174000000	1773174120000	10.277799606323242	4	2026-03-10 20:27:49.909366
690	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174000000	1773174120000	4.521599769592285	18	2026-03-10 20:27:49.909366
691	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174000000	1773174120000	4.675933361053467	6	2026-03-10 20:27:49.909366
692	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174000000	1773174120000	5.092588901519775	27	2026-03-10 20:27:49.909366
693	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174000000	1773174120000	10.370367050170898	6	2026-03-10 20:27:49.909366
694	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174000000	1773174120000	5.46293306350708	3	2026-03-10 20:27:49.909366
696	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174000000	1773174120000	4.444425106048584	4	2026-03-10 20:27:49.909366
697	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174000000	1773174120000	5.912685871124268	21	2026-03-10 20:27:49.909366
698	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174000000	1773174120000	7.048612594604492	8	2026-03-10 20:27:49.909366
699	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174060000	1773174180000	6.141966819763184	18	2026-03-10 20:27:49.909366
700	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174060000	1773174180000	6.888879776000977	5	2026-03-10 20:27:49.909366
701	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174060000	1773174180000	6.851866722106934	3	2026-03-10 20:27:49.909366
702	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174060000	1773174180000	11.805566787719727	6	2026-03-10 20:27:49.909366
703	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773174060000	1773174180000	8.33329963684082	2	2026-03-10 20:27:49.909366
704	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174060000	1773174180000	8.00926685333252	6	2026-03-10 20:27:49.909366
705	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174060000	1773174180000	6.944466590881348	6	2026-03-10 20:27:49.909366
706	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174060000	1773174180000	5.37036657333374	6	2026-03-10 20:27:49.909366
707	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174060000	1773174180000	4.814816474914551	12	2026-03-10 20:27:49.909366
708	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174060000	1773174180000	16.01853370666504	3	2026-03-10 20:27:49.909366
709	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174060000	1773174180000	7.037033557891846	6	2026-03-10 20:27:49.909366
710	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174060000	1773174180000	4.907416343688965	6	2026-03-10 20:27:49.909366
711	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174060000	1773174180000	10.925933837890625	3	2026-03-10 20:27:49.909366
712	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174060000	1773174180000	5	3	2026-03-10 20:27:49.909366
713	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174060000	1773174180000	4.444439888000488	5	2026-03-10 20:27:49.909366
714	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174060000	1773174180000	8.425932884216309	6	2026-03-10 20:27:49.909366
715	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174060000	1773174180000	7.87036657333374	3	2026-03-10 20:27:49.909366
716	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174060000	1773174180000	6.203700065612793	3	2026-03-10 20:27:49.909366
717	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174060000	1773174180000	4.166665077209473	20	2026-03-10 20:27:49.909366
718	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174060000	1773174180000	4.543650150299072	14	2026-03-10 20:27:49.909366
719	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174060000	1773174180000	0	3	2026-03-10 20:27:49.909366
720	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174060000	1773174180000	4.120383262634277	6	2026-03-10 20:27:49.909366
721	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174060000	1773174180000	4.7221999168396	3	2026-03-10 20:27:49.909366
722	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174060000	1773174180000	7.5	3	2026-03-10 20:27:49.909366
723	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174060000	1773174180000	10.555566787719727	3	2026-03-10 20:27:49.909366
724	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174060000	1773174180000	7.037033557891846	3	2026-03-10 20:27:49.909366
725	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174060000	1773174180000	13.796266555786133	3	2026-03-10 20:27:49.909366
726	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174060000	1773174180000	7.870349884033203	6	2026-03-10 20:27:49.909366
727	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174120000	1773174240000	5	8	2026-03-10 20:27:49.909366
728	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174120000	1773174240000	8.888883590698242	6	2026-03-10 20:27:49.909366
729	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174120000	1773174240000	4.761899948120117	7	2026-03-10 20:27:49.909366
730	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174120000	1773174240000	6.0846476554870605	21	2026-03-10 20:27:49.909366
731	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174120000	1773174240000	5.7638750076293945	4	2026-03-10 20:27:49.909366
732	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174120000	1773174240000	4.89585018157959	8	2026-03-10 20:27:49.909366
733	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174120000	1773174240000	9.56350040435791	7	2026-03-10 20:27:49.909366
734	average.vehicle.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773174120000	1773174240000	8.33329963684082	1	2026-03-10 20:27:49.909366
735	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174120000	1773174240000	4.444466590881348	3	2026-03-10 20:27:49.909366
736	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174120000	1773174240000	6.309528827667236	7	2026-03-10 20:27:49.909366
737	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174120000	1773174240000	6.269843101501465	7	2026-03-10 20:27:49.909366
738	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174120000	1773174240000	3.75	6	2026-03-10 20:27:49.909366
739	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174120000	1773174240000	8.402774810791016	8	2026-03-10 20:27:50.112281
740	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174120000	1773174240000	5.576938629150391	13	2026-03-10 20:27:50.112281
741	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174120000	1773174240000	16.875	4	2026-03-10 20:27:50.112281
742	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174120000	1773174240000	9.305575370788574	4	2026-03-10 20:27:50.112281
743	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174120000	1773174240000	5.277775287628174	4	2026-03-10 20:27:50.112281
744	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174120000	1773174240000	16.85183334350586	3	2026-03-10 20:27:50.112281
745	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174120000	1773174240000	5.09256649017334	3	2026-03-10 20:27:50.112281
746	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174120000	1773174240000	0	4	2026-03-10 20:27:50.112281
747	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174120000	1773174240000	4.19312858581543	21	2026-03-10 20:27:50.112281
748	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174120000	1773174240000	7.962966442108154	3	2026-03-10 20:27:50.112281
749	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174120000	1773174240000	8.055550575256348	4	2026-03-10 20:27:50.112281
750	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174120000	1773174240000	5.104162693023682	16	2026-03-10 20:27:50.112281
751	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174120000	1773174240000	3.9285714626312256	7	2026-03-10 20:27:50.112281
752	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174120000	1773174240000	4.583324909210205	4	2026-03-10 20:27:50.112281
753	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174120000	1773174240000	5.277775287628174	4	2026-03-10 20:27:50.112281
754	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174120000	1773174240000	6.944433212280273	3	2026-03-10 20:27:50.112281
755	average.vehicle.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174180000	1773174300000	5.37036657333374	3	2026-03-10 20:27:50.112281
756	average.vehicle.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174180000	1773174300000	14.999975204467773	4	2026-03-10 20:27:50.112281
757	average.vehicle.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174180000	1773174300000	11.468256950378418	7	2026-03-10 20:27:50.112281
758	average.vehicle.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174180000	1773174300000	6.805562496185303	8	2026-03-10 20:27:50.112281
759	average.vehicle.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174180000	1773174300000	3.854175090789795	8	2026-03-10 20:27:50.112281
760	average.vehicle.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174180000	1773174300000	5.357128620147705	7	2026-03-10 20:27:50.112281
761	average.vehicle.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174180000	1773174300000	9.277780532836914	5	2026-03-10 20:27:50.112281
762	average.vehicle.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174180000	1773174300000	6.388879776000977	20	2026-03-10 20:27:50.112281
763	average.vehicle.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174180000	1773174300000	6.944433212280273	3	2026-03-10 20:27:50.112281
764	average.vehicle.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174180000	1773174300000	7.051300048828125	13	2026-03-10 20:27:50.112281
765	average.vehicle.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174180000	1773174300000	5.333320140838623	5	2026-03-10 20:27:50.112281
766	average.vehicle.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174180000	1773174300000	6.215262413024902	8	2026-03-10 20:27:50.112281
767	average.vehicle.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174180000	1773174300000	2.222249984741211	2	2026-03-10 20:27:50.112281
768	average.vehicle.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174180000	1773174300000	4.68254280090332	7	2026-03-10 20:27:50.112281
769	average.vehicle.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174180000	1773174300000	8.41268539428711	7	2026-03-10 20:27:50.112281
770	average.vehicle.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174180000	1773174300000	0	4	2026-03-10 20:27:50.112281
771	average.vehicle.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174180000	1773174300000	8.333333015441895	3	2026-03-10 20:27:50.112281
772	average.vehicle.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174180000	1773174300000	4.901976585388184	17	2026-03-10 20:27:50.112281
773	average.vehicle.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174180000	1773174300000	8.75	2	2026-03-10 20:27:50.112281
774	average.vehicle.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174180000	1773174300000	21.111099243164062	3	2026-03-10 20:27:50.112281
775	average.vehicle.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174180000	1773174300000	5.555574893951416	4	2026-03-10 20:27:50.112281
776	average.vehicle.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174180000	1773174300000	6.944425106048584	4	2026-03-10 20:27:50.112281
777	average.vehicle.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174180000	1773174300000	0	3	2026-03-10 20:27:50.112281
778	average.vehicle.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174180000	1773174300000	11.85183334350586	3	2026-03-10 20:27:50.112281
779	average.vehicle.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174180000	1773174300000	5.1388750076293945	4	2026-03-10 20:27:50.112281
780	average.vehicle.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174180000	1773174300000	4.938277721405029	9	2026-03-10 20:27:50.112281
781	average.vehicle.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174180000	1773174300000	4.861107349395752	14	2026-03-10 20:27:50.112281
782	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	0	2	2026-03-10 20:27:50.112281
783	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173520000	1773173640000	21.111099243164062	2	2026-03-10 20:27:50.112281
784	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173520000	1773173640000	0.833299994468689	1	2026-03-10 20:27:50.112281
785	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173520000	1773173640000	10.277799606323242	6	2026-03-10 20:27:50.112281
786	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173520000	1773173640000	8.0556001663208	8	2026-03-10 20:27:50.112281
787	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173520000	1773173640000	8.33329963684082	2	2026-03-10 20:27:50.112281
788	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173520000	1773173640000	6.6666998863220215	3	2026-03-10 20:27:50.112281
789	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173520000	1773173640000	13.888899803161621	2	2026-03-10 20:27:50.112281
790	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173520000	1773173640000	12.777799606323242	2	2026-03-10 20:27:50.112281
791	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173520000	1773173640000	8.0556001663208	1	2026-03-10 20:27:50.112281
792	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:27:50.112281
793	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173520000	1773173640000	10.5556001663208	6	2026-03-10 20:27:50.112281
794	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173520000	1773173640000	8.611100196838379	2	2026-03-10 20:27:50.112281
795	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173520000	1773173640000	11.111100196838379	2	2026-03-10 20:27:50.112281
796	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173520000	1773173640000	1.9443999528884888	2	2026-03-10 20:27:50.112281
797	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173520000	1773173640000	10.83329963684082	2	2026-03-10 20:27:50.112281
798	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:27:50.112281
799	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173520000	1773173640000	17.777799606323242	1	2026-03-10 20:27:50.112281
800	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173520000	1773173640000	11.66670036315918	5	2026-03-10 20:27:50.112281
801	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173520000	1773173640000	8.611100196838379	4	2026-03-10 20:27:50.112281
802	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173520000	1773173640000	8.888899803161621	4	2026-03-10 20:27:50.112281
803	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173520000	1773173640000	11.111100196838379	5	2026-03-10 20:27:50.112281
804	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173520000	1773173640000	7.2221999168396	2	2026-03-10 20:27:50.112281
805	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173520000	1773173640000	18.888900756835938	3	2026-03-10 20:27:50.112281
806	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173520000	1773173640000	8.888899803161621	1	2026-03-10 20:27:50.112281
807	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173520000	1773173640000	25.277799606323242	1	2026-03-10 20:27:50.112281
808	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:27:50.112281
809	max.vehicles.speed	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173520000	1773173640000	3.0555999279022217	1	2026-03-10 20:27:50.112281
810	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173520000	1773173640000	0	1	2026-03-10 20:27:50.112281
811	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173520000	1773173640000	8.888899803161621	2	2026-03-10 20:27:50.112281
812	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173580000	1773173700000	8.888899803161621	4	2026-03-10 20:27:50.112281
813	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	0	1	2026-03-10 20:27:50.112281
814	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173580000	1773173700000	13.888899803161621	4	2026-03-10 20:27:50.112281
815	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173580000	1773173700000	1.3889000415802002	2	2026-03-10 20:27:50.112281
816	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:27:50.112281
817	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173580000	1773173700000	21.111099243164062	4	2026-03-10 20:27:50.112281
818	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173580000	1773173700000	6.6666998863220215	5	2026-03-10 20:27:50.112281
819	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173580000	1773173700000	9.16670036315918	13	2026-03-10 20:27:50.112281
820	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173580000	1773173700000	10.5556001663208	12	2026-03-10 20:27:50.112281
821	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173580000	1773173700000	8.33329963684082	4	2026-03-10 20:27:50.112281
822	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173580000	1773173700000	10.83329963684082	4	2026-03-10 20:27:50.112281
823	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173580000	1773173700000	11.111100196838379	4	2026-03-10 20:27:50.112281
824	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173580000	1773173700000	10.5556001663208	12	2026-03-10 20:27:50.112281
825	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173580000	1773173700000	8.611100196838379	4	2026-03-10 20:27:50.112281
826	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173580000	1773173700000	12.777799606323242	4	2026-03-10 20:27:50.112281
827	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173580000	1773173700000	8.0556001663208	2	2026-03-10 20:27:50.112281
828	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:27:50.112281
829	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173580000	1773173700000	4.1666998863220215	4	2026-03-10 20:27:50.112281
830	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173580000	1773173700000	0	1	2026-03-10 20:27:50.112281
831	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173580000	1773173700000	18.888900756835938	6	2026-03-10 20:27:50.112281
832	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173580000	1773173700000	11.111100196838379	8	2026-03-10 20:27:50.112281
833	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173580000	1773173700000	8.611100196838379	8	2026-03-10 20:27:50.112281
834	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173580000	1773173700000	12.5	9	2026-03-10 20:27:50.112281
835	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173580000	1773173700000	17.777799606323242	2	2026-03-10 20:27:50.112281
836	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173580000	1773173700000	9.16670036315918	8	2026-03-10 20:27:50.112281
837	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173580000	1773173700000	14.722200393676758	4	2026-03-10 20:27:50.112281
838	max.vehicles.speed	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173580000	1773173700000	3.0555999279022217	1	2026-03-10 20:27:50.112281
839	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173580000	1773173700000	0	2	2026-03-10 20:27:50.121634
840	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173580000	1773173700000	25.277799606323242	2	2026-03-10 20:27:50.121634
841	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173580000	1773173700000	10	2	2026-03-10 20:27:50.121634
842	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173640000	1773173760000	12.222200393676758	3	2026-03-10 20:27:50.121634
843	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173640000	1773173760000	11.9443998336792	3	2026-03-10 20:27:50.121634
844	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173640000	1773173760000	5.2778000831604	3	2026-03-10 20:27:50.121634
845	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173640000	1773173760000	9.16670036315918	14	2026-03-10 20:27:50.121634
846	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173640000	1773173760000	0	1	2026-03-10 20:27:50.121634
847	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173640000	1773173760000	12.777799606323242	6	2026-03-10 20:27:50.121634
848	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173640000	1773173760000	6.6666998863220215	6	2026-03-10 20:27:50.121634
849	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173640000	1773173760000	4.1666998863220215	3	2026-03-10 20:27:50.121634
850	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173640000	1773173760000	13.33329963684082	6	2026-03-10 20:27:50.121634
851	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173640000	1773173760000	19.722200393676758	5	2026-03-10 20:27:50.121634
852	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173640000	1773173760000	20.555599212646484	5	2026-03-10 20:27:50.121634
853	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173640000	1773173760000	10.5556001663208	6	2026-03-10 20:27:50.121634
854	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173640000	1773173760000	16.388900756835938	5	2026-03-10 20:27:50.121634
855	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173640000	1773173760000	11.388899803161621	16	2026-03-10 20:27:50.121634
856	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173640000	1773173760000	7.5	5	2026-03-10 20:27:50.121634
857	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173640000	1773173760000	12.5	18	2026-03-10 20:27:50.121634
858	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173640000	1773173760000	11.111100196838379	6	2026-03-10 20:27:50.121634
859	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173640000	1773173760000	24.444400787353516	2	2026-03-10 20:27:50.121634
860	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173640000	1773173760000	9.722200393676758	3	2026-03-10 20:27:50.121634
861	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173640000	1773173760000	13.611100196838379	11	2026-03-10 20:27:50.121634
862	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173640000	1773173760000	12.222200393676758	8	2026-03-10 20:27:50.121634
863	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173640000	1773173760000	0	1	2026-03-10 20:27:50.121634
864	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173640000	1773173760000	4.1666998863220215	5	2026-03-10 20:27:50.121634
865	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173640000	1773173760000	8.33329963684082	10	2026-03-10 20:27:50.121634
866	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173640000	1773173760000	12.5	10	2026-03-10 20:27:50.121634
867	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173640000	1773173760000	0	2	2026-03-10 20:27:50.121634
868	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173640000	1773173760000	14.722200393676758	5	2026-03-10 20:27:50.121634
869	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173640000	1773173760000	10.277799606323242	12	2026-03-10 20:27:50.121634
870	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173700000	1773173820000	10.277799606323242	13	2026-03-10 20:27:50.121634
871	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173700000	1773173820000	7.2221999168396	6	2026-03-10 20:27:50.121634
872	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173700000	1773173820000	8.611100196838379	4	2026-03-10 20:27:50.121634
873	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173700000	1773173820000	11.9443998336792	4	2026-03-10 20:27:50.121634
874	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173700000	1773173820000	8.888899803161621	4	2026-03-10 20:27:50.121634
875	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173700000	1773173820000	12.222200393676758	4	2026-03-10 20:27:50.121634
876	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173700000	1773173820000	7.5	8	2026-03-10 20:27:50.121634
877	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	7.5	3	2026-03-10 20:27:50.121634
878	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173700000	1773173820000	10	20	2026-03-10 20:27:50.121634
879	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173700000	1773173820000	12.777799606323242	8	2026-03-10 20:27:50.121634
880	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173700000	1773173820000	11.388899803161621	18	2026-03-10 20:27:50.121634
881	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173700000	1773173820000	9.722200393676758	8	2026-03-10 20:27:50.121634
882	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173700000	1773173820000	24.444400787353516	6	2026-03-10 20:27:50.121634
883	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173700000	1773173820000	11.388899803161621	7	2026-03-10 20:27:50.121634
884	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	8.888899803161621	1	2026-03-10 20:27:50.121634
885	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173700000	1773173820000	19.722200393676758	7	2026-03-10 20:27:50.121634
886	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173700000	1773173820000	16.388900756835938	7	2026-03-10 20:27:50.121634
887	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173700000	1773173820000	7.7778000831604	6	2026-03-10 20:27:50.121634
888	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173700000	1773173820000	11.111100196838379	7	2026-03-10 20:27:50.121634
889	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173700000	1773173820000	13.611100196838379	9	2026-03-10 20:27:50.121634
890	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173700000	1773173820000	9.722200393676758	4	2026-03-10 20:27:50.121634
891	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173700000	1773173820000	26.388900756835938	3	2026-03-10 20:27:50.121634
892	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173700000	1773173820000	12.5	24	2026-03-10 20:27:50.121634
893	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173700000	1773173820000	18.33329963684082	8	2026-03-10 20:27:50.121634
894	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173700000	1773173820000	13.611100196838379	14	2026-03-10 20:27:50.121634
895	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173700000	1773173820000	6.111100196838379	3	2026-03-10 20:27:50.121634
896	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173700000	1773173820000	0	3	2026-03-10 20:27:50.121634
897	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173700000	1773173820000	9.4443998336792	11	2026-03-10 20:27:50.121634
898	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173700000	1773173820000	11.111100196838379	17	2026-03-10 20:27:50.121634
899	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173760000	1773173880000	11.111100196838379	18	2026-03-10 20:27:50.121634
900	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	8.888899803161621	3	2026-03-10 20:27:50.121634
901	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173760000	1773173880000	15.83329963684082	6	2026-03-10 20:27:50.121634
902	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	8.611100196838379	4	2026-03-10 20:27:50.121634
903	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173760000	1773173880000	8.33329963684082	7	2026-03-10 20:27:50.121634
904	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173760000	1773173880000	9.722200393676758	13	2026-03-10 20:27:50.121634
905	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173760000	1773173880000	8.0556001663208	8	2026-03-10 20:27:50.121634
906	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173760000	1773173880000	11.66670036315918	4	2026-03-10 20:27:50.121634
907	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173760000	1773173880000	8.888899803161621	4	2026-03-10 20:27:50.121634
908	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173760000	1773173880000	16.111099243164062	3	2026-03-10 20:27:50.121634
909	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173760000	1773173880000	16.66670036315918	4	2026-03-10 20:27:50.121634
910	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173760000	1773173880000	10	7	2026-03-10 20:27:50.121634
911	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173760000	1773173880000	9.722200393676758	8	2026-03-10 20:27:50.121634
912	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173760000	1773173880000	10.5556001663208	18	2026-03-10 20:27:50.121634
913	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173760000	1773173880000	10	23	2026-03-10 20:27:50.121634
914	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173760000	1773173880000	10.277799606323242	8	2026-03-10 20:27:50.121634
915	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173760000	1773173880000	26.944400787353516	7	2026-03-10 20:27:50.121634
916	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173760000	1773173880000	9.4443998336792	11	2026-03-10 20:27:50.121634
917	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173760000	1773173880000	10.83329963684082	24	2026-03-10 20:27:50.121634
918	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173760000	1773173880000	18.33329963684082	8	2026-03-10 20:27:50.121634
919	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173760000	1773173880000	16.66670036315918	4	2026-03-10 20:27:50.121634
920	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173760000	1773173880000	11.111100196838379	8	2026-03-10 20:27:50.121634
921	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173760000	1773173880000	6.6666998863220215	7	2026-03-10 20:27:50.121634
922	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173760000	1773173880000	18.33329963684082	8	2026-03-10 20:27:50.121634
923	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173760000	1773173880000	19.16670036315918	8	2026-03-10 20:27:50.121634
924	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173760000	1773173880000	26.388900756835938	4	2026-03-10 20:27:50.121634
925	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173760000	1773173880000	9.4443998336792	4	2026-03-10 20:27:50.121634
926	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173760000	1773173880000	8.888899803161621	4	2026-03-10 20:27:50.121634
927	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173760000	1773173880000	8.888899803161621	12	2026-03-10 20:27:50.121634
928	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173820000	1773173940000	7.2221999168396	7	2026-03-10 20:27:50.121634
929	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173820000	1773173940000	10	7	2026-03-10 20:27:50.121634
930	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173820000	1773173940000	12.222200393676758	4	2026-03-10 20:27:50.121634
931	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173820000	1773173940000	8.0556001663208	4	2026-03-10 20:27:50.121634
932	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173820000	1773173940000	7.2221999168396	4	2026-03-10 20:27:50.121634
933	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173820000	1773173940000	8.888899803161621	4	2026-03-10 20:27:50.121634
934	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173820000	1773173940000	8.33329963684082	15	2026-03-10 20:27:50.121634
935	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173820000	1773173940000	17.777799606323242	8	2026-03-10 20:27:50.121634
936	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173820000	1773173940000	10.83329963684082	7	2026-03-10 20:27:50.121634
937	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173820000	1773173940000	8.611100196838379	4	2026-03-10 20:27:50.121634
938	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173820000	1773173940000	9.722200393676758	13	2026-03-10 20:27:50.121634
939	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173820000	1773173940000	9.4443998336792	22	2026-03-10 20:27:50.212517
940	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173820000	1773173940000	8.611100196838379	7	2026-03-10 20:27:50.212517
941	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173820000	1773173940000	10	6	2026-03-10 20:27:50.212517
942	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173820000	1773173940000	16.111099243164062	3	2026-03-10 20:27:50.212517
943	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173820000	1773173940000	18.055599212646484	3	2026-03-10 20:27:50.212517
944	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173820000	1773173940000	10.5556001663208	19	2026-03-10 20:27:50.212517
945	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173820000	1773173940000	8.888899803161621	4	2026-03-10 20:27:50.212517
946	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173820000	1773173940000	18.33329963684082	8	2026-03-10 20:27:50.212517
947	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173820000	1773173940000	10.5556001663208	7	2026-03-10 20:27:50.212517
948	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173820000	1773173940000	10.83329963684082	23	2026-03-10 20:27:50.212517
949	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173820000	1773173940000	15.83329963684082	8	2026-03-10 20:27:50.212517
950	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173820000	1773173940000	10.83329963684082	13	2026-03-10 20:27:50.212517
951	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173820000	1773173940000	26.944400787353516	7	2026-03-10 20:27:50.212517
952	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173820000	1773173940000	16.66670036315918	4	2026-03-10 20:27:50.212517
953	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173820000	1773173940000	8.611100196838379	6	2026-03-10 20:27:50.212517
954	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173820000	1773173940000	12.222200393676758	4	2026-03-10 20:27:50.212517
955	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173820000	1773173940000	22.5	3	2026-03-10 20:27:50.212517
956	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173820000	1773173940000	19.16670036315918	8	2026-03-10 20:27:50.212517
957	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173880000	1773174000000	18.055599212646484	6	2026-03-10 20:27:50.212517
958	max.vehicles.speed	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173880000	1773174000000	18.055599212646484	1	2026-03-10 20:27:50.212517
959	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173880000	1773174000000	10.83329963684082	4	2026-03-10 20:27:50.212517
960	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173880000	1773174000000	10.5556001663208	5	2026-03-10 20:27:50.212517
961	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173880000	1773174000000	5.555600166320801	3	2026-03-10 20:27:50.212517
962	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173880000	1773174000000	17.777799606323242	6	2026-03-10 20:27:50.212517
963	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173880000	1773174000000	8.611100196838379	4	2026-03-10 20:27:50.212517
964	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173880000	1773174000000	8.611100196838379	3	2026-03-10 20:27:50.212517
965	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173880000	1773174000000	12.222200393676758	3	2026-03-10 20:27:50.212517
966	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173880000	1773174000000	8.0556001663208	3	2026-03-10 20:27:50.212517
967	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173880000	1773174000000	8.888899803161621	11	2026-03-10 20:27:50.212517
968	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173880000	1773174000000	5.2778000831604	3	2026-03-10 20:27:50.212517
969	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173880000	1773174000000	8.611100196838379	5	2026-03-10 20:27:50.212517
970	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173880000	1773174000000	10.277799606323242	16	2026-03-10 20:27:50.212517
971	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173880000	1773174000000	7.2221999168396	3	2026-03-10 20:27:50.212517
972	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173880000	1773174000000	8.611100196838379	9	2026-03-10 20:27:50.212517
973	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173880000	1773174000000	8.611100196838379	3	2026-03-10 20:27:50.212517
974	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173880000	1773174000000	22.5	1	2026-03-10 20:27:50.212517
975	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173880000	1773174000000	18.611099243164062	4	2026-03-10 20:27:50.212517
976	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173880000	1773174000000	11.66670036315918	17	2026-03-10 20:27:50.212517
977	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173880000	1773174000000	15.83329963684082	6	2026-03-10 20:27:50.212517
978	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173880000	1773174000000	9.4443998336792	6	2026-03-10 20:27:50.212517
979	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173880000	1773174000000	8.33329963684082	3	2026-03-10 20:27:50.212517
980	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173880000	1773174000000	12.777799606323242	14	2026-03-10 20:27:50.212517
981	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173880000	1773174000000	10.5556001663208	5	2026-03-10 20:27:50.212517
982	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173880000	1773174000000	10.83329963684082	11	2026-03-10 20:27:50.212517
983	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173880000	1773174000000	12.222200393676758	3	2026-03-10 20:27:50.212517
984	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173880000	1773174000000	8.611100196838379	4	2026-03-10 20:27:50.212517
985	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173880000	1773174000000	15.83329963684082	3	2026-03-10 20:27:50.212517
986	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173940000	1773174060000	14.16670036315918	3	2026-03-10 20:27:50.212517
987	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173940000	1773174060000	10.5556001663208	15	2026-03-10 20:27:50.212517
988	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173940000	1773174060000	10.83329963684082	8	2026-03-10 20:27:50.212517
989	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173940000	1773174060000	9.4443998336792	3	2026-03-10 20:27:50.212517
990	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173940000	1773174060000	17.222200393676758	8	2026-03-10 20:27:50.212517
991	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173940000	1773174060000	18.611099243164062	7	2026-03-10 20:27:50.212517
992	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173940000	1773174060000	11.388899803161621	7	2026-03-10 20:27:50.212517
993	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173940000	1773174060000	10	5	2026-03-10 20:27:50.212517
994	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173940000	1773174060000	8.33329963684082	4	2026-03-10 20:27:50.212517
995	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173940000	1773174060000	7.5	3	2026-03-10 20:27:50.212517
996	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173940000	1773174060000	8.33329963684082	7	2026-03-10 20:27:50.212517
997	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173940000	1773174060000	5.2778000831604	3	2026-03-10 20:27:50.212517
998	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173940000	1773174060000	13.611100196838379	4	2026-03-10 20:27:50.212517
999	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173940000	1773174060000	10.5556001663208	4	2026-03-10 20:27:50.212517
1000	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173940000	1773174060000	10	14	2026-03-10 20:27:50.212517
1001	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173940000	1773174060000	10.83329963684082	26	2026-03-10 20:27:50.212517
1002	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173940000	1773174060000	6.111100196838379	7	2026-03-10 20:27:50.212517
1003	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173940000	1773174060000	12.777799606323242	18	2026-03-10 20:27:50.212517
1004	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173940000	1773174060000	11.9443998336792	6	2026-03-10 20:27:50.212517
1005	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173940000	1773174060000	13.0556001663208	4	2026-03-10 20:27:50.212517
1006	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173940000	1773174060000	3.3333001136779785	2	2026-03-10 20:27:50.212517
1007	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173940000	1773174060000	10	4	2026-03-10 20:27:50.212517
1008	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173940000	1773174060000	11.66670036315918	21	2026-03-10 20:27:50.212517
1009	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173940000	1773174060000	15	8	2026-03-10 20:27:50.212517
1010	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173940000	1773174060000	7.5	4	2026-03-10 20:27:50.212517
1011	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173940000	1773174060000	8.33329963684082	3	2026-03-10 20:27:50.212517
1012	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173940000	1773174060000	11.111100196838379	10	2026-03-10 20:27:50.212517
1013	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173940000	1773174060000	8.33329963684082	8	2026-03-10 20:27:50.212517
1014	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174000000	1773174120000	8.33329963684082	8	2026-03-10 20:27:50.212517
1015	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174000000	1773174120000	10	14	2026-03-10 20:27:50.212517
1016	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174000000	1773174120000	11.388899803161621	7	2026-03-10 20:27:50.212517
1017	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174000000	1773174120000	18.611099243164062	3	2026-03-10 20:27:50.212517
1018	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174000000	1773174120000	18.611099243164062	7	2026-03-10 20:27:50.212517
1019	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174000000	1773174120000	15	8	2026-03-10 20:27:50.212517
1020	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773174000000	1773174120000	9.4443998336792	3	2026-03-10 20:27:50.212517
1021	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174000000	1773174120000	10.5556001663208	13	2026-03-10 20:27:50.212517
1022	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174000000	1773174120000	17.222200393676758	8	2026-03-10 20:27:50.212517
1023	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174000000	1773174120000	13.611100196838379	4	2026-03-10 20:27:50.212517
1024	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174000000	1773174120000	10.5556001663208	4	2026-03-10 20:27:50.212517
1025	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174000000	1773174120000	10.277799606323242	7	2026-03-10 20:27:50.212517
1026	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174000000	1773174120000	7.5	3	2026-03-10 20:27:50.212517
1027	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174000000	1773174120000	10	6	2026-03-10 20:27:50.212517
1028	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174000000	1773174120000	10.277799606323242	4	2026-03-10 20:27:50.212517
1029	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174000000	1773174120000	7.2221999168396	3	2026-03-10 20:27:50.212517
1030	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174000000	1773174120000	11.111100196838379	8	2026-03-10 20:27:50.212517
1031	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174000000	1773174120000	10	4	2026-03-10 20:27:50.212517
1032	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174000000	1773174120000	13.0556001663208	4	2026-03-10 20:27:50.212517
1033	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174000000	1773174120000	10.277799606323242	18	2026-03-10 20:27:50.212517
1034	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174000000	1773174120000	10.5556001663208	6	2026-03-10 20:27:50.212517
1035	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174000000	1773174120000	12.777799606323242	27	2026-03-10 20:27:50.212517
1036	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174000000	1773174120000	16.944400787353516	6	2026-03-10 20:27:50.212517
1037	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174000000	1773174120000	10.83329963684082	3	2026-03-10 20:27:50.212517
1038	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174000000	1773174120000	8.33329963684082	3	2026-03-10 20:27:50.212517
1039	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174000000	1773174120000	6.944399833679199	4	2026-03-10 20:27:50.22033
1040	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174000000	1773174120000	10.83329963684082	21	2026-03-10 20:27:50.22033
1041	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174000000	1773174120000	11.388899803161621	8	2026-03-10 20:27:50.22033
1042	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174060000	1773174180000	13.888899803161621	18	2026-03-10 20:27:50.22033
1043	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174060000	1773174180000	12.5	5	2026-03-10 20:27:50.22033
1044	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174060000	1773174180000	10.277799606323242	3	2026-03-10 20:27:50.22033
1045	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174060000	1773174180000	21.66670036315918	6	2026-03-10 20:27:50.22033
1046	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773174060000	1773174180000	8.33329963684082	2	2026-03-10 20:27:50.22033
1047	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174060000	1773174180000	10.5556001663208	6	2026-03-10 20:27:50.22033
1048	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174060000	1773174180000	9.16670036315918	6	2026-03-10 20:27:50.22033
1049	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174060000	1773174180000	8.0556001663208	6	2026-03-10 20:27:50.22033
1050	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174060000	1773174180000	9.16670036315918	12	2026-03-10 20:27:50.22033
1051	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174060000	1773174180000	18.611099243164062	3	2026-03-10 20:27:50.22033
1052	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174060000	1773174180000	11.111100196838379	6	2026-03-10 20:27:50.22033
1053	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174060000	1773174180000	10.277799606323242	6	2026-03-10 20:27:50.22033
1054	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174060000	1773174180000	13.611100196838379	3	2026-03-10 20:27:50.22033
1055	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174060000	1773174180000	9.722200393676758	3	2026-03-10 20:27:50.22033
1056	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174060000	1773174180000	6.6666998863220215	5	2026-03-10 20:27:50.22033
1057	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174060000	1773174180000	12.777799606323242	6	2026-03-10 20:27:50.22033
1058	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174060000	1773174180000	10.5556001663208	3	2026-03-10 20:27:50.22033
1059	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174060000	1773174180000	7.5	3	2026-03-10 20:27:50.22033
1060	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174060000	1773174180000	12.777799606323242	20	2026-03-10 20:27:50.22033
1061	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174060000	1773174180000	9.16670036315918	14	2026-03-10 20:27:50.22033
1062	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174060000	1773174180000	0	3	2026-03-10 20:27:50.22033
1063	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174060000	1773174180000	7.7778000831604	6	2026-03-10 20:27:50.22033
1064	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174060000	1773174180000	7.2221999168396	3	2026-03-10 20:27:50.22033
1065	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174060000	1773174180000	9.4443998336792	3	2026-03-10 20:27:50.22033
1066	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174060000	1773174180000	12.222200393676758	3	2026-03-10 20:27:50.22033
1067	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174060000	1773174180000	8.0556001663208	3	2026-03-10 20:27:50.22033
1068	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174060000	1773174180000	18.611099243164062	3	2026-03-10 20:27:50.22033
1069	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174060000	1773174180000	16.944400787353516	6	2026-03-10 20:27:50.22033
1070	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174120000	1773174240000	10.83329963684082	8	2026-03-10 20:27:50.22033
1071	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174120000	1773174240000	12.777799606323242	6	2026-03-10 20:27:50.22033
1072	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174120000	1773174240000	7.7778000831604	7	2026-03-10 20:27:50.22033
1073	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174120000	1773174240000	13.888899803161621	21	2026-03-10 20:27:50.22033
1074	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174120000	1773174240000	12.5	4	2026-03-10 20:27:50.22033
1075	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174120000	1773174240000	8.0556001663208	8	2026-03-10 20:27:50.22033
1076	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174120000	1773174240000	21.66670036315918	7	2026-03-10 20:27:50.22033
1077	max.vehicles.speed	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773174120000	1773174240000	8.33329963684082	1	2026-03-10 20:27:50.22033
1078	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174120000	1773174240000	7.5	3	2026-03-10 20:27:50.22033
1079	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174120000	1773174240000	10.5556001663208	7	2026-03-10 20:27:50.22033
1080	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174120000	1773174240000	10	7	2026-03-10 20:27:50.22033
1081	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174120000	1773174240000	10.277799606323242	6	2026-03-10 20:27:50.22033
1082	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174120000	1773174240000	14.4443998336792	8	2026-03-10 20:27:50.22033
1083	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174120000	1773174240000	9.16670036315918	13	2026-03-10 20:27:50.22033
1084	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174120000	1773174240000	21.111099243164062	4	2026-03-10 20:27:50.22033
1085	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174120000	1773174240000	10.5556001663208	4	2026-03-10 20:27:50.22033
1086	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174120000	1773174240000	9.722200393676758	4	2026-03-10 20:27:50.22033
1087	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174120000	1773174240000	20	3	2026-03-10 20:27:50.22033
1088	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174120000	1773174240000	8.33329963684082	3	2026-03-10 20:27:50.22033
1089	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174120000	1773174240000	0	4	2026-03-10 20:27:50.22033
1090	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174120000	1773174240000	10	21	2026-03-10 20:27:50.22033
1091	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174120000	1773174240000	10	3	2026-03-10 20:27:50.22033
1092	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174120000	1773174240000	10.5556001663208	4	2026-03-10 20:27:50.22033
1093	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174120000	1773174240000	11.388899803161621	16	2026-03-10 20:27:50.22033
1094	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174120000	1773174240000	6.6666998863220215	7	2026-03-10 20:27:50.22033
1095	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174120000	1773174240000	6.944399833679199	4	2026-03-10 20:27:50.22033
1096	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174120000	1773174240000	12.222200393676758	4	2026-03-10 20:27:50.22033
1097	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174120000	1773174240000	9.4443998336792	3	2026-03-10 20:27:50.22033
1098	max.vehicles.speed	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174180000	1773174300000	8.888899803161621	3	2026-03-10 20:27:50.22033
1099	max.vehicles.speed	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174180000	1773174300000	21.111099243164062	4	2026-03-10 20:27:50.22033
1100	max.vehicles.speed	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174180000	1773174300000	20.83329963684082	7	2026-03-10 20:27:50.22033
1101	max.vehicles.speed	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174180000	1773174300000	13.33329963684082	8	2026-03-10 20:27:50.22033
1102	max.vehicles.speed	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174180000	1773174300000	8.611100196838379	8	2026-03-10 20:27:50.22033
1103	max.vehicles.speed	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174180000	1773174300000	8.33329963684082	7	2026-03-10 20:27:50.22033
1104	max.vehicles.speed	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174180000	1773174300000	12.5	5	2026-03-10 20:27:50.22033
1105	max.vehicles.speed	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174180000	1773174300000	10.5556001663208	20	2026-03-10 20:27:50.22033
1106	max.vehicles.speed	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174180000	1773174300000	7.7778000831604	3	2026-03-10 20:27:50.22033
1107	max.vehicles.speed	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174180000	1773174300000	13.0556001663208	13	2026-03-10 20:27:50.22033
1108	max.vehicles.speed	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174180000	1773174300000	9.4443998336792	5	2026-03-10 20:27:50.22033
1109	max.vehicles.speed	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174180000	1773174300000	10	8	2026-03-10 20:27:50.22033
1110	max.vehicles.speed	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174180000	1773174300000	3.0555999279022217	2	2026-03-10 20:27:50.22033
1111	max.vehicles.speed	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174180000	1773174300000	12.222200393676758	7	2026-03-10 20:27:50.22033
1112	max.vehicles.speed	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174180000	1773174300000	14.4443998336792	7	2026-03-10 20:27:50.22033
1113	max.vehicles.speed	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174180000	1773174300000	0	4	2026-03-10 20:27:50.22033
1114	max.vehicles.speed	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174180000	1773174300000	10.277799606323242	3	2026-03-10 20:27:50.22033
1115	max.vehicles.speed	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174180000	1773174300000	10.5556001663208	17	2026-03-10 20:27:50.22033
1116	max.vehicles.speed	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174180000	1773174300000	9.16670036315918	2	2026-03-10 20:27:50.22033
1117	max.vehicles.speed	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174180000	1773174300000	22.5	3	2026-03-10 20:27:50.22033
1118	max.vehicles.speed	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174180000	1773174300000	9.16670036315918	4	2026-03-10 20:27:50.22033
1119	max.vehicles.speed	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174180000	1773174300000	11.9443998336792	4	2026-03-10 20:27:50.22033
1120	max.vehicles.speed	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174180000	1773174300000	0	3	2026-03-10 20:27:50.22033
1121	max.vehicles.speed	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174180000	1773174300000	13.33329963684082	3	2026-03-10 20:27:50.22033
1122	max.vehicles.speed	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174180000	1773174300000	8.33329963684082	4	2026-03-10 20:27:50.22033
1123	max.vehicles.speed	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174180000	1773174300000	12.777799606323242	9	2026-03-10 20:27:50.22033
1124	max.vehicles.speed	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174180000	1773174300000	11.66670036315918	14	2026-03-10 20:27:50.22033
1125	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:27:50.22033
1126	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:27:50.22033
1127	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173520000	1773173640000	1	1	2026-03-10 20:27:50.22033
1128	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173520000	1773173640000	6	6	2026-03-10 20:27:50.22033
1129	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173520000	1773173640000	8	8	2026-03-10 20:27:50.22033
1130	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173520000	1773173640000	2	2	2026-03-10 20:27:50.22033
1131	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173520000	1773173640000	3	3	2026-03-10 20:27:50.22033
1132	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173520000	1773173640000	2	2	2026-03-10 20:27:50.22033
1133	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:27:50.22033
1134	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:27:50.22033
1135	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:27:50.22033
1136	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173520000	1773173640000	6	6	2026-03-10 20:27:50.22033
1137	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:27:50.22033
1138	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173520000	1773173640000	2	2	2026-03-10 20:27:50.22033
1139	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173520000	1773173640000	2	2	2026-03-10 20:27:50.410916
1140	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:27:50.410916
1141	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:27:50.410916
1142	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:27:50.410916
1143	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173520000	1773173640000	5	5	2026-03-10 20:27:50.410916
1144	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173520000	1773173640000	4	4	2026-03-10 20:27:50.410916
1145	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173520000	1773173640000	4	4	2026-03-10 20:27:50.410916
1146	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173520000	1773173640000	5	5	2026-03-10 20:27:50.410916
1147	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:27:50.410916
1148	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173520000	1773173640000	3	3	2026-03-10 20:27:50.410916
1149	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:27:50.410916
1150	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:27:50.410916
1151	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:27:50.410916
1152	count.vehicle.active	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:27:50.410916
1153	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173520000	1773173640000	1	1	2026-03-10 20:27:50.410916
1154	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173520000	1773173640000	2	2	2026-03-10 20:27:50.410916
1155	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:27:50.410916
1156	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	1	1	2026-03-10 20:27:50.410916
1157	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173580000	1773173700000	2	4	2026-03-10 20:27:50.410916
1158	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173580000	1773173700000	1	2	2026-03-10 20:27:50.410916
1159	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173580000	1773173700000	2	2	2026-03-10 20:27:50.410916
1160	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:27:50.410916
1161	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173580000	1773173700000	3	5	2026-03-10 20:27:50.410916
1162	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173580000	1773173700000	8	13	2026-03-10 20:27:50.410916
1163	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173580000	1773173700000	6	12	2026-03-10 20:27:50.410916
1164	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173580000	1773173700000	2	4	2026-03-10 20:27:50.410916
1165	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:27:50.410916
1166	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173580000	1773173700000	2	4	2026-03-10 20:27:50.410916
1167	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173580000	1773173700000	6	12	2026-03-10 20:27:50.410916
1168	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:27:50.410916
1169	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:27:50.410916
1170	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:27:50.410916
1171	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:27:50.410916
1172	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173580000	1773173700000	2	4	2026-03-10 20:27:50.410916
1173	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173580000	1773173700000	1	1	2026-03-10 20:27:50.410916
1174	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173580000	1773173700000	3	6	2026-03-10 20:27:50.410916
1175	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173580000	1773173700000	5	8	2026-03-10 20:27:50.410916
1176	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173580000	1773173700000	4	8	2026-03-10 20:27:50.410916
1177	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173580000	1773173700000	5	9	2026-03-10 20:27:50.410916
1178	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:27:50.410916
1179	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173580000	1773173700000	4	8	2026-03-10 20:27:50.410916
1180	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173580000	1773173700000	2	4	2026-03-10 20:27:50.410916
1181	count.vehicle.active	rennes	star	6-0065	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	1773173580000	1773173700000	1	1	2026-03-10 20:27:50.410916
1182	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:27:50.410916
1183	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:27:50.410916
1184	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173580000	1773173700000	1	2	2026-03-10 20:27:50.410916
1185	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173640000	1773173760000	1	3	2026-03-10 20:27:50.410916
1186	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173640000	1773173760000	1	3	2026-03-10 20:27:50.410916
1187	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173640000	1773173760000	1	3	2026-03-10 20:27:50.410916
1188	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173640000	1773173760000	5	14	2026-03-10 20:27:50.410916
1189	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173640000	1773173760000	1	1	2026-03-10 20:27:50.410916
1190	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173640000	1773173760000	2	6	2026-03-10 20:27:50.410916
1191	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173640000	1773173760000	2	6	2026-03-10 20:27:50.410916
1192	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173640000	1773173760000	1	3	2026-03-10 20:27:50.410916
1193	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173640000	1773173760000	2	6	2026-03-10 20:27:50.410916
1194	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173640000	1773173760000	2	5	2026-03-10 20:27:50.410916
1195	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173640000	1773173760000	2	5	2026-03-10 20:27:50.410916
1196	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173640000	1773173760000	2	6	2026-03-10 20:27:50.410916
1197	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173640000	1773173760000	2	5	2026-03-10 20:27:50.410916
1198	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173640000	1773173760000	6	16	2026-03-10 20:27:50.410916
1199	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173640000	1773173760000	2	5	2026-03-10 20:27:50.410916
1200	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173640000	1773173760000	6	18	2026-03-10 20:27:50.410916
1201	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173640000	1773173760000	2	6	2026-03-10 20:27:50.410916
1202	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173640000	1773173760000	1	2	2026-03-10 20:27:50.410916
1203	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173640000	1773173760000	1	3	2026-03-10 20:27:50.410916
1204	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173640000	1773173760000	4	11	2026-03-10 20:27:50.410916
1205	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173640000	1773173760000	3	8	2026-03-10 20:27:50.410916
1206	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173640000	1773173760000	1	1	2026-03-10 20:27:50.410916
1207	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173640000	1773173760000	2	5	2026-03-10 20:27:50.410916
1208	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173640000	1773173760000	5	10	2026-03-10 20:27:50.410916
1209	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173640000	1773173760000	4	10	2026-03-10 20:27:50.410916
1210	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173640000	1773173760000	1	2	2026-03-10 20:27:50.410916
1211	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173640000	1773173760000	2	5	2026-03-10 20:27:50.410916
1212	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173640000	1773173760000	4	12	2026-03-10 20:27:50.410916
1213	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173700000	1773173820000	4	13	2026-03-10 20:27:50.410916
1214	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173700000	1773173820000	2	6	2026-03-10 20:27:50.410916
1215	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173700000	1773173820000	1	4	2026-03-10 20:27:50.410916
1216	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173700000	1773173820000	1	4	2026-03-10 20:27:50.410916
1217	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173700000	1773173820000	1	4	2026-03-10 20:27:50.410916
1218	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173700000	1773173820000	1	4	2026-03-10 20:27:50.410916
1219	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173700000	1773173820000	2	8	2026-03-10 20:27:50.410916
1220	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	1	3	2026-03-10 20:27:50.410916
1221	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173700000	1773173820000	6	20	2026-03-10 20:27:50.410916
1222	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173700000	1773173820000	2	8	2026-03-10 20:27:50.410916
1223	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173700000	1773173820000	5	18	2026-03-10 20:27:50.410916
1224	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173700000	1773173820000	2	8	2026-03-10 20:27:50.410916
1225	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173700000	1773173820000	2	6	2026-03-10 20:27:50.410916
1226	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173700000	1773173820000	2	7	2026-03-10 20:27:50.410916
1227	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173700000	1773173820000	1	1	2026-03-10 20:27:50.410916
1228	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173700000	1773173820000	2	7	2026-03-10 20:27:50.410916
1229	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173700000	1773173820000	2	7	2026-03-10 20:27:50.410916
1230	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173700000	1773173820000	2	6	2026-03-10 20:27:50.410916
1231	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173700000	1773173820000	2	7	2026-03-10 20:27:50.410916
1232	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173700000	1773173820000	3	9	2026-03-10 20:27:50.410916
1233	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173700000	1773173820000	1	4	2026-03-10 20:27:50.410916
1234	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173700000	1773173820000	1	3	2026-03-10 20:27:50.410916
1235	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173700000	1773173820000	6	24	2026-03-10 20:27:50.410916
1236	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173700000	1773173820000	2	8	2026-03-10 20:27:50.410916
1237	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173700000	1773173820000	4	14	2026-03-10 20:27:50.410916
1238	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173700000	1773173820000	1	3	2026-03-10 20:27:50.410916
1239	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173700000	1773173820000	1	3	2026-03-10 20:27:50.509943
1240	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173700000	1773173820000	3	11	2026-03-10 20:27:50.509943
1241	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173700000	1773173820000	5	17	2026-03-10 20:27:50.509943
1242	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173760000	1773173880000	5	18	2026-03-10 20:27:50.509943
1243	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	1	3	2026-03-10 20:27:50.509943
1244	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173760000	1773173880000	2	6	2026-03-10 20:27:50.509943
1245	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:27:50.509943
1246	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173760000	1773173880000	2	7	2026-03-10 20:27:50.509943
1247	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173760000	1773173880000	4	13	2026-03-10 20:27:50.509943
1248	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173760000	1773173880000	2	8	2026-03-10 20:27:50.509943
1249	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:27:50.509943
1250	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:27:50.509943
1251	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173760000	1773173880000	1	3	2026-03-10 20:27:50.509943
1252	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:27:50.509943
1253	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173760000	1773173880000	2	7	2026-03-10 20:27:50.509943
1254	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173760000	1773173880000	2	8	2026-03-10 20:27:50.509943
1255	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173760000	1773173880000	5	18	2026-03-10 20:27:50.509943
1256	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173760000	1773173880000	6	23	2026-03-10 20:27:50.509943
1257	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173760000	1773173880000	2	8	2026-03-10 20:27:50.509943
1258	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173760000	1773173880000	2	7	2026-03-10 20:27:50.509943
1259	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173760000	1773173880000	3	11	2026-03-10 20:27:50.509943
1260	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173760000	1773173880000	6	24	2026-03-10 20:27:50.509943
1261	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173760000	1773173880000	2	8	2026-03-10 20:27:50.509943
1262	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:27:50.509943
1263	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173760000	1773173880000	2	8	2026-03-10 20:27:50.509943
1264	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173760000	1773173880000	2	7	2026-03-10 20:27:50.509943
1265	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173760000	1773173880000	2	8	2026-03-10 20:27:50.509943
1266	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173760000	1773173880000	2	8	2026-03-10 20:27:50.509943
1267	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:27:50.509943
1268	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:27:50.509943
1269	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173760000	1773173880000	1	4	2026-03-10 20:27:50.509943
1270	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173760000	1773173880000	4	12	2026-03-10 20:27:50.509943
1271	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173820000	1773173940000	3	7	2026-03-10 20:27:50.509943
1272	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173820000	1773173940000	2	7	2026-03-10 20:27:50.509943
1273	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173820000	1773173940000	1	4	2026-03-10 20:27:50.509943
1274	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173820000	1773173940000	1	4	2026-03-10 20:27:50.509943
1275	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173820000	1773173940000	2	4	2026-03-10 20:27:50.509943
1276	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173820000	1773173940000	1	4	2026-03-10 20:27:50.509943
1277	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173820000	1773173940000	4	15	2026-03-10 20:27:50.509943
1278	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173820000	1773173940000	2	8	2026-03-10 20:27:50.509943
1279	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173820000	1773173940000	2	7	2026-03-10 20:27:50.509943
1280	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173820000	1773173940000	1	4	2026-03-10 20:27:50.509943
1281	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173820000	1773173940000	4	13	2026-03-10 20:27:50.509943
1282	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173820000	1773173940000	6	22	2026-03-10 20:27:50.509943
1283	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173820000	1773173940000	2	7	2026-03-10 20:27:50.509943
1284	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173820000	1773173940000	2	6	2026-03-10 20:27:50.509943
1285	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173820000	1773173940000	1	3	2026-03-10 20:27:50.509943
1286	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173820000	1773173940000	1	3	2026-03-10 20:27:50.509943
1287	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173820000	1773173940000	5	19	2026-03-10 20:27:50.509943
1288	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173820000	1773173940000	1	4	2026-03-10 20:27:50.509943
1289	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173820000	1773173940000	2	8	2026-03-10 20:27:50.509943
1290	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173820000	1773173940000	2	7	2026-03-10 20:27:50.509943
1291	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173820000	1773173940000	6	23	2026-03-10 20:27:50.509943
1292	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173820000	1773173940000	2	8	2026-03-10 20:27:50.509943
1293	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173820000	1773173940000	4	13	2026-03-10 20:27:50.509943
1294	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173820000	1773173940000	2	7	2026-03-10 20:27:50.509943
1295	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173820000	1773173940000	1	4	2026-03-10 20:27:50.509943
1296	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173820000	1773173940000	2	6	2026-03-10 20:27:50.509943
1297	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173820000	1773173940000	1	4	2026-03-10 20:27:50.509943
1298	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173820000	1773173940000	1	3	2026-03-10 20:27:50.509943
1299	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173820000	1773173940000	2	8	2026-03-10 20:27:50.509943
1300	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173880000	1773174000000	2	6	2026-03-10 20:27:50.509943
1301	count.vehicle.active	rennes	star	6-0067	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	1773173880000	1773174000000	1	1	2026-03-10 20:27:50.509943
1302	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173880000	1773174000000	2	4	2026-03-10 20:27:50.509943
1303	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173880000	1773174000000	2	5	2026-03-10 20:27:50.509943
1304	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173880000	1773174000000	1	3	2026-03-10 20:27:50.509943
1305	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173880000	1773174000000	2	6	2026-03-10 20:27:50.509943
1306	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173880000	1773174000000	2	4	2026-03-10 20:27:50.509943
1307	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173880000	1773174000000	1	3	2026-03-10 20:27:50.509943
1308	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173880000	1773174000000	1	3	2026-03-10 20:27:50.509943
1309	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173880000	1773174000000	1	3	2026-03-10 20:27:50.509943
1310	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173880000	1773174000000	4	11	2026-03-10 20:27:50.509943
1311	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173880000	1773174000000	1	3	2026-03-10 20:27:50.509943
1312	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173880000	1773174000000	2	5	2026-03-10 20:27:50.509943
1313	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173880000	1773174000000	6	16	2026-03-10 20:27:50.509943
1314	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173880000	1773174000000	1	3	2026-03-10 20:27:50.509943
1315	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173880000	1773174000000	4	9	2026-03-10 20:27:50.509943
1316	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173880000	1773174000000	1	3	2026-03-10 20:27:50.509943
1317	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173880000	1773174000000	1	1	2026-03-10 20:27:50.509943
1318	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173880000	1773174000000	2	4	2026-03-10 20:27:50.509943
1319	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173880000	1773174000000	6	17	2026-03-10 20:27:50.509943
1320	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173880000	1773174000000	2	6	2026-03-10 20:27:50.509943
1321	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173880000	1773174000000	2	6	2026-03-10 20:27:50.509943
1322	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173880000	1773174000000	1	3	2026-03-10 20:27:50.509943
1323	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173880000	1773174000000	5	14	2026-03-10 20:27:50.509943
1324	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173880000	1773174000000	2	5	2026-03-10 20:27:50.509943
1325	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173880000	1773174000000	4	11	2026-03-10 20:27:50.509943
1326	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173880000	1773174000000	1	3	2026-03-10 20:27:50.509943
1327	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173880000	1773174000000	2	4	2026-03-10 20:27:50.509943
1328	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173880000	1773174000000	1	3	2026-03-10 20:27:50.509943
1329	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773173940000	1773174060000	1	3	2026-03-10 20:27:50.509943
1330	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773173940000	1773174060000	4	15	2026-03-10 20:27:50.509943
1331	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173940000	1773174060000	2	8	2026-03-10 20:27:50.509943
1332	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773173940000	1773174060000	1	3	2026-03-10 20:27:50.509943
1333	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773173940000	1773174060000	2	8	2026-03-10 20:27:50.509943
1334	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773173940000	1773174060000	2	7	2026-03-10 20:27:50.509943
1335	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773173940000	1773174060000	2	7	2026-03-10 20:27:50.509943
1336	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773173940000	1773174060000	2	5	2026-03-10 20:27:50.509943
1337	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773173940000	1773174060000	1	4	2026-03-10 20:27:50.509943
1338	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773173940000	1773174060000	1	3	2026-03-10 20:27:50.509943
1339	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773173940000	1773174060000	2	7	2026-03-10 20:27:50.515134
1340	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773173940000	1773174060000	1	3	2026-03-10 20:27:50.515134
1341	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773173940000	1773174060000	1	4	2026-03-10 20:27:50.515134
1342	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773173940000	1773174060000	1	4	2026-03-10 20:27:50.515134
1343	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773173940000	1773174060000	4	14	2026-03-10 20:27:50.515134
1344	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773173940000	1773174060000	7	26	2026-03-10 20:27:50.515134
1345	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773173940000	1773174060000	2	7	2026-03-10 20:27:50.515134
1346	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773173940000	1773174060000	5	18	2026-03-10 20:27:50.515134
1347	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773173940000	1773174060000	2	6	2026-03-10 20:27:50.515134
1348	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773173940000	1773174060000	1	4	2026-03-10 20:27:50.515134
1349	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773173940000	1773174060000	1	2	2026-03-10 20:27:50.515134
1350	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773173940000	1773174060000	1	4	2026-03-10 20:27:50.515134
1351	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773173940000	1773174060000	6	21	2026-03-10 20:27:50.515134
1352	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773173940000	1773174060000	2	8	2026-03-10 20:27:50.515134
1353	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773173940000	1773174060000	1	4	2026-03-10 20:27:50.515134
1354	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773173940000	1773174060000	1	3	2026-03-10 20:27:50.515134
1355	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773173940000	1773174060000	4	10	2026-03-10 20:27:50.515134
1356	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773173940000	1773174060000	2	8	2026-03-10 20:27:50.515134
1357	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174000000	1773174120000	2	8	2026-03-10 20:27:50.515134
1358	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174000000	1773174120000	4	14	2026-03-10 20:27:50.515134
1359	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174000000	1773174120000	2	7	2026-03-10 20:27:50.515134
1360	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174000000	1773174120000	1	3	2026-03-10 20:27:50.515134
1361	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174000000	1773174120000	2	7	2026-03-10 20:27:50.515134
1362	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174000000	1773174120000	2	8	2026-03-10 20:27:50.515134
1363	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773174000000	1773174120000	1	3	2026-03-10 20:27:50.515134
1364	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174000000	1773174120000	4	13	2026-03-10 20:27:50.515134
1365	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174000000	1773174120000	2	8	2026-03-10 20:27:50.515134
1366	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174000000	1773174120000	1	4	2026-03-10 20:27:50.515134
1367	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174000000	1773174120000	1	4	2026-03-10 20:27:50.515134
1368	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174000000	1773174120000	2	7	2026-03-10 20:27:50.515134
1369	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174000000	1773174120000	1	3	2026-03-10 20:27:50.515134
1370	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174000000	1773174120000	2	6	2026-03-10 20:27:50.515134
1371	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174000000	1773174120000	1	4	2026-03-10 20:27:50.515134
1372	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174000000	1773174120000	1	3	2026-03-10 20:27:50.515134
1373	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174000000	1773174120000	3	8	2026-03-10 20:27:50.515134
1374	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174000000	1773174120000	2	4	2026-03-10 20:27:50.515134
1375	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174000000	1773174120000	1	4	2026-03-10 20:27:50.515134
1376	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174000000	1773174120000	5	18	2026-03-10 20:27:50.515134
1377	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174000000	1773174120000	2	6	2026-03-10 20:27:50.515134
1378	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174000000	1773174120000	7	27	2026-03-10 20:27:50.515134
1379	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174000000	1773174120000	2	6	2026-03-10 20:27:50.515134
1380	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174000000	1773174120000	1	3	2026-03-10 20:27:50.515134
1381	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174000000	1773174120000	1	3	2026-03-10 20:27:50.515134
1382	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174000000	1773174120000	1	4	2026-03-10 20:27:50.515134
1383	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174000000	1773174120000	6	21	2026-03-10 20:27:50.515134
1384	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174000000	1773174120000	2	8	2026-03-10 20:27:50.515134
1385	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174060000	1773174180000	6	18	2026-03-10 20:27:50.515134
1386	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174060000	1773174180000	2	5	2026-03-10 20:27:50.515134
1387	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1388	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174060000	1773174180000	2	6	2026-03-10 20:27:50.515134
1389	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773174060000	1773174180000	1	2	2026-03-10 20:27:50.515134
1390	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174060000	1773174180000	2	6	2026-03-10 20:27:50.515134
1391	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174060000	1773174180000	2	6	2026-03-10 20:27:50.515134
1392	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174060000	1773174180000	2	6	2026-03-10 20:27:50.515134
1393	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174060000	1773174180000	4	12	2026-03-10 20:27:50.515134
1394	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1395	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174060000	1773174180000	2	6	2026-03-10 20:27:50.515134
1396	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174060000	1773174180000	2	6	2026-03-10 20:27:50.515134
1397	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1398	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1399	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174060000	1773174180000	2	5	2026-03-10 20:27:50.515134
1400	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174060000	1773174180000	2	6	2026-03-10 20:27:50.515134
1401	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1402	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1403	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174060000	1773174180000	10	20	2026-03-10 20:27:50.515134
1404	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174060000	1773174180000	5	14	2026-03-10 20:27:50.515134
1405	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1406	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174060000	1773174180000	2	6	2026-03-10 20:27:50.515134
1407	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1408	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1409	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1410	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1411	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174060000	1773174180000	1	3	2026-03-10 20:27:50.515134
1412	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174060000	1773174180000	2	6	2026-03-10 20:27:50.515134
1413	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174120000	1773174240000	2	8	2026-03-10 20:27:50.515134
1414	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174120000	1773174240000	2	6	2026-03-10 20:27:50.515134
1415	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174120000	1773174240000	2	7	2026-03-10 20:27:50.515134
1416	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174120000	1773174240000	6	21	2026-03-10 20:27:50.515134
1417	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174120000	1773174240000	2	4	2026-03-10 20:27:50.515134
1418	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174120000	1773174240000	2	8	2026-03-10 20:27:50.515134
1419	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174120000	1773174240000	2	7	2026-03-10 20:27:50.515134
1420	count.vehicle.active	rennes	star	6-0074	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	1773174120000	1773174240000	1	1	2026-03-10 20:27:50.515134
1421	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174120000	1773174240000	1	3	2026-03-10 20:27:50.515134
1422	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174120000	1773174240000	2	7	2026-03-10 20:27:50.515134
1423	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174120000	1773174240000	2	7	2026-03-10 20:27:50.515134
1424	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174120000	1773174240000	2	6	2026-03-10 20:27:50.515134
1425	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174120000	1773174240000	2	8	2026-03-10 20:27:50.515134
1426	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174120000	1773174240000	4	13	2026-03-10 20:27:50.515134
1427	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174120000	1773174240000	1	4	2026-03-10 20:27:50.515134
1428	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174120000	1773174240000	1	4	2026-03-10 20:27:50.515134
1429	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174120000	1773174240000	1	4	2026-03-10 20:27:50.515134
1430	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174120000	1773174240000	1	3	2026-03-10 20:27:50.515134
1431	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174120000	1773174240000	1	3	2026-03-10 20:27:50.515134
1432	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174120000	1773174240000	1	4	2026-03-10 20:27:50.515134
1433	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174120000	1773174240000	9	21	2026-03-10 20:27:50.515134
1434	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174120000	1773174240000	1	3	2026-03-10 20:27:50.515134
1435	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174120000	1773174240000	1	4	2026-03-10 20:27:50.515134
1436	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174120000	1773174240000	5	16	2026-03-10 20:27:50.515134
1437	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174120000	1773174240000	2	7	2026-03-10 20:27:50.515134
1438	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174120000	1773174240000	1	4	2026-03-10 20:27:50.515134
1439	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174120000	1773174240000	1	4	2026-03-10 20:27:50.916815
1440	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174120000	1773174240000	1	3	2026-03-10 20:27:50.916815
1441	count.vehicle.active	rennes	star	6-0052	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	1773174180000	1773174300000	1	3	2026-03-10 20:27:50.916815
1442	count.vehicle.active	rennes	star	6-0068	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	1773174180000	1773174300000	1	4	2026-03-10 20:27:50.916815
1443	count.vehicle.active	rennes	star	6-0064	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174180000	1773174300000	2	7	2026-03-10 20:27:50.916815
1444	count.vehicle.active	rennes	star	6-0054	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	1773174180000	1773174300000	2	8	2026-03-10 20:27:50.916815
1445	count.vehicle.active	rennes	star	6-0053	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	1773174180000	1773174300000	2	8	2026-03-10 20:27:50.916815
1446	count.vehicle.active	rennes	star	6-0072	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	1773174180000	1773174300000	2	7	2026-03-10 20:27:50.916815
1447	count.vehicle.active	rennes	star	6-0055	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	1773174180000	1773174300000	2	5	2026-03-10 20:27:50.916815
1448	count.vehicle.active	rennes	star	6-0006	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	1773174180000	1773174300000	6	20	2026-03-10 20:27:50.916815
1449	count.vehicle.active	rennes	star	6-0061	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	1773174180000	1773174300000	1	3	2026-03-10 20:27:50.916815
1450	count.vehicle.active	rennes	star	6-0002	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	1773174180000	1773174300000	5	13	2026-03-10 20:27:50.916815
1451	count.vehicle.active	rennes	star	6-0010	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	1773174180000	1773174300000	2	5	2026-03-10 20:27:50.916815
1452	count.vehicle.active	rennes	star	6-0014	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	1773174180000	1773174300000	2	8	2026-03-10 20:27:50.916815
1453	count.vehicle.active	rennes	star	6-0012	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	1773174180000	1773174300000	1	2	2026-03-10 20:27:50.916815
1454	count.vehicle.active	rennes	star	6-0003	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	1773174180000	1773174300000	2	7	2026-03-10 20:27:50.916815
1455	count.vehicle.active	rennes	star	6-0011	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	1773174180000	1773174300000	2	7	2026-03-10 20:27:50.916815
1456	count.vehicle.active	rennes	star	6-0059	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	1773174180000	1773174300000	1	4	2026-03-10 20:27:50.916815
1457	count.vehicle.active	rennes	star	6-0050	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	1773174180000	1773174300000	1	3	2026-03-10 20:27:50.916815
1458	count.vehicle.active	rennes	star	6-0004	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	1773174180000	1773174300000	7	17	2026-03-10 20:27:50.916815
1459	count.vehicle.active	rennes	star	6-0013	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	1773174180000	1773174300000	1	2	2026-03-10 20:27:50.916815
1460	count.vehicle.active	rennes	star	6-0081	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	1773174180000	1773174300000	1	3	2026-03-10 20:27:50.916815
1461	count.vehicle.active	rennes	star	6-0056	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	1773174180000	1773174300000	1	4	2026-03-10 20:27:50.916815
1462	count.vehicle.active	rennes	star	6-0077	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	1773174180000	1773174300000	1	4	2026-03-10 20:27:50.916815
1463	count.vehicle.active	rennes	star	6-0007	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	1773174180000	1773174300000	2	3	2026-03-10 20:27:50.916815
1464	count.vehicle.active	rennes	star	6-0051	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	1773174180000	1773174300000	1	3	2026-03-10 20:27:50.916815
1465	count.vehicle.active	rennes	star	6-0062	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	1773174180000	1773174300000	1	4	2026-03-10 20:27:50.916815
1466	count.vehicle.active	rennes	star	6-0005	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	1773174180000	1773174300000	3	9	2026-03-10 20:27:50.916815
1467	count.vehicle.active	rennes	star	6-0001	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	1773174180000	1773174300000	5	14	2026-03-10 20:27:50.916815
\.


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: kakarott
--

COPY public.routes (id, route_id, agency_id, route_short_name, route_long_name, route_desc, route_type, route_url, route_color, route_text_color, route_sort_order, _source_city, _source_transport, _updated_at) FROM stdin;
1	1	1	1	Lianes 1	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
2	2	1	2	Lianes 2	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
3	4	1	4	Lianes 4	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
4	5	1	5	Lianes 5	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
5	7	1	7	Lianes 7	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
6	8	1	8	Lianes 8	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
7	9	1	9	Lianes 9	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
8	15	1	15	Lianes 15	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
9	16	1	16	Lianes 16	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
10	17	1	17	Navette Nuit Verte	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
11	18	1	18	Navette Stade Atlantique	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
12	20	1	20	Principale 20	\N	3	\N	00A98B	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
13	21	1	21	Principale 21	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
14	22	1	22	Principale 22	\N	3	\N	00A98B	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
15	23	1	23	Principale 23	\N	3	\N	00A98B	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
16	24	1	24	Principale 24	\N	3	\N	00A98B	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
17	25	1	25	Principale 25	\N	3	\N	00A98B	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
18	26	1	26	Principale 26	\N	3	\N	00A98B	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
19	27	1	27	Principale 27	\N	3	\N	00A98B	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
20	28	1	28	Principale 28	\N	3	\N	00A98B	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
21	29	1	29	Principale 29	\N	3	\N	00A98B	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
22	30	1	30	Locale 30	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
23	31	1	31	Lianes 31	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
24	32	1	32	Locale 32	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
25	33	1	33	Locale 33	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
26	34	1	34	Locale 34	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
27	35	1	35	Lianes 35	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
28	37	1	37	Locale 37	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
29	38	1	38	Locale 38	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
30	439	1	39 Est	Ligne 39 Est	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
31	39	1	39	Lianes 39	\N	3	\N	00B1EB	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
32	51	1	51	Directe 51	\N	3	\N	4A4A49	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
33	52	1	52	Directe 52	\N	3	\N	4A4A49	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
34	53	1	53	Directe 53	\N	3	\N	4A4A49	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
35	454	1	54	Directe 54	\N	3	\N	4A4A49	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
36	55	1	55	Directe 55	\N	3	\N	4A4A49	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
37	57	1	57	Directe 57	\N	3	\N	4A4A49	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
38	460	1	60	Locale 60	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
39	461	1	61	Locale 61	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
40	64	1	64	Locale 64	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
41	65	1	65	Locale 65	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
42	66	1	66	Locale 66	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
43	67	1	67	Locale 67	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
44	469	1	69	Locale 69	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
45	70	1	70	Locale 70	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
46	71	1	71	Locale 71	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
47	72	1	72	Locale 72	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
48	73	1	73	Locale 73	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
49	74	1	74	Locale 74	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
50	75	1	75	Locale 75	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
51	76	1	76	Locale 76	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
52	77	1	77	Locale 77	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
53	78	1	78	Locale 78	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
54	79	1	79	Locale 79	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
55	80	1	80	Locale 80	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
56	81	1	81	Locale 81	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
57	82	1	82	Locale 82	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
58	83	1	83	Locale 83	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
59	84	1	84	Locale 84	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
60	85	1	85	Locale 85	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
61	87	1	87	Locale 87	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
62	89	1	89	Locale 89	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
63	90	1	90	Locale 90	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
64	97	1	97	Ligne 97 (HLP)	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
65	100	1	100	Navette Tram 100	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
66	101	1	101	Navette Tram 101	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
67	102	1	102	Navette Tram 102	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
68	103	1	103	Navette Tram 103	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
69	104	1	104	Navette Tram 104	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
70	105	1	105	Navette Tram 105	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
71	106	1	106	Navette Tram 106	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
72	107	1	107	Navette Tram 107	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
73	108	1	108	Navette Tram 108	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
74	109	1	109	Navette Tram 109	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
75	110	1	110	Navette Tram 110	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
76	111	1	111	Navette Tram 111	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
77	112	1	112	Navette Tram 112	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
78	113	1	113	Navette Tram 113	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
79	114	1	114	Navette Tram 114	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
80	115	1	115	Navette Tram 115	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
81	116	1	116	Navette Tram 116	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
82	117	1	117	Navette Tram 117	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
83	118	1	118	Navette Tram 118	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
84	119	1	119	Navette Tram 119	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
85	120	1	120	Navette Tram 120	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
86	121	1	121	Navette Tram 121	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
87	122	1	122	Navette Tram 122	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
88	123	1	123	Navette Tram 123	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
89	124	1	124	Navette Tram 124	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
90	125	1	125	Navette Tram 125	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
91	126	1	126	Navette Tram 126	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
92	159	1	159	Bus Relais A	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
93	160	1	160	Bus Relais B	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
94	161	1	161	Bus Relais C	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
95	162	1	162	Bus Relais D	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
96	200	1	200	Navette Tram 200	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
97	201	1	201	Navette Tram 201	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
98	202	1	202	Navette Tram 202	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
99	203	1	203	Navette Tram 203	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
100	204	1	204	Navette Tram 204	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
101	205	1	205	Navette Tram 205	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
102	206	1	206	Navette Tram 206	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
103	207	1	207	Navette Tram 207	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
104	208	1	208	Navette Tram 208	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
105	209	1	209	Navette Tram 209	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
106	210	1	210	Navette Tram 210	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
107	211	1	211	Navette Tram 211	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
108	212	1	212	Navette Tram 212	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
109	213	1	213	Navette Tram 213	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
110	214	1	214	Navette Tram 214	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
111	215	1	215	Navette Tram 215	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
112	216	1	216	Navette Tram 216	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
113	217	1	217	Navette Tram 217	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
114	218	1	218	Navette Tram 218	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
115	299	1	299	NAVETTE STADE TRAM B	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
116	300	1	300	Navette Tram 300	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
117	301	1	301	Navette Tram 301	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
118	302	1	302	Navette Tram 302	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
119	303	1	303	Navette Tram 303	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
120	304	1	304	Navette Tram 304	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
121	305	1	305	Navette Tram 305	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
122	306	1	306	Navette Tram 306	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
123	307	1	307	Navette Tram 307	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
124	308	1	308	Navette Tram 308	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
125	400	1	400	Navette Tram 400	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
126	401	1	401	Navette Tram 401	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
127	402	1	402	Navette Tram 402	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
128	403	1	403	Navette Tram 403	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
129	404	1	404	Navette Tram 404	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
130	405	1	405	Navette Tram 405	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
131	406	1	406	Navette Tram 406	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
132	760	1	760	Bus Relais B	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
133	761	1	761	Bus relais C	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
134	762	1	762	Bus Relais D	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
135	763	1	763	Bus Relais E	\N	3	\N	\N	\N	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
136	951	1	951	LE BATO 1	\N	4	\N	006BB5	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
137	952	1	952	LE BATO 2	\N	4	\N	006BB5	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
138	953	1	953	LE BATO 3	\N	4	\N	006BB5	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
139	19	1	Arena	Navette Arena	\N	3	\N	CD117E	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
140	568	1	Artigues	Flex' Artigues	\N	3	\N	76B82A	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
141	59	1	A	Tram A	\N	0	\N	831F82	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
142	60	1	B	Tram B	\N	0	\N	E50040	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
143	61	1	C	Tram C	\N	0	\N	D35098	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
144	62	1	D	Tram D	\N	0	\N	9262A3	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
145	163	1	E	Tram E	\N	0	\N	967651	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
146	164	1	F	Tram F	\N	0	\N	F08700	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
147	901	1	G	BUS EXPRESS G	\N	3	\N	006685	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
148	911	1	H1	BUS EXPRESS H1	\N	3	\N	006685	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
149	912	1	H2	BUS EXPRESS H2	\N	3	\N	006685	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
150	501	1	N1	Flex'Night 1	\N	3	\N	0C324C	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
151	502	1	N2	Flex'Night 2	\N	3	\N	0C324C	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
152	503	1	N3	Flex'Night 3	\N	3	\N	0C324C	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
153	504	1	N4	Flex'Night 4	\N	3	\N	0C324C	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
154	505	1	N5	Flex'Night 5	\N	3	\N	0C324C	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
155	506	1	N6	Flex'Night 6	\N	3	\N	0C324C	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
156	507	1	N7	Flex'Night 7	\N	3	\N	0C324C	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
157	810	1	S10	SCODI S10	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
158	811	1	S11	SCODI S11	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
159	813	1	S13	SCODI S13	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
160	814	1	S14	SCODI S14	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
161	815	1	S15	SCODI S15	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
162	816	1	S16	SCODI S16	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
163	817	1	S17	SCODI S17	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
164	801	1	S1	SCODI S01	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
165	820	1	S20	SCODI S20	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
166	821	1	S21	SCODI S21	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
167	822	1	S22	SCODI S22	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
168	824	1	S24	SCODI S24	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
169	825	1	S25	SCODI S25	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
170	826	1	S26	SCODI S26	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
171	827	1	S27	SCODI S27	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
172	828	1	S28	SCODI S28	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
173	829	1	S29	SCODI S29	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
174	802	1	S2	SCODI S02	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
175	830	1	S30	SCODI S30	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
176	833	1	S33	SCODI S33	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
177	834	1	S34	SCODI S34	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
178	835	1	S35	SCODI S35	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
179	836	1	S36	SCODI S36	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
180	837	1	S37	SCODI S37	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
181	838	1	S38	SCODI S38	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
182	839	1	S39	SCODI S39	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
183	803	1	S3	SCODI S03	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
184	840	1	S40	SCODI S40	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
185	842	1	S42	SCODI S42	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
186	843	1	S43	SCODI S43	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
187	844	1	S44	SCODI S44	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
188	845	1	S45	SCODI S45	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
189	846	1	S46	SCODI S46	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
190	847	1	S47	SCODI S47	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
191	848	1	S48	SCODI S48	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
192	849	1	S49	SCODI S49	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
193	804	1	S4	SCODI S04	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
194	853	1	S53	SCODI S53	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
195	854	1	S54	SCODI S54	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
196	855	1	S55	SCODI S55	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
197	856	1	S56	SCODI S56	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
198	858	1	S58	SCODI S58	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
199	859	1	S59	SCODI S59	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
200	805	1	S5	SCODI S05	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
201	860	1	S60	SCODI S60	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
202	864	1	S64	SCODI S64	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
203	807	1	S7	SCODI S07	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
204	808	1	S8	SCODI S08	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
205	809	1	S9	SCODI S09	\N	3	\N	164194	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
206	58	1	TBNight	TBNight	\N	3	\N	0C324C	FFFFFF	\N	bordeaux	tbm	2026-03-10 19:12:49.293068
207	6-1001	1	a	Rennes (J.F. Kennedy) <> Rennes (La Poterie)	Métro	1	\N	EE1D23	FFFFFF	1	rennes	star	2026-03-10 19:12:54.330413
208	6-1002	1	b	Cesson-Sévigné (Cesson - Viasilva) <> Rennes <> Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté)	Métro	1	\N	00893E	FFFFFF	2	rennes	star	2026-03-10 19:12:54.330413
209	6-0001	1	C1	Saint-Grégoire (Champ Daguet) <> Rennes <> Chantepie (Rosa Parks)	CHRONOSTAR	3	\N	95C11E	1A171B	1001	rennes	star	2026-03-10 19:12:54.330413
210	6-0002	1	C2	Cesson-Sévigné (Cesson - Viasilva) <> Rennes (Haut Sancé)	CHRONOSTAR	3	\N	008BD2	FFFFFF	1002	rennes	star	2026-03-10 19:12:54.330413
211	6-0003	1	C3	Rennes (Patton) <> Rennes (Henri Fréville)	CHRONOSTAR	3	\N	FFCC00	1A171B	1003	rennes	star	2026-03-10 19:12:54.330413
212	6-0004	1	C4	Rennes (ZA Saint-Sulpice) <> Saint-Grégoire (Grand Quartier)	CHRONOSTAR	3	\N	6F2282	FFFFFF	1004	rennes	star	2026-03-10 19:12:54.330413
213	6-0005	1	C5	Rennes (Saint-Laurent) <> Rennes (Lycée Bréquigny)	CHRONOSTAR	3	\N	F39200	1A171B	1005	rennes	star	2026-03-10 19:12:54.330413
214	6-0006	1	C6	Cesson-Sévigné (Rigourdière) <> Saint-Jacques-de-la-Lande (Aéroport)	CHRONOSTAR	3	\N	61C3D9	1A171B	1006	rennes	star	2026-03-10 19:12:54.330413
215	6-0007	1	C7	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Bruz Centre)	CHRONOSTAR	3	\N	D39D2F	1A171B	1007	rennes	star	2026-03-10 19:12:54.330413
216	6-0010	1	10	Rennes (Beaulieu Chimie) <> Rennes (Porte de Cleunay)	Urbaine	3	\N	EF859D	1A171B	1010	rennes	star	2026-03-10 19:12:54.330413
217	6-0011	1	11	Rennes (La Poterie) <> Vezin-le-Coquet (ZI Ouest)	Urbaine	3	\N	004F9E	FFFFFF	1011	rennes	star	2026-03-10 19:12:54.330413
218	6-0012	1	12	Rennes (Villejean-Université) <> Saint-Grégoire <> Rennes (La Poterie)	Urbaine	3	\N	BA65A5	FFFFFF	1012	rennes	star	2026-03-10 19:12:54.330413
219	6-0013	1	13	Chantepie (Cucé) <> Rennes <> Saint-Jacques-de-la-Lande <> Bruz (Porte de Ker-Lann)	Urbaine	3	\N	6F2282	FFFFFF	1013	rennes	star	2026-03-10 19:12:54.330413
220	6-0014	1	14	Cesson-Sévigné (Monniais) <> Rennes (Roazhon Park)	Urbaine	3	\N	A96F23	FFFFFF	1014	rennes	star	2026-03-10 19:12:54.330413
221	6-0032	1	32	Saint-Grégoire (Edonia) <> Rennes (Alma Sud)	Inter-quartiers	3	\N	61C3D9	1A171B	1032	rennes	star	2026-03-10 19:12:54.330413
222	6-0034	1	34	Rennes (ZA Saint-Sulpice) <> Cesson-Sévigné <> Chantepie (Rosa Parks)	Inter-quartiers	3	\N	F39200	1A171B	1034	rennes	star	2026-03-10 19:12:54.330413
223	6-0035	1	35	Rennes (The Land) <> Rennes (Villejean-Université)	Inter-quartiers	3	\N	EF859D	1A171B	1035	rennes	star	2026-03-10 19:12:54.330413
224	6-0037	1	37	Rennes (Henri Fréville) <> Saint-Jacques-de-la-Lande (Morinais)	Inter-quartiers	3	\N	E4003A	FFFFFF	1037	rennes	star	2026-03-10 19:12:54.330413
225	6-0038	1	38	Cesson-Sévigné (Monniais) <> Cesson-Sévigné (Ménouriais)	Inter-quartiers	3	\N	008BD2	FFFFFF	1038	rennes	star	2026-03-10 19:12:54.330413
226	6-0039	1	39	Saint-Grégoire (Maison Blanche) <> Saint-Grégoire (Paul-Emile Victor)	Inter-quartiers	3	\N	BA65A5	FFFFFF	1039	rennes	star	2026-03-10 19:12:54.330413
227	6-0047	1	C7ex	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) <> Bruz (Ker Lann / Bruz Centre)	CHRONOSTAR	3	\N	FFDD00	3D3C3F	1047	rennes	star	2026-03-10 19:12:54.330413
228	6-0050	1	50	Thorigné-Fouillard (Landelles) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	3	\N	FFCC00	1A171B	1050	rennes	star	2026-03-10 19:12:54.330413
229	6-0051	1	51	Betton (Champ Devant) <> Rennes (Les Gayeulles)	Métropolitaine	3	\N	6F2282	FFFFFF	1051	rennes	star	2026-03-10 19:12:54.330413
230	6-0052	1	52	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes <> Pacé <> Saint-Gilles (Ile des Bois)	Métropolitaine	3	\N	00893E	FFFFFF	1052	rennes	star	2026-03-10 19:12:54.330413
231	6-0053	1	53	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Métropolitaine	3	\N	E4003A	FFFFFF	1053	rennes	star	2026-03-10 19:12:54.330413
232	6-0054	1	54	Rennes (Charles de Gaulle) <> Le Rheu <> Cintré (Clos de la Vallée)	Métropolitaine	3	\N	BA65A5	FFFFFF	1054	rennes	star	2026-03-10 19:12:54.330413
233	6-0055	1	55	Rennes (Charles de Gaulle) <> Mordelles <> Le Verger (Le Verger Eglise)	Métropolitaine	3	\N	F39200	1A171B	1055	rennes	star	2026-03-10 19:12:54.330413
234	6-0056	1	56	Rennes (Charles de Gaulle) <> Chavagne (Croix Blanche)	Métropolitaine	3	\N	00893E	FFFFFF	1056	rennes	star	2026-03-10 19:12:54.330413
235	6-0059	1	59	Rennes (Henri Fréville) <> Bruz (Bruz Gare)	Métropolitaine	3	\N	EF859D	1A171B	1059	rennes	star	2026-03-10 19:12:54.330413
236	6-0061	1	61	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Parc d'Activités)	Métropolitaine	3	\N	E4003A	FFFFFF	1061	rennes	star	2026-03-10 19:12:54.330413
237	6-0062	1	62	Rennes (La Poterie) <> Vern-sur-Seiche (Croix Malinge)	Métropolitaine	3	\N	004F9E	FFFFFF	1062	rennes	star	2026-03-10 19:12:54.330413
238	6-0064	1	64	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Métropolitaine	3	\N	008BD2	FFFFFF	1064	rennes	star	2026-03-10 19:12:54.330413
239	6-0065	1	65	Rennes (Villejean-Université) <> Pacé <> Parthenay-de-Bretagne (Parthenay Fontaine)	Métropolitaine	3	\N	BA65A5	FFFFFF	1065	rennes	star	2026-03-10 19:12:54.330413
240	6-0067	1	67	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Métropolitaine	3	\N	E4003A	FFFFFF	1067	rennes	star	2026-03-10 19:12:54.330413
241	6-0068	1	68	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Métropolitaine	3	\N	004F9E	FFFFFF	1068	rennes	star	2026-03-10 19:12:54.330413
242	6-0070	1	70	Saint-Sulpice-la-Forêt (Cropy) <> Betton <> Rennes (Les Gayeulles)	Métropolitaine	3	\N	EF859D	1A171B	1070	rennes	star	2026-03-10 19:12:54.330413
243	6-0071	1	71	Chevaigné (Pommiers) <> Betton <> Rennes (Les Gayeulles)	Métropolitaine	3	\N	A96F23	FFFFFF	1071	rennes	star	2026-03-10 19:12:54.330413
244	6-0072	1	72	Rennes (Henri Fréville) <> Chartres-de-Bretagne <> Pont-Péan (Bois Esnault)	Métropolitaine	3	\N	004F9E	FFFFFF	1072	rennes	star	2026-03-10 19:12:54.330413
245	6-0073	1	73	Rennes (La Poterie) <> Vern-sur-Seiche <> Saint-Armel <> Corps-Nuds (Corps-Nuds Gare)	Métropolitaine	3	\N	00893E	FFFFFF	1073	rennes	star	2026-03-10 19:12:54.330413
246	6-0074	1	74	Rennes (Henri Fréville) <> Orgères <> Bourgbarré (Centre de Loisirs)	Métropolitaine	3	\N	F39200	1A171B	1074	rennes	star	2026-03-10 19:12:54.330413
247	6-0075	1	75	Nouvoitou (Parc des Sports) <> Vern-sur-Seiche <> Rennes (La Poterie)	Métropolitaine	3	\N	F39200	201D21	1075	rennes	star	2026-03-10 19:12:54.330413
248	6-0076	1	76	Rennes (Lycée Basch) <> Vezin-le-Coquet <> Le Rheu <> Mordelles (Mordelles Pâtis)	Métropolitaine	3	\N	61C3D9	1A171B	1076	rennes	star	2026-03-10 19:12:54.330413
249	6-0077	1	77	Rennes (Villejean-Université) <> Pacé (Pâtis Roussel)	Métropolitaine	3	\N	F39200	1A171B	1077	rennes	star	2026-03-10 19:12:54.330413
250	6-0078	1	78	Cesson-Sévigné (Cesson-Viasilva) <> Betton (La Haute Plesse) <> Saint-Grégoire <> Rennes (Villejean-Université)	Métropolitaine	3	\N	E4003A	FFFFFF	1078	rennes	star	2026-03-10 19:12:54.330413
251	6-0079	1	79	Rennes (Henri Fréville) <> Pont-Péan <> Laillé (Gingouillère)	Métropolitaine	3	\N	61C3D9	26171B	1079	rennes	star	2026-03-10 19:12:54.330413
252	6-0080	1	80	Rennes (Henri Fréville) <> Laillé (Gingouillère)	Métropolitaine	3	\N	BA65A5	FFFFFF	1080	rennes	star	2026-03-10 19:12:54.330413
253	6-0081	1	81	Rennes (Villejean-Université) <> Clayes <> Romillé (Romillé Collège)	Métropolitaine	3	\N	008BD2	FFFFFF	1081	rennes	star	2026-03-10 19:12:54.330413
254	6-0082	1	82	Rennes (Villejean-Université) <> Romillé <> Langan <> La Chapelle-Chaussée <> Bécherel <> Miniac-sous-Bécherel (Miniac Eglise)	Métropolitaine	3	\N	E4003A	FFFFFF	1082	rennes	star	2026-03-10 19:12:54.330413
255	6-0083	1	83	Thorigné-Fouillard (ZA Bellevue) <> Cesson-Sévigné <> Rennes (Les Gayeulles)	Métropolitaine	3	\N	004F9E	FFFFFF	1083	rennes	star	2026-03-10 19:12:54.330413
256	6-0090	1	90	Bruz (Lavoisier) <> Bruz (DGA-MI)	Intercommunale	3	\N	008BD2	FFFFFF	1090	rennes	star	2026-03-10 19:12:54.330413
257	6-0091	1	91	Noyal-Châtillon-sur-Seiche (Petite Saudrais) <> Chartres-de-Bretagne <> Bruz (Cicé Blossac/Pont-Réan)	Intercommunale	3	\N	AECC52	1A171B	1091	rennes	star	2026-03-10 19:12:54.330413
258	6-0152	1	152ex	Rennes (Villejean-Université) <> Saint-Gilles (Ile des Bois)	Express	3	\N	FFDD00	3D3C3F	1152	rennes	star	2026-03-10 19:12:54.330413
259	6-0153	1	153ex	Rennes (République) <> Vezin-le-Coquet <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Express	3	\N	FFDD00	3D3C3F	1153	rennes	star	2026-03-10 19:12:54.330413
260	6-0154	1	154ex	Rennes (République) <> Le Rheu <> Cintré (Clos de la Vallée)	Express	3	\N	FFDD00	3D3C3F	1154	rennes	star	2026-03-10 19:12:54.330413
261	6-0155	1	155ex	Rennes (République) <> Mordelles <> Le Verger (Le Verger Eglise)	Express	3	\N	FFDD00	3D3C3F	1155	rennes	star	2026-03-10 19:12:54.330413
262	6-0156	1	156ex	Rennes (République) <> Chavagne (Croix Blanche)	Express	3	\N	FFDD00	3D3C3F	1156	rennes	star	2026-03-10 19:12:54.330413
263	6-0159	1	159ex	Bruz (Bruz Gare) <> Rennes (Henri Fréville)	Express	3	\N	FFDD00	3D3C3F	1159	rennes	star	2026-03-10 19:12:54.330413
264	6-0161	1	161ex	Rennes (Henri Fréville) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon <> Bourgbarré (Centre de Loisirs)	Express	3	\N	FFDD00	3D3C3F	1161	rennes	star	2026-03-10 19:12:54.330413
265	6-0164	1	164ex	Acigné (Timonière) <> Cesson-Sévigné (Cesson - Viasilva)	Express	3	\N	FFDD00	3D3C3F	1164	rennes	star	2026-03-10 19:12:54.330413
266	6-0165	1	165ex	Rennes (Villejean-Université) <> Parthenay-de-Bretagne (Parthenay Fontaine)	Express	3	\N	FFDD00	3D3C3F	1165	rennes	star	2026-03-10 19:12:54.330413
267	6-0167	1	167ex	Brécé (Anjou) <> Cesson-Sévigné <> Rennes (République)	Express	3	\N	FFDD00	3D3C3F	1167	rennes	star	2026-03-10 19:12:54.330413
268	6-0168	1	168ex	Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)	Express	3	\N	FFDD00	3D3C3F	1168	rennes	star	2026-03-10 19:12:54.330413
269	6-0172	1	172ex	Rennes (Henri Fréville) <> Chartres-de-Bretagne (Ferme des Peupliers)	Express	3	\N	FFDD00	3D3C3F	1172	rennes	star	2026-03-10 19:12:54.330413
270	6-0173	1	173ex	Rennes (La Poterie) <> Saint-armel <> Corps-Nuds (Corps-Nuds Gare)	Express	3	\N	FFDD00	3D3C3F	1173	rennes	star	2026-03-10 19:12:54.330413
271	6-0175	1	175ex	Rennes (La Poterie) <> Nouvoitou (Parc des Sports)	Express	3	\N	FFDD00	3D3C3F	1175	rennes	star	2026-03-10 19:12:54.330413
272	6-0178	1	178ex	Betton (La Haute Plesse) <> Rennes (Villejean-Université)	Express	3	\N	FFDD00	3D3C3F	1178	rennes	star	2026-03-10 19:12:54.330413
273	6-0507	1	507	Bécherel (Bécherel Centre) <> Rennes (Gares)	BreizhGo	3	\N	4B74B6	FFFFFF	1507	rennes	star	2026-03-10 19:12:54.330413
274	6-0510	1	510	Saint-Jacques-de-la-Lande (Saint-Jacques - Gaîté) -> Bruz (Pont-Réan)	Métropolitaine	3	\N	1A95AB	FFFFFF	1510	rennes	star	2026-03-10 19:12:54.330413
275	6-0806	1	E4	Bus de Stade : Rennes (Roazhon Park) <> Communes	Evènementiel	3	\N	\N	\N	1806	rennes	star	2026-03-10 19:12:54.330413
276	6-0810	1	E1	Rennes (Charles de Gaulle - République) <> Saint-Jacques-de-la Lande (Parc Expo) via  Saint-Jacques-de-la Lande (Saint-Jacques - Gaîté)	Evènementiel	3	\N	\N	\N	1810	rennes	star	2026-03-10 19:12:54.330413
277	6-0121	1	N1	Rennes (République) <> Rennes (Kennedy Guyenne)	STAR de Nuit	3	\N	004F9E	FFFFFF	2121	rennes	star	2026-03-10 19:12:54.330413
278	6-0122	1	N2	Rennes (République) <> Rennes (La Poterie)	STAR de Nuit	3	\N	F39200	1A171B	2122	rennes	star	2026-03-10 19:12:54.330413
279	6-0123	1	N3	Rennes (République) <> Bruz (Schuman)	STAR de Nuit	3	\N	D39D2F	1A171B	2123	rennes	star	2026-03-10 19:12:54.330413
280	6-0124	1	N4	Cesson-Sévigné (Atalante) <> Rennes (République)	STAR de Nuit	3	\N	6F2282	FFFFFF	2124	rennes	star	2026-03-10 19:12:54.330413
281	6-0125	1	N5	Rennes (Parc Gayeulles) <> Rennes (République)	STAR de Nuit	3	\N	FFCC00	1A171B	2125	rennes	star	2026-03-10 19:12:54.330413
282	6-0100	1	La Navette	Navette Centre-Ville : Rennes (République Jaurès) <> Rennes (Sainte-Anne) <> Rennes (République Jaurès)	Spéciale	3	\N	009C99	FFFFFF	3100	rennes	star	2026-03-10 19:12:54.330413
283	6-0804	1	TTZ	Rennes <> Noyal-Châtillon-sur-Seiche (Touche Tizon)	Spéciale	3	\N	009C99	FFFFFF	3804	rennes	star	2026-03-10 19:12:54.330413
284	6-0200	1	200	Acigné (Timonière) <> Rennes (Assomption)	Complémentaire	3	\N	BA67A6	FFFFFF	4200	rennes	star	2026-03-10 19:12:54.330413
285	6-0201	1	201	Thorigné-Fouillard (Landelles) <> Rennes (Assomption)	Complémentaire	3	\N	E30613	FFFFFF	4201	rennes	star	2026-03-10 19:12:54.330413
286	6-0202	1	202	Chevaigné (Pommiers) <> Betton <> Saint-Grégoire <> Rennes (Assomption)	Complémentaire	3	\N	009FE3	FFFFFF	4202	rennes	star	2026-03-10 19:12:54.330413
287	6-0204	1	204	Saint-Grégoire (Champ Daguet) <> Rennes (Assomption)	Complémentaire	3	\N	94C11F	FFFFFF	4204	rennes	star	2026-03-10 19:12:54.330413
288	6-0206	1	206	Cesson-Sévigné (Métairies Chalotais) <> Rennes (Assomption)	Complémentaire	3	\N	FECC00	1A171B	4206	rennes	star	2026-03-10 19:12:54.330413
289	6-0208	1	208	Saint-Grégoire (MFR Rabinardières) <> Rennes (Gares)	Complémentaire	3	\N	F39200	FFFFFF	4208	rennes	star	2026-03-10 19:12:54.330413
290	6-0209	1	209	Saint-Jacques-de-la-Lande (Croix Verte) <> Saint-Jacques-de-la-Lande (Collège Jean Moulin)	Complémentaire	3	\N	FFCC00	1A171B	4209	rennes	star	2026-03-10 19:12:54.330413
291	6-0212	1	212	Rennes (Coubertin) <> Noyal-Châtillon-sur-Seiche <> Saint-Erblon (Champ Mulon)	Complémentaire	3	\N	BA67A6	FFFFFF	4212	rennes	star	2026-03-10 19:12:54.330413
292	6-0213	1	213	Rennes (Coubertin) <> Orgères <> Bourgbarré (Sept Fours)	Complémentaire	3	\N	94C11F	FFFFFF	4213	rennes	star	2026-03-10 19:12:54.330413
293	6-0214	1	214	Cesson-Sévigné (Lycée Ozanam) <> Rennes (La Poterie)	Complémentaire	3	\N	94C11F	FFFFFF	4214	rennes	star	2026-03-10 19:12:54.330413
294	6-0216	1	216	Cesson-Sévigné (Dézerseul) <> Rennes (Assomption)	Complémentaire	3	\N	F29FC5	1A171B	4216	rennes	star	2026-03-10 19:12:54.330413
295	6-0218	1	218	Pacé (Centre scolaire Pacé) <> Saint-Gilles (Ile des Bois)	Complémentaire	3	\N	BA67A6	FFFFFF	4218	rennes	star	2026-03-10 19:12:54.330413
296	6-0219	1	219	Saint-Jacques-de-la-Lande (Jean Jaurès) <> Bruz (Aire du 8 Mai)	Complémentaire	3	\N	EF859D	1A171B	4219	rennes	star	2026-03-10 19:12:54.330413
297	6-0220	1	220	Acigné (Timonière) <> Cesson-Sévigné (Lycée Sévigné)	Complémentaire	3	\N	009FE3	FFFFFF	4220	rennes	star	2026-03-10 19:12:54.330413
298	6-0221	1	221	Cesson-Sévigné (Château de Vaux) <> Thorigné-Fouillard <> Cesson-Sévigné (Lycée Sévigné)	Complémentaire	3	\N	F39200	FFFFFF	4221	rennes	star	2026-03-10 19:12:54.330413
299	6-0222	1	222	Chevaigné (Pommiers) <> Betton (Champ Devant)	Complémentaire	3	\N	FECC00	1A171B	4222	rennes	star	2026-03-10 19:12:54.330413
300	6-0223	1	223	Chevaigné (Pommiers) <> Betton <> Saint Grégoire (Jean-Paul II)	Complémentaire	3	\N	94C11F	FFFFFF	4223	rennes	star	2026-03-10 19:12:54.330413
301	6-0224	1	224	Saint-Grégoire (Jean-Paul II) <> Montgermont <> La Chapelle-des-Fougeretz <> Gévezé (Cheval Blanc)	Complémentaire	3	\N	009FE3	FFFFFF	4224	rennes	star	2026-03-10 19:12:54.330413
302	6-0225	1	225	Saint-Grégoire (Jean-Paul II) <> Pacé (Pâtis Roussel)	Complémentaire	3	\N	E30613	FFFFFF	4225	rennes	star	2026-03-10 19:12:54.330413
303	6-0226	1	226	Gévezé (Cheval Blanc) <> La Chapelle-des-Fougeretz <> Montgermont <> Pacé (Centre scolaire Pacé)	Complémentaire	3	\N	4465AD	FFFFFF	4226	rennes	star	2026-03-10 19:12:54.330413
304	6-0227	1	227	Vezin-le-Coquet (Haie de Terre) <> Pacé (Centre scolaire Pacé)	Complémentaire	3	\N	BCA3CE	FFFFFF	4227	rennes	star	2026-03-10 19:12:54.330413
305	6-0228	1	228	La Chapelle-des-Fougeretz (Besneraie) <> Montgermont <> Rennes (Lycée Mendès France)	Complémentaire	3	\N	71BF44	1A171B	4228	rennes	star	2026-03-10 19:12:54.330413
306	6-0229	1	229	Bruz (Brossolette) <> Chavagne <> Mordelles (Mordelles Pâtis)	Complémentaire	3	\N	FECC00	1A171B	4229	rennes	star	2026-03-10 19:12:54.330413
307	6-0230	1	230	Bruz (Aire du 8 Mai) <> Orgères <> Bourgbarré (Centre de Loisirs)	Complémentaire	3	\N	009881	FFFFFF	4230	rennes	star	2026-03-10 19:12:54.330413
308	6-0231	1	231	Bruz (Brossolette) <> Pont-Péan <> Laillé (Gingouillère)	Complémentaire	3	\N	E5006D	FFFFFF	4231	rennes	star	2026-03-10 19:12:54.330413
309	6-0233	1	233	Bourgbarré (Centre de Loisirs) <> Orgères <> Saint-Erblon (Collège Saint-Paul)	Complémentaire	3	\N	4465AD	FFFFFF	4233	rennes	star	2026-03-10 19:12:54.330413
310	6-0234	1	234	Saint-Grégoire (Jean-Paul II) <> Pacé (Pont Amelin)	Complémentaire	3	\N	FECC00	1A171B	4234	rennes	star	2026-03-10 19:12:54.330413
311	6-0235	1	235	Pont-Péan (Mouton Blanc) <> Laillé <> Orgères (L'Hermitière Village)	Complémentaire	3	\N	FECC00	1A171B	4235	rennes	star	2026-03-10 19:12:54.330413
312	6-0236	1	236	Pacé (Centre scolaire Pacé) <> Parthenay-de-Bretagne <> Clayes (Clayes Centre)	Complémentaire	3	\N	F29FC5	1A171B	4236	rennes	star	2026-03-10 19:12:54.330413
313	6-0237	1	237	Le Rheu (Collège Brassens) <> Chavagne (Croix Blanche)	Complémentaire	3	\N	E30613	FFFFFF	4237	rennes	star	2026-03-10 19:12:54.330413
314	6-0238	1	238	Le Rheu (Collège Brassens) <> L'Hermitage <> La Chapelle-Thouarault (Ville aux Archers)	Complémentaire	3	\N	BA67A6	FFFFFF	4238	rennes	star	2026-03-10 19:12:54.330413
315	6-0239	1	239	Le Rheu (Lycée Monod) <> Mordelles (Mordelles Pâtis)	Complémentaire	3	\N	F39200	FFFFFF	4239	rennes	star	2026-03-10 19:12:54.330413
316	6-0240	1	240	Saint-Gilles (Ile des Bois) <> L'Hermitage <> Le Rheu (Lycée Monod)	Complémentaire	3	\N	005BAB	FFFFFF	4240	rennes	star	2026-03-10 19:12:54.330413
317	6-0241	1	241	Mordelles (Collège St-Yves) <> Chavagne (Croix Blanche)	Complémentaire	3	\N	71BF44	1A171B	4241	rennes	star	2026-03-10 19:12:54.330413
318	6-0242	1	242	Miniac-sous-Bécherel (Miniac Eglise) <> Bécherel <> La Chapelle-Chaussée <> Romillé (Romillé Collège)	Complémentaire	3	\N	F7941D	1A171B	4242	rennes	star	2026-03-10 19:12:54.330413
319	6-0243	1	243	Saint-Grégoire (Jean-Paul II) <> Montgermont <> Pacé (Pie Neuve)	Complémentaire	3	\N	F7941D	1A171B	4243	rennes	star	2026-03-10 19:12:54.330413
320	6-0245	1	245	Rennes (Foyer Rennais) <> Bruz (Bruz Centre)	Complémentaire	3	\N	005BAB	FFFFFF	4245	rennes	star	2026-03-10 19:12:54.330413
321	6-0401	1	Ts1	Noyal-Châtillon-sur-Seiche (Launay Hyon) <> Chartres-de-Bretagne <> Bruz (Aire du 8 Mai)	Transport scolaire	3	\N	702283	FFFFFF	4401	rennes	star	2026-03-10 19:12:54.330413
322	6-0403	1	Ts3	Saint-Erblon (Douazel) <> Noyal-Châtillon-sur-Seiche <> Bruz (Aire du 8 Mai)	Transport scolaire	3	\N	5DC4E1	FFFFFF	4403	rennes	star	2026-03-10 19:12:54.330413
323	6-0404	1	Ts4	Bourgbarré (La Fretais) <> Orgères <> Bruz (Anita Conti)	Transport scolaire	3	\N	76B729	FFFFFF	4404	rennes	star	2026-03-10 19:12:54.330413
324	6-0405	1	Ts5	Bruz (Aire du 8 Mai) <> Saint-Erblon <> Orgères <> Bourgbarré (Houssais)	Transport scolaire	3	\N	BA67A6	FFFFFF	4405	rennes	star	2026-03-10 19:12:54.330413
325	6-0406	1	Ts6	Bruz (Aire du 8 Mai) <> Saint-Erblon <> Orgères <> Laillé (Bossardière)	Transport scolaire	3	\N	F39200	FFFFFF	4406	rennes	star	2026-03-10 19:12:54.330413
326	6-0407	1	Ts7	Bourgbarré (Jardin du Soleil) <> Bruz (Anita Conti)	Transport scolaire	3	\N	4465AD	FFFFFF	4407	rennes	star	2026-03-10 19:12:54.330413
327	6-0408	1	Ts8	Bruz (Brossolette) <> Mordelles (Mordelles Pâtis)	Transport scolaire	3	\N	E30613	FFFFFF	4408	rennes	star	2026-03-10 19:12:54.330413
328	6-0409	1	Ts9	Bruz (Aire du 8 Mai) <> Laillé (Couais)	Transport scolaire	3	\N	13A0DB	FFFFFF	4409	rennes	star	2026-03-10 19:12:54.330413
329	6-0410	1	Ts10	Bruz (Anita Conti) <> Laillé (Châtaigneraie)	Transport scolaire	3	\N	E99D3A	1A171B	4410	rennes	star	2026-03-10 19:12:54.330413
330	6-0411	1	Ts11	Bruz (Aire du 8 Mai) <> Laillé (Château d'Eau)	Transport scolaire	3	\N	E30613	FFFFFF	4411	rennes	star	2026-03-10 19:12:54.330413
331	6-0420	1	Ts20	Nouvoitou (Le Gobigné) <> Vern-sur-Seiche (La Poste)	Transport scolaire	3	\N	E30613	FFFFFF	4420	rennes	star	2026-03-10 19:12:54.330413
332	6-0422	1	Ts22	Chantepie (La Planche) <> Rennes (Les Hautes Ourmes)	Transport scolaire	3	\N	FECC00	1A171B	4422	rennes	star	2026-03-10 19:12:54.330413
333	6-0430	1	Ts30	Le Rheu (Egalité) <> Mordelles (Collège St-Yves)	Transport scolaire	3	\N	00893E	FFFFFF	4430	rennes	star	2026-03-10 19:12:54.330413
334	6-0432	1	Ts32	La Chapelle-Thouarault (Cherterie) <> L'Hermitage <> Mordelles (Collège St-Yves)	Transport scolaire	3	\N	E30613	FFFFFF	4432	rennes	star	2026-03-10 19:12:54.330413
335	6-0433	1	Ts33	Le Rheu (Moigné) <> Mordelles (Collège St-Yves)	Transport scolaire	3	\N	BA67A6	FFFFFF	4433	rennes	star	2026-03-10 19:12:54.330413
336	6-0434	1	Ts34	L'Hermitage (Rue de Montfort) <> Mordelles (Collège St-Yves)	Transport scolaire	3	\N	FECC00	1A171B	4434	rennes	star	2026-03-10 19:12:54.330413
337	6-0435	1	Ts35	Mordelles (Morvan Lebesque) <> Le Verger (Breil)	Transport scolaire	3	\N	009FE3	FFFFFF	4435	rennes	star	2026-03-10 19:12:54.330413
338	6-0436	1	Ts36	Cintré (Chêne Lierru) <> Mordelles (Morvan Lebesque)	Transport scolaire	3	\N	F39200	FFFFFF	4436	rennes	star	2026-03-10 19:12:54.330413
339	6-0437	1	Ts37	La Chapelle-Thouarault (Ville aux Archers) <> Mordelles (Morvan Lebesque / Collège St-Yves)	Transport scolaire	3	\N	4465AD	FFFFFF	4437	rennes	star	2026-03-10 19:12:54.330413
340	6-0438	1	Ts38	Cintré (Belle Arrivée) <> Mordelles (Morvan Lebesque)	Transport scolaire	3	\N	702283	FFFFFF	4438	rennes	star	2026-03-10 19:12:54.330413
341	6-0441	1	Ts41	La Chapelle-des-Fougeretz (Bersandières) <> Montgermont <> Pacé (Centre scolaire Pacé)	Transport scolaire	3	\N	F39200	FFFFFF	4441	rennes	star	2026-03-10 19:12:54.330413
342	6-0443	1	Ts43	Pacé (Centre scolaire Pacé) <> Saint-Gilles (Etang de la Motte)	Transport scolaire	3	\N	FECC00	1A171B	4443	rennes	star	2026-03-10 19:12:54.330413
343	6-0444	1	Ts44	Gévezé (Cheval Blanc) <> Pacé (Centre scolaire Pacé)	Transport scolaire	3	\N	96C11F	FFFFFF	4444	rennes	star	2026-03-10 19:12:54.330413
344	6-0445	1	Ts45	Gévezé (Huchetais) <> Pacé (Centre scolaire Pacé)	Transport scolaire	3	\N	E30613	FFFFFF	4445	rennes	star	2026-03-10 19:12:54.330413
345	6-0446	1	Ts46	Pacé (Bas Sommier) <> Vezin-le-Coquet <> Pacé (Centre scolaire Pacé)	Transport scolaire	3	\N	009FE3	FFFFFF	4446	rennes	star	2026-03-10 19:12:54.330413
346	6-0451	1	Ts51	Bourgbarré (Les Cruaux) <> Saint-Erblon <> Orgères (Collège Récipon)	Transport scolaire	3	\N	009FE3	FFFFFF	4451	rennes	star	2026-03-10 19:12:54.330413
347	6-0452	1	Ts52	Noyal-Châtillon-sur-Seiche (Abords Launay) <> Saint-Erblon (Collège Saint-Paul)	Transport scolaire	3	\N	FECC00	1A171B	4452	rennes	star	2026-03-10 19:12:54.330413
348	6-0453	1	Ts53	Saint-Erblon (Collège Saint-Paul) <> Orgères <> Bourgbarré <> Laillé (Bossardière)	Transport scolaire	3	\N	E30613	FFFFFF	4453	rennes	star	2026-03-10 19:12:54.330413
349	6-0454	1	Ts54	Saint-Erblon (Bon Espoir) <> Orgères (Collège Récipon)	Transport scolaire	3	\N	F39200	FFFFFF	4454	rennes	star	2026-03-10 19:12:54.330413
350	6-0455	1	Ts55	Laillé (Laillé Collège) <> Laillé (Boulais Pochetière)	Transport scolaire	3	\N	36742F	FFFFFF	4455	rennes	star	2026-03-10 19:12:54.330413
351	6-0457	1	Ts57	Laillé (Laillé Collège) <> Laillé (Gripay)	Transport scolaire	3	\N	009FE3	FFFFFF	4457	rennes	star	2026-03-10 19:12:54.330413
352	6-0461	1	Ts61	Cesson-Sévigné (Lycée Ozanam) <> Cesson-Sévigné (Prieuré Forge)	Transport scolaire	3	\N	E30613	FFFFFF	4461	rennes	star	2026-03-10 19:12:54.330413
353	6-0466	1	Ts66	Saint-Gilles (Pierre Blanche) <>La Chapelle-Thouarault <> L'Hermitage <> Le Rheu (Collège Brassens)	Transport scolaire	3	\N	009FE3	FFFFFF	4466	rennes	star	2026-03-10 19:12:54.330413
354	6-0467	1	Ts67	Saint-Gilles (Haute Fresnais) <> L'Hermitage <> Le Rheu (Collège Brassens)	Transport scolaire	3	\N	71BF44	1A171B	4467	rennes	star	2026-03-10 19:12:54.330413
355	6-0470	1	RPI-1	La Chapelle-Chaussée (Chapelle-Chaussée) <> Bécherel <> La Chapelle-Chaussée (Chapelle-Chaussée)	Transport scolaire	3	\N	6F2B91	FFFFFF	4470	rennes	star	2026-03-10 19:12:54.330413
356	6-0471	1	Ts71	Langan (Rouaudière) <> Romillé (Romillé Collège)	Transport scolaire	3	\N	E30613	FFFFFF	4471	rennes	star	2026-03-10 19:12:54.330413
357	6-0475	1	Ts75	La Chapelle-Chaussée (Chapelle-Chaussée) <> Gevezé <> Saint-Grégoire (Jean-Paul II)	Transport scolaire	3	\N	BA67A6	FFFFFF	4475	rennes	star	2026-03-10 19:12:54.330413
358	6-0482	1	Ts82	Noyal-Châtillon-sur-Seiche (Ise) <> Chartres-de-Bretagne (Collège Pôle Sud)	Transport scolaire	3	\N	96BF0D	FFFFFF	4482	rennes	star	2026-03-10 19:12:54.330413
359	6-0491	1	Ts91	Rennes (Collège Rosa-Parks) <> Vezin-le-Coquet (Vallée)	Transport scolaire	3	\N	B269AB	FFFFFF	4491	rennes	star	2026-03-10 19:12:54.330413
\.


--
-- Name: traffic_metric_route_event_id_seq; Type: SEQUENCE SET; Schema: analytics; Owner: kakarott
--

SELECT pg_catalog.setval('analytics.traffic_metric_route_event_id_seq', 1467, true);


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kakarott
--

SELECT pg_catalog.setval('public.routes_id_seq', 359, true);


--
-- Name: traffic_metric_route_event traffic_metric_route_event_pkey; Type: CONSTRAINT; Schema: analytics; Owner: kakarott
--

ALTER TABLE ONLY analytics.traffic_metric_route_event
    ADD CONSTRAINT traffic_metric_route_event_pkey PRIMARY KEY (id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: kakarott
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: gtfs_publication; Type: PUBLICATION; Schema: -; Owner: kakarott
--

CREATE PUBLICATION gtfs_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION gtfs_publication OWNER TO kakarott;

--
-- Name: gtfs_publication routes; Type: PUBLICATION TABLE; Schema: public; Owner: kakarott
--

ALTER PUBLICATION gtfs_publication ADD TABLE ONLY public.routes;


--
-- PostgreSQL database dump complete
--

\unrestrict yjI5Dw2O6OccY5o73sfFgZdfxbOYcaTqx7dCjQccNIyDHjG1vxCnNkRQRzbnlR2

