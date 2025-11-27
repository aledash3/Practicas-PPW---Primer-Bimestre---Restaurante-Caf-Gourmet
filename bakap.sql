--
-- PostgreSQL database dump
--

\restrict AicC5XuoiaG4T3LpXkOAZFave2Wf8IURNeTT681b1Ts4ZCoJavBET3deIGjJhlB

-- Dumped from database version 13.5
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-19 11:13:29

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 22965)
-- Name: auditoria; Type: SCHEMA; Schema: -; Owner: alumno
--

CREATE SCHEMA auditoria;


ALTER SCHEMA auditoria OWNER TO alumno;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 219 (class 1255 OID 23015)
-- Name: fn_log_audit(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_log_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (TG_OP = 'DELETE') THEN
    INSERT INTO "auditoria".tb_auditoria ("tabla_aud", "operacion_aud", "valoranterior_aud", "valornuevo_aud", "fecha_aud", "usuario_aud")
           VALUES (TG_TABLE_NAME, 'D', OLD, NULL, now(), USER);
    RETURN OLD;
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO "auditoria".tb_auditoria ("tabla_aud", "operacion_aud", "valoranterior_aud", "valornuevo_aud", "fecha_aud", "usuario_aud")
           VALUES (TG_TABLE_NAME, 'U', OLD, NEW, now(), USER);
    RETURN NEW;
  ELSIF (TG_OP = 'INSERT') THEN
    INSERT INTO "auditoria".tb_auditoria ("tabla_aud", "operacion_aud", "valoranterior_aud", "valornuevo_aud", "fecha_aud", "usuario_aud")
           VALUES (TG_TABLE_NAME, 'I', NULL, NEW, now(), USER);
    RETURN NEW;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION public.fn_log_audit() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 22982)
-- Name: tb_auditoria; Type: TABLE; Schema: auditoria; Owner: alumno
--

CREATE TABLE auditoria.tb_auditoria (
    id_aud integer NOT NULL,
    tabla_aud text,
    operacion_aud text,
    valoranterior_aud text,
    valornuevo_aud text,
    fecha_aud date,
    usuario_aud text,
    esquema_aud text,
    activar_aud boolean,
    trigger_aud boolean
);


ALTER TABLE auditoria.tb_auditoria OWNER TO alumno;

--
-- TOC entry 217 (class 1259 OID 22980)
-- Name: tb_auditoria_id_aud_seq; Type: SEQUENCE; Schema: auditoria; Owner: alumno
--

CREATE SEQUENCE auditoria.tb_auditoria_id_aud_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auditoria.tb_auditoria_id_aud_seq OWNER TO alumno;

--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 217
-- Name: tb_auditoria_id_aud_seq; Type: SEQUENCE OWNED BY; Schema: auditoria; Owner: alumno
--

ALTER SEQUENCE auditoria.tb_auditoria_id_aud_seq OWNED BY auditoria.tb_auditoria.id_aud;


--
-- TOC entry 201 (class 1259 OID 22403)
-- Name: tb_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_categoria (
    id_cat integer NOT NULL,
    descripcion_cat character varying(100)
);


ALTER TABLE public.tb_categoria OWNER TO postgres;

--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE tb_categoria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_categoria IS 'Tabla de categorías de productos';


--
-- TOC entry 202 (class 1259 OID 22406)
-- Name: tb_categoria_id_cat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_categoria_id_cat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_categoria_id_cat_seq OWNER TO postgres;

--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 202
-- Name: tb_categoria_id_cat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_categoria_id_cat_seq OWNED BY public.tb_categoria.id_cat;


--
-- TOC entry 203 (class 1259 OID 22408)
-- Name: tb_estadocivil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_estadocivil (
    id_est integer NOT NULL,
    descripcion_est character varying(100)
);


ALTER TABLE public.tb_estadocivil OWNER TO postgres;

--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE tb_estadocivil; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_estadocivil IS 'Tabla de estados civiles';


--
-- TOC entry 204 (class 1259 OID 22411)
-- Name: tb_estadocivil_id_est_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_estadocivil_id_est_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_estadocivil_id_est_seq OWNER TO postgres;

