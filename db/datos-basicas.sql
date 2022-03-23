-- Volcado de tablas basicas

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: apo214_cobertura; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.apo214_cobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (1, 'Potrero', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
INSERT INTO public.apo214_cobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (2, 'Cultivo', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
INSERT INTO public.apo214_cobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (3, 'Bosque', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
INSERT INTO public.apo214_cobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (4, 'Otro', null, '2020-12-15', null, '2020-12-15', '2020-12-15');

--
-- Name: apo214_cobertura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.apo214_cobertura_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: apo214_elementopaisaje; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.apo214_elementopaisaje (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (1, 'Planicie', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
INSERT INTO public.apo214_elementopaisaje (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (2, 'Ondulado', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
INSERT INTO public.apo214_elementopaisaje (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (3, 'Terraza', null, '2020-12-15', null, '2020-12-15', '2020-12-15');

--
-- Name: apo214_elementopaisaje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.apo214_elementopaisaje_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: apo214_riesgo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (1, 'Presencia de grupos armados al margen de la ley (GAI)', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (2, 'Contradictores', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (3, 'Artefactos explosivos', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (4, 'Residuos químicos, biológicos, médicos, etc.', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (5, 'Enfermedades locales', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (6, 'Acceso al sitio', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (7, 'Flora y Fauna', null, '2020-12-15', null, '2020-12-15', '2020-12-15');

--
-- Name: apo214_riesgo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.apo214_riesgo_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: apo214_tipoentierro; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.apo214_tipoentierro (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (1, 'Primario', null, '2020-11-29', null, '2020-11-29', '2020-11-29');
INSERT INTO public.apo214_tipoentierro (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (2, 'Secundario', null, '2020-11-29', null, '2020-11-29', '2020-11-29');
INSERT INTO public.apo214_tipoentierro (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (3, 'Mixto', null, '2020-11-29', null, '2020-11-29', '2020-11-29');

--
-- Name: apo214_tipoentierro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.apo214_tipoentierro_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: apo214_tipotestigo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.apo214_tipotestigo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (1, 'SIN INFORMACIÓN', null, '2020-11-06', null, '2020-11-06', '2020-11-06');
INSERT INTO public.apo214_tipotestigo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (2, 'Presencial', null, '2020-11-06', null, '2020-11-06', '2020-11-06');
INSERT INTO public.apo214_tipotestigo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (3, 'Segundo grado', null, '2020-11-06', null, '2020-11-06', '2020-11-06');
INSERT INTO public.apo214_tipotestigo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
  VALUES (4, 'Otro', null, '2020-11-06', null, '2020-11-06', '2020-11-06');

--
-- Name: apo214_tipotestigo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.apo214_tipotestigo_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: apo214_disposicioncadaveres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.apo214_disposicioncadaveres (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) 
  VALUES (1, 'En superficie', null, '2020-11-28', null, '2020-11-28', '2020-11-28');
INSERT INTO public.apo214_disposicioncadaveres (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) 
  VALUES (2, 'Inhumados', null, '2020-11-28', null, '2020-11-28', '2020-11-28');
INSERT INTO public.apo214_disposicioncadaveres (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) 
  VALUES (3, 'Arrojados a un cuerpo de agua', null, '2020-11-28', null, '2020-11-28', '2020-11-28');
INSERT INTO public.apo214_disposicioncadaveres (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) 
        VALUES (4, 'Otros', null, '2020-11-28', null, '2020-11-28', '2020-11-28');

--
-- Name: apo214_disposicioncadaveres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.apo214_disposicioncadaveres_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