--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 204
-- Name: tb_estadocivil_id_est_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_estadocivil_id_est_seq OWNED BY public.tb_estadocivil.id_est;


--
-- TOC entry 205 (class 1259 OID 22413)
-- Name: tb_pagina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_pagina (
    id_pag integer NOT NULL,
    descripcion_pag character varying(150),
    path_pag text
);


ALTER TABLE public.tb_pagina OWNER TO postgres;

--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE tb_pagina; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_pagina IS 'Tabla de páginas del sistema';


--
-- TOC entry 206 (class 1259 OID 22419)
-- Name: tb_pagina_id_pag_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_pagina_id_pag_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_pagina_id_pag_seq OWNER TO postgres;

--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 206
-- Name: tb_pagina_id_pag_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_pagina_id_pag_seq OWNED BY public.tb_pagina.id_pag;


--
-- TOC entry 207 (class 1259 OID 22421)
-- Name: tb_parametros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_parametros (
    id_par integer NOT NULL,
    descripcion_par character varying(150),
    valor_par text
);


ALTER TABLE public.tb_parametros OWNER TO postgres;

--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE tb_parametros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_parametros IS 'Tabla de parámetros del sistema';


--
-- TOC entry 208 (class 1259 OID 22427)
-- Name: tb_parametros_id_par_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_parametros_id_par_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_parametros_id_par_seq OWNER TO postgres;

--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 208
-- Name: tb_parametros_id_par_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_parametros_id_par_seq OWNED BY public.tb_parametros.id_par;


--
-- TOC entry 209 (class 1259 OID 22429)
-- Name: tb_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_perfil (
    id_per integer NOT NULL,
    descripcion_per character varying(100)
);


ALTER TABLE public.tb_perfil OWNER TO postgres;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE tb_perfil; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_perfil IS 'Tabla de perfiles de usuario (roles)';


--
-- TOC entry 210 (class 1259 OID 22432)
-- Name: tb_perfil_id_per_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_perfil_id_per_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_perfil_id_per_seq OWNER TO postgres;

--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 210
-- Name: tb_perfil_id_per_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_perfil_id_per_seq OWNED BY public.tb_perfil.id_per;


--
-- TOC entry 211 (class 1259 OID 22434)
-- Name: tb_perfilpagina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_perfilpagina (
    id_perpag integer NOT NULL,
    id_per integer,
    id_pag integer
);


ALTER TABLE public.tb_perfilpagina OWNER TO postgres;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE tb_perfilpagina; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_perfilpagina IS 'Relación entre perfiles y páginas permitidas';


--
-- TOC entry 212 (class 1259 OID 22437)
-- Name: tb_perfilpagina_id_perpag_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_perfilpagina_id_perpag_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_perfilpagina_id_perpag_seq OWNER TO postgres;

--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 212
-- Name: tb_perfilpagina_id_perpag_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_perfilpagina_id_perpag_seq OWNED BY public.tb_perfilpagina.id_perpag;


--
-- TOC entry 213 (class 1259 OID 22439)
-- Name: tb_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_producto (
    id_pr integer NOT NULL,
    id_cat integer,
    nombre_pr character varying(150),
    cantidad_pr integer,
    precio_pr double precision,
    foto_pr bytea
);


ALTER TABLE public.tb_producto OWNER TO postgres;

--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE tb_producto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_producto IS 'Tabla de productos';


--
-- TOC entry 214 (class 1259 OID 22445)
-- Name: tb_producto_id_pr_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_producto_id_pr_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_producto_id_pr_seq OWNER TO postgres;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 214
-- Name: tb_producto_id_pr_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_producto_id_pr_seq OWNED BY public.tb_producto.id_pr;


--
-- TOC entry 215 (class 1259 OID 22447)
-- Name: tb_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_usuario (
    id_us integer NOT NULL,
    id_per integer,
    id_est integer,
    nombre_us character varying(150),
    cedula_us character varying(20),
    correo_us character varying(150),
    clave_us text,
    ultimo_login timestamp without time zone
);


ALTER TABLE public.tb_usuario OWNER TO postgres;

--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE tb_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_usuario IS 'Tabla de usuarios del sistema';


--
-- TOC entry 216 (class 1259 OID 22453)
-- Name: tb_usuario_id_us_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_usuario_id_us_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_usuario_id_us_seq OWNER TO postgres;

--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 216
-- Name: tb_usuario_id_us_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_usuario_id_us_seq OWNED BY public.tb_usuario.id_us;


--
-- TOC entry 2913 (class 2604 OID 22985)
-- Name: tb_auditoria id_aud; Type: DEFAULT; Schema: auditoria; Owner: alumno
--

ALTER TABLE ONLY auditoria.tb_auditoria ALTER COLUMN id_aud SET DEFAULT nextval('auditoria.tb_auditoria_id_aud_seq'::regclass);


--
-- TOC entry 2905 (class 2604 OID 22455)
-- Name: tb_categoria id_cat; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_categoria ALTER COLUMN id_cat SET DEFAULT nextval('public.tb_categoria_id_cat_seq'::regclass);


--
-- TOC entry 2906 (class 2604 OID 22456)
-- Name: tb_estadocivil id_est; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_estadocivil ALTER COLUMN id_est SET DEFAULT nextval('public.tb_estadocivil_id_est_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 22457)
-- Name: tb_pagina id_pag; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_pagina ALTER COLUMN id_pag SET DEFAULT nextval('public.tb_pagina_id_pag_seq'::regclass);


--
-- TOC entry 2908 (class 2604 OID 22458)
-- Name: tb_parametros id_par; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_parametros ALTER COLUMN id_par SET DEFAULT nextval('public.tb_parametros_id_par_seq'::regclass);


--
-- TOC entry 2909 (class 2604 OID 22459)
-- Name: tb_perfil id_per; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfil ALTER COLUMN id_per SET DEFAULT nextval('public.tb_perfil_id_per_seq'::regclass);


--
-- TOC entry 2910 (class 2604 OID 22460)
-- Name: tb_perfilpagina id_perpag; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfilpagina ALTER COLUMN id_perpag SET DEFAULT nextval('public.tb_perfilpagina_id_perpag_seq'::regclass);


--
-- TOC entry 2911 (class 2604 OID 22461)
-- Name: tb_producto id_pr; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto ALTER COLUMN id_pr SET DEFAULT nextval('public.tb_producto_id_pr_seq'::regclass);


--
-- TOC entry 2912 (class 2604 OID 22462)
-- Name: tb_usuario id_us; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario ALTER COLUMN id_us SET DEFAULT nextval('public.tb_usuario_id_us_seq'::regclass);


--
-- TOC entry 3089 (class 0 OID 22982)
-- Dependencies: 218
-- Data for Name: tb_auditoria; Type: TABLE DATA; Schema: auditoria; Owner: alumno
--

COPY auditoria.tb_auditoria (id_aud, tabla_aud, operacion_aud, valoranterior_aud, valornuevo_aud, fecha_aud, usuario_aud, esquema_aud, activar_aud, trigger_aud) FROM stdin;
1	tb_usuario	\N	\N	\N	\N	\N	public	\N	t
2	tb_parametros	\N	\N	\N	\N	\N	public	\N	f
3	tb_pagina	\N	\N	\N	\N	\N	public	\N	t
4	tb_perfilpagina	\N	\N	\N	\N	\N	public	\N	t
5	tb_perfil	\N	\N	\N	\N	\N	public	\N	t
6	tb_categoria	\N	\N	\N	\N	\N	public	\N	t
7	tb_producto	\N	\N	\N	\N	\N	public	\N	t
8	tb_estadocivil	\N	\N	\N	\N	\N	public	\N	t
9	tb_estadocivil	U	(1,casado)	(1,casado/a)	2025-11-19	alumno	\N	\N	\N
10	tb_estadocivil	U	(2,soltero)	(2,soltero/a)	2025-11-19	alumno	\N	\N	\N
11	tb_estadocivil	U	(3,divorciado)	(3,divorciado/a)	2025-11-19	alumno	\N	\N	\N
12	tb_estadocivil	I	\N	(4,"Union Libre")	2025-11-19	alumno	\N	\N	\N
13	tb_estadocivil	I	\N	(5,Viudo/a)	2025-11-19	alumno	\N	\N	\N
14	tb_usuario	U	(4,1,2,admin,1724546666,admin@ieee.org,123,"2025-11-12 10:43:26.487701")	(4,1,2,admin,1724546666,admin@ieee.org,123,"2025-11-19 10:00:21.975122")	2025-11-19	postgres	\N	\N	\N
15	tb_usuario	U	(4,1,2,admin,1724546666,admin@ieee.org,123,"2025-11-19 10:00:21.975122")	(4,1,2,admin,1724546666,admin@ieee.org,123,"2025-11-19 10:13:55.900736")	2025-11-19	postgres	\N	\N	\N
16	tb_usuario	U	(4,1,2,admin,1724546666,admin@ieee.org,123,"2025-11-19 10:13:55.900736")	(4,1,2,admin,1724546666,admin@ieee.org,123,"2025-11-19 10:20:35.326068")	2025-11-19	postgres	\N	\N	\N
17	tb_usuario	I	\N	(14,2,2,"David Reyes",1714032718,"",1234,)	2025-11-19	postgres	\N	\N	\N
18	tb_usuario	U	(14,2,2,"David Reyes",1714032718,"",1234,)	(14,2,2,"David Reyes",1714032718,"",1234,"2025-11-19 10:39:50.378153")	2025-11-19	postgres	\N	\N	\N
19	tb_usuario	I	\N	(15,2,2,Jossue,1234567890,pproanog@est.ups.edu.ec,123,)	2025-11-19	postgres	\N	\N	\N
20	tb_usuario	U	(15,2,2,Jossue,1234567890,pproanog@est.ups.edu.ec,123,)	(15,2,2,Jossue,1234567890,pproanog@est.ups.edu.ec,123,"2025-11-19 10:42:39.772827")	2025-11-19	postgres	\N	\N	\N
21	tb_usuario	I	\N	(16,2,2,Alan,1729333276,aespanah@st.ups.edu.ec,alan123,)	2025-11-19	postgres	\N	\N	\N
22	tb_usuario	U	(4,1,2,admin,1724546666,admin@ieee.org,123,"2025-11-19 10:20:35.326068")	(4,1,2,admin,1724546666,admin@ieee.org,123,"2025-11-19 10:43:38.240979")	2025-11-19	postgres	\N	\N	\N
23	tb_usuario	U	(4,1,2,admin,1724546666,admin@ieee.org,123,"2025-11-19 10:43:38.240979")	(4,1,2,admin,1724546666,admin@ieee.org,123,"2025-11-19 10:44:42.509658")	2025-11-19	postgres	\N	\N	\N
\.


--
-- TOC entry 3072 (class 0 OID 22403)
-- Dependencies: 201
-- Data for Name: tb_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_categoria (id_cat, descripcion_cat) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 22408)
-- Dependencies: 203
-- Data for Name: tb_estadocivil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_estadocivil (id_est, descripcion_est) FROM stdin;
1	casado/a
2	soltero/a
3	divorciado/a
4	Union Libre
5	Viudo/a
\.


--
-- TOC entry 3076 (class 0 OID 22413)
-- Dependencies: 205
-- Data for Name: tb_pagina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_pagina (id_pag, descripcion_pag, path_pag) FROM stdin;
1	Carrito de Compras	http://172.17.44.106:8081/ppresentar/Carrito.jsp
2	Administrar Usuarios	http://172.17.44.106:8081/ppresentar/Usuarios.jsp
3	Administrar Productos	http://172.17.44.106:8081/ppresentar/Productos.jsp
4	Bitácora	http://172.17.44.106:8081/ppresentar/Bitacora.jsp
5	Cerrar Sesión	http://172.17.44.106:8081/ppresentar/cerrarSesion.jsp
6	Administrar Logs	http://172.17.44.106:8081/ppresentar/UUsuario.jsp
\.


--
-- TOC entry 3078 (class 0 OID 22421)
-- Dependencies: 207
-- Data for Name: tb_parametros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_parametros (id_par, descripcion_par, valor_par) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 22429)
-- Dependencies: 209
-- Data for Name: tb_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_perfil (id_per, descripcion_per) FROM stdin;
3	vendedor
1	administrador
2	cliente
\.


--
-- TOC entry 3082 (class 0 OID 22434)
-- Dependencies: 211
-- Data for Name: tb_perfilpagina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_perfilpagina (id_perpag, id_per, id_pag) FROM stdin;
1	1	2
2	1	3
3	1	4
4	1	5
5	2	1
6	2	5
7	3	3
9	3	5
10	1	6
\.


--
-- TOC entry 3084 (class 0 OID 22439)
-- Dependencies: 213
-- Data for Name: tb_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_producto (id_pr, id_cat, nombre_pr, cantidad_pr, precio_pr, foto_pr) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 22447)
-- Dependencies: 215
-- Data for Name: tb_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_usuario (id_us, id_per, id_est, nombre_us, cedula_us, correo_us, clave_us, ultimo_login) FROM stdin;
2	2	1	DatoPrueba	1724546009	prueba@caditos.com	567	\N
3	2	2	Davidc	1724546004	otrocorreo@gmail.com	123	\N
5	2	2	Davidcfwfwf	1724546004	otrocorreo@gmail.com	123	\N
1	2	2	David	1724546005	dcruz@ieee.org	123	2025-11-12 10:39:00.921621
6	3	2	bruce banner	1724333333	hulk@avengers.com	123	2025-11-12 10:43:13.337899
14	2	2	David Reyes	1714032718		1234	2025-11-19 10:39:50.378153
15	2	2	Jossue	1234567890	pproanog@est.ups.edu.ec	123	2025-11-19 10:42:39.772827
16	2	2	Alan	1729333276	aespanah@st.ups.edu.ec	alan123	\N
4	1	2	admin	1724546666	admin@ieee.org	123	2025-11-19 10:44:42.509658
\.


--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 217
-- Name: tb_auditoria_id_aud_seq; Type: SEQUENCE SET; Schema: auditoria; Owner: alumno
--

SELECT pg_catalog.setval('auditoria.tb_auditoria_id_aud_seq', 23, true);


--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 202
-- Name: tb_categoria_id_cat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_categoria_id_cat_seq', 1, false);


--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 204
-- Name: tb_estadocivil_id_est_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_estadocivil_id_est_seq', 1, false);


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 206
-- Name: tb_pagina_id_pag_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_pagina_id_pag_seq', 5, true);


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 208
-- Name: tb_parametros_id_par_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_parametros_id_par_seq', 1, false);


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 210
-- Name: tb_perfil_id_per_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_perfil_id_per_seq', 1, false);


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 212
-- Name: tb_perfilpagina_id_perpag_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_perfilpagina_id_perpag_seq', 10, true);


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 214
-- Name: tb_producto_id_pr_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_producto_id_pr_seq', 1, false);


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 216
-- Name: tb_usuario_id_us_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_usuario_id_us_seq', 16, true);


--
-- TOC entry 2931 (class 2606 OID 22990)
-- Name: tb_auditoria pk_tb_auditoria; Type: CONSTRAINT; Schema: auditoria; Owner: alumno
--

ALTER TABLE ONLY auditoria.tb_auditoria
    ADD CONSTRAINT pk_tb_auditoria PRIMARY KEY (id_aud);


--
-- TOC entry 2915 (class 2606 OID 22464)
-- Name: tb_categoria tb_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_categoria
    ADD CONSTRAINT tb_categoria_pkey PRIMARY KEY (id_cat);


--
-- TOC entry 2917 (class 2606 OID 22466)
-- Name: tb_estadocivil tb_estadocivil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_estadocivil
    ADD CONSTRAINT tb_estadocivil_pkey PRIMARY KEY (id_est);


--
-- TOC entry 2919 (class 2606 OID 22468)
-- Name: tb_pagina tb_pagina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_pagina
    ADD CONSTRAINT tb_pagina_pkey PRIMARY KEY (id_pag);


--
-- TOC entry 2921 (class 2606 OID 22470)
-- Name: tb_parametros tb_parametros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_parametros
    ADD CONSTRAINT tb_parametros_pkey PRIMARY KEY (id_par);


--
-- TOC entry 2923 (class 2606 OID 22472)
-- Name: tb_perfil tb_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfil
    ADD CONSTRAINT tb_perfil_pkey PRIMARY KEY (id_per);


--
-- TOC entry 2925 (class 2606 OID 22474)
-- Name: tb_perfilpagina tb_perfilpagina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfilpagina
    ADD CONSTRAINT tb_perfilpagina_pkey PRIMARY KEY (id_perpag);


--
-- TOC entry 2927 (class 2606 OID 22476)
-- Name: tb_producto tb_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT tb_producto_pkey PRIMARY KEY (id_pr);


--
-- TOC entry 2929 (class 2606 OID 22478)
-- Name: tb_usuario tb_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_pkey PRIMARY KEY (id_us);


--
-- TOC entry 2932 (class 1259 OID 22991)
-- Name: tb_auditoria_pk; Type: INDEX; Schema: auditoria; Owner: alumno
--

CREATE UNIQUE INDEX tb_auditoria_pk ON auditoria.tb_auditoria USING btree (id_aud);


--
-- TOC entry 2938 (class 2620 OID 23287)
-- Name: tb_categoria tb_categoria_tg_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tb_categoria_tg_audit AFTER INSERT OR DELETE OR UPDATE ON public.tb_categoria FOR EACH ROW EXECUTE FUNCTION public.fn_log_audit();


--
-- TOC entry 2939 (class 2620 OID 23274)
-- Name: tb_estadocivil tb_estadocivil_tg_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tb_estadocivil_tg_audit AFTER INSERT OR DELETE OR UPDATE ON public.tb_estadocivil FOR EACH ROW EXECUTE FUNCTION public.fn_log_audit();


--
-- TOC entry 2940 (class 2620 OID 23286)
-- Name: tb_producto tb_producto_tg_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tb_producto_tg_audit AFTER INSERT OR DELETE OR UPDATE ON public.tb_producto FOR EACH ROW EXECUTE FUNCTION public.fn_log_audit();


--
-- TOC entry 2941 (class 2620 OID 23288)
-- Name: tb_usuario tb_usuarios_tg_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tb_usuarios_tg_audit AFTER INSERT OR DELETE OR UPDATE ON public.tb_usuario FOR EACH ROW EXECUTE FUNCTION public.fn_log_audit();


--
-- TOC entry 2933 (class 2606 OID 22479)
-- Name: tb_perfilpagina tb_perfilpagina_id_pag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfilpagina
    ADD CONSTRAINT tb_perfilpagina_id_pag_fkey FOREIGN KEY (id_pag) REFERENCES public.tb_pagina(id_pag) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2934 (class 2606 OID 22484)
-- Name: tb_perfilpagina tb_perfilpagina_id_per_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfilpagina
    ADD CONSTRAINT tb_perfilpagina_id_per_fkey FOREIGN KEY (id_per) REFERENCES public.tb_perfil(id_per) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 22489)
-- Name: tb_producto tb_producto_id_cat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT tb_producto_id_cat_fkey FOREIGN KEY (id_cat) REFERENCES public.tb_categoria(id_cat) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2936 (class 2606 OID 22494)
-- Name: tb_usuario tb_usuario_id_est_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_id_est_fkey FOREIGN KEY (id_est) REFERENCES public.tb_estadocivil(id_est) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2937 (class 2606 OID 22499)
-- Name: tb_usuario tb_usuario_id_per_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_id_per_fkey FOREIGN KEY (id_per) REFERENCES public.tb_perfil(id_per) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-11-19 11:13:29

--
-- PostgreSQL database dump complete
--

\unrestrict AicC5XuoiaG4T3LpXkOAZFave2Wf8IURNeTT681b1Ts4ZCoJavBET3deIGjJhlB

