--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.3
-- Dumped by pg_dump version 9.0.4
-- Started on 2012-02-23 15:14:43

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 523 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 30 (class 1255 OID 41765)
-- Dependencies: 5 523
-- Name: depculminado(character varying, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION depculminado(sp_departamento character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) RETURNS TABLE(departamento character varying, sa bigint, ss bigint, so bigint, app bigint, win bigint, off bigint, otr bigint, cpu bigint, impresora bigint, monitor bigint, teclado bigint, mouse bigint, regulador bigint, conexionr bigint, conexioni bigint, total bigint)
    LANGUAGE plpgsql
    AS $$  
DECLARE 
BEGIN
RETURN QUERY SELECT 
vistaculminado.departamento AS departamento, 
sum(vistaculminado.sa) AS sa, 
sum(vistaculminado.ss) AS ss, 
sum(vistaculminado.so) AS so, 
sum(vistaculminado.app) AS app, 
sum(vistaculminado.win) AS win, 
sum(vistaculminado.off) AS off, 
sum(vistaculminado.otr) AS otr, 
sum(vistaculminado.cpu) AS cpu, 
sum(vistaculminado.impresora) AS impresora, 
sum(vistaculminado.monitor) AS monitor, 
sum(vistaculminado.teclado) AS teclado, 
sum(vistaculminado.mouse) AS mouse, 
sum(vistaculminado.regulador) AS regulador, 
sum(vistaculminado.conexionr) AS conexionr, 
sum(vistaculminado.conexioni) AS conexioni, 
sum(vistaculminado.sa) + 
sum(vistaculminado.ss) + 
sum(vistaculminado.so) + 
sum(vistaculminado.app) + 
sum(vistaculminado.win) + 
sum(vistaculminado.off) + 
sum(vistaculminado.otr) + 
sum(vistaculminado.cpu) + 
sum(vistaculminado.impresora) + 
sum(vistaculminado.monitor) + 
sum(vistaculminado.teclado) + 
sum(vistaculminado.mouse) + 
sum(vistaculminado.regulador) + 
sum(vistaculminado.conexionr) + 
sum(vistaculminado.conexioni) AS total
FROM vistaculminado
where 
vistaculminado.departamento=sp_departamento
and 
vistaculminado.fechasol between sp_fechainic and sp_fechafinal
GROUP BY vistaculminado.departamento
ORDER BY vistaculminado.departamento;
END
$$;


ALTER FUNCTION public.depculminado(sp_departamento character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 31 (class 1255 OID 41766)
-- Dependencies: 523 5
-- Name: depenrevision(character varying, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION depenrevision(sp_departamento character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) RETURNS TABLE(departamento character varying, sa bigint, ss bigint, so bigint, app bigint, win bigint, off bigint, otr bigint, cpu bigint, impresora bigint, monitor bigint, teclado bigint, mouse bigint, regulador bigint, conexionr bigint, conexioni bigint, total bigint)
    LANGUAGE plpgsql
    AS $$  
DECLARE 
BEGIN
RETURN QUERY SELECT 
vistaenrevision.departamento AS departamento, 
sum(vistaenrevision.sa) AS sa, 
sum(vistaenrevision.ss) AS ss, 
sum(vistaenrevision.so) AS so, 
sum(vistaenrevision.app) AS app, 
sum(vistaenrevision.win) AS win, 
sum(vistaenrevision.off) AS off, 
sum(vistaenrevision.otr) AS otr, 
sum(vistaenrevision.cpu) AS cpu, 
sum(vistaenrevision.impresora) AS impresora, 
sum(vistaenrevision.monitor) AS monitor, 
sum(vistaenrevision.teclado) AS teclado, 
sum(vistaenrevision.mouse) AS mouse, 
sum(vistaenrevision.regulador) AS regulador, 
sum(vistaenrevision.conexionr) AS conexionr, 
sum(vistaenrevision.conexioni) AS conexioni, 
sum(vistaenrevision.sa) + 
sum(vistaenrevision.ss) + 
sum(vistaenrevision.so) + 
sum(vistaenrevision.app) + 
sum(vistaenrevision.win) + 
sum(vistaenrevision.off) + 
sum(vistaenrevision.otr) + 
sum(vistaenrevision.cpu) + 
sum(vistaenrevision.impresora) + 
sum(vistaenrevision.monitor) + 
sum(vistaenrevision.teclado) + 
sum(vistaenrevision.mouse) + 
sum(vistaenrevision.regulador) + 
sum(vistaenrevision.conexionr) + 
sum(vistaenrevision.conexioni) AS total
FROM vistaenrevision
where 
vistaenrevision.departamento=sp_departamento
and 
vistaenrevision.fechasol between sp_fechainic and sp_fechafinal
GROUP BY vistaenrevision.departamento
ORDER BY vistaenrevision.departamento;
END
$$;


ALTER FUNCTION public.depenrevision(sp_departamento character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 32 (class 1255 OID 41767)
-- Dependencies: 523 5
-- Name: deppendiente(character varying, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION deppendiente(sp_departamento character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) RETURNS TABLE(departamento character varying, sa bigint, ss bigint, so bigint, app bigint, win bigint, off bigint, otr bigint, cpu bigint, impresora bigint, monitor bigint, teclado bigint, mouse bigint, regulador bigint, conexionr bigint, conexioni bigint, total bigint)
    LANGUAGE plpgsql
    AS $$  
DECLARE 
BEGIN
RETURN QUERY SELECT 
vistapendiente.departamento AS departamento, 
sum(vistapendiente.sa) AS sa, 
sum(vistapendiente.ss) AS ss, 
sum(vistapendiente.so) AS so, 
sum(vistapendiente.app) AS app, 
sum(vistapendiente.win) AS win, 
sum(vistapendiente.off) AS off, 
sum(vistapendiente.otr) AS otr, 
sum(vistapendiente.cpu) AS cpu, 
sum(vistapendiente.impresora) AS impresora, 
sum(vistapendiente.monitor) AS monitor, 
sum(vistapendiente.teclado) AS teclado, 
sum(vistapendiente.mouse) AS mouse, 
sum(vistapendiente.regulador) AS regulador, 
sum(vistapendiente.conexionr) AS conexionr, 
sum(vistapendiente.conexioni) AS conexioni, 
sum(vistapendiente.sa) + 
sum(vistapendiente.ss) + 
sum(vistapendiente.so) + 
sum(vistapendiente.app) + 
sum(vistapendiente.win) + 
sum(vistapendiente.off) + 
sum(vistapendiente.otr) + 
sum(vistapendiente.cpu) + 
sum(vistapendiente.impresora) + 
sum(vistapendiente.monitor) + 
sum(vistapendiente.teclado) + 
sum(vistapendiente.mouse) + 
sum(vistapendiente.regulador) + 
sum(vistapendiente.conexionr) + 
sum(vistapendiente.conexioni) AS total
FROM vistapendiente
where 
vistapendiente.departamento=sp_departamento
and 
vistapendiente.fechasol between sp_fechainic and sp_fechafinal
GROUP BY vistapendiente.departamento
ORDER BY vistapendiente.departamento;
END
$$;


ALTER FUNCTION public.deppendiente(sp_departamento character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 23 (class 1255 OID 16780)
-- Dependencies: 523 5
-- Name: proc001(character varying, character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION proc001(sp_nombre character varying, sp_responsable character varying, sp_telefono character varying, sp_descripcion character varying, sp_codigo character varying, sp_estatus integer) RETURNS void
    LANGUAGE plpgsql
    AS $$  
BEGIN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
insert into departamento (nombre, responsable, telefono, descripcion, codigo, estatus) VALUES (SP_nombre,SP_responsable,SP_telefono,SP_descripcion,SP_codigo,SP_estatus);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
END
$$;


ALTER FUNCTION public.proc001(sp_nombre character varying, sp_responsable character varying, sp_telefono character varying, sp_descripcion character varying, sp_codigo character varying, sp_estatus integer) OWNER TO postgres;

--
-- TOC entry 18 (class 1255 OID 16781)
-- Dependencies: 523 5
-- Name: proc006(bigint, character varying, character varying, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, character varying, bigint, character varying, bigint, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION proc006(sp_hdep bigint, sp_sol character varying, sp_obs character varying, sp_cpu integer, sp_imp integer, sp_mon integer, sp_tec integer, sp_mo integer, sp_re integer, sp_cr integer, sp_ci integer, sp_sa integer, sp_ss integer, sp_so integer, sp_app integer, sp_win integer, sp_off integer, sp_otr integer, sp_esp character varying, sp_ideq bigint, sp_equipo character varying, sp_htipo bigint, sp_swi integer) RETURNS bigint
    LANGUAGE plpgsql
    AS $$  
DECLARE 
Id_h bigint;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
Id_s bigint;  
Id_d bigint;
BEGIN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
insert into hardware (CPU, IMPRESORA, MONITOR, TECLADO, MOUSE, REGULADOR,CONEXIONR,CONEXIONI,OBSERVACIONES,SWITCHE) VALUES (SP_cpu,SP_imp,SP_mon,SP_tec,SP_mo,SP_re,SP_cr,SP_ci,SP_esp,SP_swi);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
select last_value from id_hardw into Id_h;
insert into software (SA, SS, SO, APLICACIONES, WINDOWS, OFFICE,OTRO,OBSERVACIONES) VALUES (SP_sa,SP_ss,SP_so,SP_app,SP_win,SP_off,SP_otr,SP_obs);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
select last_value from id_softw into ID_s;
insert into documento (FECHASOL, HDEPARTAMENTO, SOLICITANTE, HSOFTWARE, HHARDWARE,OBSERVACIONES,ESTATUS,HEQUIPO,HTIPO,EQUIPO) VALUES (now(),SP_hdep,SP_sol,Id_s,Id_h,SP_obs,0,SP_IDEQ,SP_HTIPO,SP_EQUIPO);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
select last_value from id_doc into Id_d;
RETURN Id_d;
END
$$;


ALTER FUNCTION public.proc006(sp_hdep bigint, sp_sol character varying, sp_obs character varying, sp_cpu integer, sp_imp integer, sp_mon integer, sp_tec integer, sp_mo integer, sp_re integer, sp_cr integer, sp_ci integer, sp_sa integer, sp_ss integer, sp_so integer, sp_app integer, sp_win integer, sp_off integer, sp_otr integer, sp_esp character varying, sp_ideq bigint, sp_equipo character varying, sp_htipo bigint, sp_swi integer) OWNER TO postgres;

--
-- TOC entry 19 (class 1255 OID 16782)
-- Dependencies: 523 5
-- Name: proc007(bigint, bigint, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION proc007(id_soporte bigint, sp_soporte bigint, sp_falla character varying, sp_observ character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$  
DECLARE 
Id_f bigint;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
BEGIN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
insert into fsoporte (FALLA,OBSERVACIONES) VALUES (SP_falla,SP_observ);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
select last_value from id_fsop into Id_f;
UPDATE documento SET                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
HFALLA=Id_f,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
ESTATUS=1,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
HSOPORTE=SP_soporte WHERE id=ID_soporte;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
END
$$;


ALTER FUNCTION public.proc007(id_soporte bigint, sp_soporte bigint, sp_falla character varying, sp_observ character varying) OWNER TO postgres;

--
-- TOC entry 21 (class 1255 OID 16783)
-- Dependencies: 523 5
-- Name: proc008(bigint, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION proc008(sp_hso bigint, sp_aplicaciones character varying, sp_sistemas character varying, sp_observacioness character varying) RETURNS bigint
    LANGUAGE plpgsql
    AS $$  
DECLARE 
Id_f bigint;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
BEGIN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
insert into softequip (hso, aplicaciones, sistemas, observaciones) VALUES (SP_hso,SP_aplicaciones,SP_sistemas,SP_observacioness);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
select last_value from is_softe into Id_f;
RETURN Id_f;
END
$$;


ALTER FUNCTION public.proc008(sp_hso bigint, sp_aplicaciones character varying, sp_sistemas character varying, sp_observacioness character varying) OWNER TO postgres;

--
-- TOC entry 20 (class 1255 OID 16784)
-- Dependencies: 523 5
-- Name: proc009(bigint, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION proc009(sp_iddoc bigint, sp_solucion character varying, sp_observf character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$  
DECLARE 
id_falla bigint;
BEGIN 
SELECT hfalla from documento WHERE id=SP_iddoc INTO id_falla;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
UPDATE fsoporte SET                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
solucion=SP_solucion,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
observacionesf=SP_observf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
WHERE id=id_falla;  
UPDATE documento SET                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
ESTATUS=2,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
FECHARESP=now()                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
WHERE id=SP_iddoc;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
END
$$;


ALTER FUNCTION public.proc009(sp_iddoc bigint, sp_solucion character varying, sp_observf character varying) OWNER TO postgres;

--
-- TOC entry 28 (class 1255 OID 41642)
-- Dependencies: 5 523
-- Name: rptallequipos(bigint, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rptallequipos(sp_htipo bigint, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) RETURNS TABLE(nequipo character varying, count bigint)
    LANGUAGE plpgsql
    AS $$  
DECLARE 
BEGIN
IF SP_htipo=1
THEN
	RETURN QUERY SELECT equipo,count(estatus)
	FROM cpudocumento
	where 
	fecha between sp_fechainic and sp_fechafinal
	group by equipo order by equipo;
	END IF;
IF SP_htipo=2
THEN
	RETURN QUERY SELECT equipo,count(estatus)
	FROM mondocumento
	where  
	fecha between sp_fechainic and sp_fechafinal
	group by equipo order by equipo;
END IF;
IF SP_htipo=3
THEN
	RETURN QUERY SELECT equipo,count(estatus)
	FROM tecdocumento
	where  
	fecha between sp_fechainic and sp_fechafinal
	group by equipo order by equipo;
END IF;
IF SP_htipo=4
THEN
	RETURN QUERY SELECT equipo,count(estatus)
	FROM moudocumento
	where 
	fecha between sp_fechainic and sp_fechafinal
	group by equipo order by equipo;
END IF;
IF SP_htipo=5
THEN
	RETURN QUERY SELECT equipo,count(estatus)
	FROM impdocumento
	where 
	fecha between sp_fechainic and sp_fechafinal
	group by equipo order by equipo;
END IF;
IF SP_htipo=6
THEN
	RETURN QUERY SELECT equipo,count(estatus)
	FROM regdocumento
	where 
	fecha between sp_fechainic and sp_fechafinal
	group by equipo order by equipo;
END IF;	
IF SP_htipo=15
THEN
	RETURN QUERY SELECT equipo,count(estatus)
	FROM swidocumento
	where  
	fecha between sp_fechainic and sp_fechafinal
	group by equipo order by equipo;
END IF;
END
$$;


ALTER FUNCTION public.rptallequipos(sp_htipo bigint, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 24 (class 1255 OID 59398)
-- Dependencies: 523 5
-- Name: rptcntdispositivos(bigint, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rptcntdispositivos(sp_htipo bigint, sp_modelo character varying) RETURNS TABLE(dispositivo character varying, capacidad character varying, total bigint)
    LANGUAGE plpgsql
    AS $$  
DECLARE 
BEGIN
CASE sp_htipo
    WHEN 8 
		THEN
			IF sp_modelo ='%TODOS%' 
			THEN
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			video.marca as capacidad, count(video.marca) AS total
			   FROM video, tdispositivo
			  WHERE video.htdispositivo = tdispositivo.id
			  GROUP BY tdispositivo.nombre, video.marca ORDER BY tdispositivo.nombre;
			ELSE 
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			video.marca as capacidad, count(video.marca) AS total
			   FROM video, tdispositivo
			  WHERE video.htdispositivo = tdispositivo.id AND video.marca LIKE sp_modelo
			  GROUP BY tdispositivo.nombre, video.marca ORDER BY tdispositivo.nombre;
			 END IF;
    WHEN 10 
		THEN
			IF sp_modelo = '%TODOS%' 
			THEN
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			procesador.marca as capacidad, count(procesador.marca) AS total
			   FROM procesador, tdispositivo
			  WHERE procesador.htdispositivo = tdispositivo.id 
			  GROUP BY tdispositivo.nombre, procesador.marca ORDER BY tdispositivo.nombre;
			ELSE 
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			procesador.marca as capacidad, count(procesador.marca) AS total
			   FROM procesador, tdispositivo
			  WHERE procesador.htdispositivo = tdispositivo.id AND procesador.marca LIKE sp_modelo
			  GROUP BY tdispositivo.nombre, procesador.marca ORDER BY tdispositivo.nombre;
			END IF;			
    WHEN 11 
		THEN
			IF sp_modelo = '%TODOS%' 
			THEN
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			motherboard.marca as capacidad, count(motherboard.marca) AS total
			   FROM motherboard, tdispositivo
			  WHERE motherboard.htdispositivo = tdispositivo.id 
			  GROUP BY tdispositivo.nombre, motherboard.marca ORDER BY tdispositivo.nombre;
			ELSE 
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			motherboard.marca as capacidad, count(motherboard.marca) AS total
			   FROM motherboard, tdispositivo
			  WHERE motherboard.htdispositivo = tdispositivo.id AND motherboard.marca LIKE sp_modelo
			  GROUP BY tdispositivo.nombre, motherboard.marca ORDER BY tdispositivo.nombre;
			END IF;				
    WHEN 12 
		THEN
			IF sp_modelo = '%TODOS%'  
			THEN
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			sonido.marca as capacidad, count(sonido.marca) AS total
			   FROM sonido, tdispositivo
			  WHERE sonido.htdispositivo = tdispositivo.id 
			  GROUP BY tdispositivo.nombre, sonido.marca ORDER BY tdispositivo.nombre;			  
			ELSE 
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			sonido.marca as capacidad, count(sonido.marca) AS total
			   FROM sonido, tdispositivo
			  WHERE sonido.htdispositivo = tdispositivo.id AND sonido.marca LIKE sp_modelo
			  GROUP BY tdispositivo.nombre, sonido.marca ORDER BY tdispositivo.nombre;			  
			END IF;	
    WHEN 14 
		THEN
			IF sp_modelo = '%TODOS%'  
			THEN
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			lan.marca as capacidad, count(lan.marca) AS total
			   FROM lan, tdispositivo
			  WHERE lan.htdispositivo = tdispositivo.id 
			  GROUP BY tdispositivo.nombre, lan.marca ORDER BY tdispositivo.nombre;
			ELSE
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			lan.marca as capacidad, count(lan.marca) AS total
			   FROM lan, tdispositivo
			  WHERE lan.htdispositivo = tdispositivo.id AND lan.marca LIKE sp_modelo
			  GROUP BY tdispositivo.nombre, lan.marca ORDER BY tdispositivo.nombre;
			END IF;			
    WHEN 16 
		THEN
			IF sp_modelo = '%TODOS%'  
			THEN
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			cdrom.marca as capacidad, count(cdrom.marca) AS total
			   FROM cdrom, tdispositivo
			  WHERE cdrom.htdispositivo = tdispositivo.id 
			  GROUP BY tdispositivo.nombre, cdrom.marca ORDER BY tdispositivo.nombre;
			ELSE
			RETURN QUERY SELECT tdispositivo.nombre AS dispositivo, 
			cdrom.marca as capacidad, count(cdrom.marca) AS total
			   FROM cdrom, tdispositivo
			  WHERE cdrom.htdispositivo = tdispositivo.id AND cdrom.marca LIKE sp_modelo
			  GROUP BY tdispositivo.nombre, cdrom.marca ORDER BY tdispositivo.nombre;
			END IF;			
	ELSE

END CASE;
END
$$;


ALTER FUNCTION public.rptcntdispositivos(sp_htipo bigint, sp_modelo character varying) OWNER TO postgres;

--
-- TOC entry 25 (class 1255 OID 25114)
-- Dependencies: 523 5
-- Name: rptculminado(character varying, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rptculminado(sp_soporte character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) RETURNS TABLE(soporte character varying, sa bigint, ss bigint, so bigint, app bigint, win bigint, off bigint, otr bigint, cpu bigint, impresora bigint, monitor bigint, teclado bigint, mouse bigint, regulador bigint, conexionr bigint, conexioni bigint, total bigint)
    LANGUAGE plpgsql
    AS $$  
DECLARE 
BEGIN
RETURN QUERY SELECT 
vistaculminado.soporte AS soporte, 
sum(vistaculminado.sa) AS sa, 
sum(vistaculminado.ss) AS ss, 
sum(vistaculminado.so) AS so, 
sum(vistaculminado.app) AS app, 
sum(vistaculminado.win) AS win, 
sum(vistaculminado.off) AS off, 
sum(vistaculminado.otr) AS otr, 
sum(vistaculminado.cpu) AS cpu, 
sum(vistaculminado.impresora) AS impresora, 
sum(vistaculminado.monitor) AS monitor, 
sum(vistaculminado.teclado) AS teclado, 
sum(vistaculminado.mouse) AS mouse, 
sum(vistaculminado.regulador) AS regulador, 
sum(vistaculminado.conexionr) AS conexionr, 
sum(vistaculminado.conexioni) AS conexioni, 
sum(vistaculminado.sa) + 
sum(vistaculminado.ss) + 
sum(vistaculminado.so) + 
sum(vistaculminado.app) + 
sum(vistaculminado.win) + 
sum(vistaculminado.off) + 
sum(vistaculminado.otr) + 
sum(vistaculminado.cpu) + 
sum(vistaculminado.impresora) + 
sum(vistaculminado.monitor) + 
sum(vistaculminado.teclado) + 
sum(vistaculminado.mouse) + 
sum(vistaculminado.regulador) + 
sum(vistaculminado.conexionr) + 
sum(vistaculminado.conexioni) AS total
FROM vistaculminado
where 
vistaculminado.soporte=sp_soporte
and 
vistaculminado.fechasol between sp_fechainic and sp_fechafinal
GROUP BY vistaculminado.soporte
ORDER BY vistaculminado.soporte;
END
$$;


ALTER FUNCTION public.rptculminado(sp_soporte character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 26 (class 1255 OID 25115)
-- Dependencies: 523 5
-- Name: rptenrevision(character varying, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rptenrevision(sp_soporte character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) RETURNS TABLE(soporte character varying, sa bigint, ss bigint, so bigint, app bigint, win bigint, off bigint, otr bigint, cpu bigint, impresora bigint, monitor bigint, teclado bigint, mouse bigint, regulador bigint, conexionr bigint, conexioni bigint, total bigint)
    LANGUAGE plpgsql
    AS $$  
DECLARE 
BEGIN
RETURN QUERY SELECT 
vistaenrevision.soporte AS soporte, 
sum(vistaenrevision.sa) AS sa, 
sum(vistaenrevision.ss) AS ss, 
sum(vistaenrevision.so) AS so, 
sum(vistaenrevision.app) AS app, 
sum(vistaenrevision.win) AS win, 
sum(vistaenrevision.off) AS off, 
sum(vistaenrevision.otr) AS otr, 
sum(vistaenrevision.cpu) AS cpu, 
sum(vistaenrevision.impresora) AS impresora, 
sum(vistaenrevision.monitor) AS monitor, 
sum(vistaenrevision.teclado) AS teclado, 
sum(vistaenrevision.mouse) AS mouse, 
sum(vistaenrevision.regulador) AS regulador, 
sum(vistaenrevision.conexionr) AS conexionr, 
sum(vistaenrevision.conexioni) AS conexioni, 
sum(vistaenrevision.sa) + 
sum(vistaenrevision.ss) + 
sum(vistaenrevision.so) + 
sum(vistaenrevision.app) + 
sum(vistaenrevision.win) + 
sum(vistaenrevision.off) + 
sum(vistaenrevision.otr) + 
sum(vistaenrevision.cpu) + 
sum(vistaenrevision.impresora) + 
sum(vistaenrevision.monitor) + 
sum(vistaenrevision.teclado) + 
sum(vistaenrevision.mouse) + 
sum(vistaenrevision.regulador) + 
sum(vistaenrevision.conexionr) + 
sum(vistaenrevision.conexioni) AS total
FROM vistaenrevision
where 
vistaenrevision.soporte=sp_soporte
and 
vistaenrevision.fechasol between sp_fechainic and sp_fechafinal
GROUP BY vistaenrevision.soporte
ORDER BY vistaenrevision.soporte;
END
$$;


ALTER FUNCTION public.rptenrevision(sp_soporte character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 29 (class 1255 OID 41643)
-- Dependencies: 5 523
-- Name: rptequipos(character varying, bigint, integer, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rptequipos(sp_equipo character varying, sp_htipo bigint, sp_estatus integer, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) RETURNS TABLE(nequipo character varying, count bigint)
    LANGUAGE plpgsql
    AS $$  
DECLARE 
BEGIN
IF SP_estatus=0
THEN
	IF SP_htipo=1
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM cpudocumento
		where estatus=0 and equipo=SP_equipo and  
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=2
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM mondocumento
		where  estatus=0 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=3
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM tecdocumento
		where  estatus=0 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=4
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM moudocumento
		where estatus=0 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=5
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM impdocumento
		where  estatus=0 and equipo=SP_equipo and
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=6
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM regdocumento
		where  estatus=0 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;	
	IF SP_htipo=15
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM swidocumento
		where  estatus=0 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
END IF;

IF SP_estatus=1
THEN
	IF SP_htipo=1
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM cpudocumento
		where estatus=1 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=2
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM mondocumento
		where  estatus=1 and equipo=SP_equipo and
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=3
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM tecdocumento
		where  estatus=1 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=4
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM moudocumento
		where estatus=1 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=5
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM impdocumento
		where  estatus=1 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=6
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM regdocumento
		where  estatus=1 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;	
	IF SP_htipo=15
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM swidocumento
		where  estatus=1 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
END IF;


IF SP_estatus=3
THEN
	IF SP_htipo=1
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM cpudocumento
		where estatus=3 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=2
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM mondocumento
		where  estatus=3 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=3
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM tecdocumento
		where  estatus=3 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=4
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM moudocumento
		where estatus=3 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=5
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM impdocumento
		where  estatus=3 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
	IF SP_htipo=6
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM regdocumento
		where  estatus=3 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;	
	IF SP_htipo=15
	THEN
		RETURN QUERY SELECT equipo,count(estatus)
		FROM swidocumento
		where  estatus=3 and equipo=SP_equipo and 
		fecha between sp_fechainic and sp_fechafinal
		group by equipo order by equipo;
	END IF;
END IF;
END
$$;


ALTER FUNCTION public.rptequipos(sp_equipo character varying, sp_htipo bigint, sp_estatus integer, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 27 (class 1255 OID 25116)
-- Dependencies: 523 5
-- Name: rptpendiente(character varying, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rptpendiente(sp_soporte character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) RETURNS TABLE(soporte character varying, sa bigint, ss bigint, so bigint, app bigint, win bigint, off bigint, otr bigint, cpu bigint, impresora bigint, monitor bigint, teclado bigint, mouse bigint, regulador bigint, conexionr bigint, conexioni bigint, total bigint)
    LANGUAGE plpgsql
    AS $$  
DECLARE 
BEGIN
RETURN QUERY SELECT 
vistapendiente.soporte AS soporte, 
sum(vistapendiente.sa) AS sa, 
sum(vistapendiente.ss) AS ss, 
sum(vistapendiente.so) AS so, 
sum(vistapendiente.app) AS app, 
sum(vistapendiente.win) AS win, 
sum(vistapendiente.off) AS off, 
sum(vistapendiente.otr) AS otr, 
sum(vistapendiente.cpu) AS cpu, 
sum(vistapendiente.impresora) AS impresora, 
sum(vistapendiente.monitor) AS monitor, 
sum(vistapendiente.teclado) AS teclado, 
sum(vistapendiente.mouse) AS mouse, 
sum(vistapendiente.regulador) AS regulador, 
sum(vistapendiente.conexionr) AS conexionr, 
sum(vistapendiente.conexioni) AS conexioni, 
sum(vistapendiente.sa) + 
sum(vistapendiente.ss) + 
sum(vistapendiente.so) + 
sum(vistapendiente.app) + 
sum(vistapendiente.win) + 
sum(vistapendiente.off) + 
sum(vistapendiente.otr) + 
sum(vistapendiente.cpu) + 
sum(vistapendiente.impresora) + 
sum(vistapendiente.monitor) + 
sum(vistapendiente.teclado) + 
sum(vistapendiente.mouse) + 
sum(vistapendiente.regulador) + 
sum(vistapendiente.conexionr) + 
sum(vistapendiente.conexioni) AS total
FROM vistapendiente
where 
vistapendiente.soporte=sp_soporte
and 
vistapendiente.fechasol between sp_fechainic and sp_fechafinal
GROUP BY vistapendiente.soporte
ORDER BY vistapendiente.soporte;
END
$$;


ALTER FUNCTION public.rptpendiente(sp_soporte character varying, sp_fechainic timestamp without time zone, sp_fechafinal timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 22 (class 1255 OID 33249)
-- Dependencies: 5 523
-- Name: secuenciatemporal(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION secuenciatemporal() RETURNS bigint
    LANGUAGE plpgsql
    AS $$  
DECLARE
i bigint;
BEGIN
	SELECT last_value from id_temp into i;
	i=i+1;
	SELECT setval('id_temp',i,true);
	RETURN i;
END
$$;


ALTER FUNCTION public.secuenciatemporal() OWNER TO postgres;

--
-- TOC entry 1784 (class 1259 OID 25117)
-- Dependencies: 5
-- Name: id_asign; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_asign
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_asign OWNER TO postgres;

--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 1784
-- Name: id_asign; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_asign', 12, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1785 (class 1259 OID 25119)
-- Dependencies: 2151 5
-- Name: asignadas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE asignadas (
    id bigint DEFAULT nextval('id_asign'::regclass) NOT NULL,
    fechayhora timestamp without time zone NOT NULL,
    hdocumento bigint,
    estatus integer,
    hsoporte bigint
);


ALTER TABLE public.asignadas OWNER TO postgres;

--
-- TOC entry 1746 (class 1259 OID 16544)
-- Dependencies: 5
-- Name: id_audit; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_audit
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_audit OWNER TO postgres;

--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 1746
-- Name: id_audit; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_audit', 2174, true);


--
-- TOC entry 1786 (class 1259 OID 25125)
-- Dependencies: 2152 5
-- Name: auditoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auditoria (
    id bigint DEFAULT nextval('id_audit'::regclass) NOT NULL,
    loggin character varying(50),
    fechayhora timestamp without time zone NOT NULL,
    hmenu bigint
);


ALTER TABLE public.auditoria OWNER TO postgres;

--
-- TOC entry 1795 (class 1259 OID 33260)
-- Dependencies: 5
-- Name: id_cambio; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_cambio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.id_cambio OWNER TO postgres;

--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 1795
-- Name: id_cambio; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_cambio', 1, true);


--
-- TOC entry 1796 (class 1259 OID 33262)
-- Dependencies: 2155 5
-- Name: cambios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cambios (
    id bigint DEFAULT nextval('id_cambio'::regclass) NOT NULL,
    horigen bigint,
    hdestino bigint,
    motivo character varying(250),
    fecha timestamp with time zone,
    htipo bigint,
    hdispositivo bigint
);


ALTER TABLE public.cambios OWNER TO postgres;

--
-- TOC entry 1811 (class 1259 OID 59366)
-- Dependencies: 5
-- Name: capacidaddd; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE capacidaddd (
    id bigint NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.capacidaddd OWNER TO postgres;

--
-- TOC entry 1812 (class 1259 OID 59371)
-- Dependencies: 5
-- Name: capacidadram; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE capacidadram (
    id bigint NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.capacidadram OWNER TO postgres;

--
-- TOC entry 1813 (class 1259 OID 59376)
-- Dependencies: 5
-- Name: id_cartucho; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_cartucho
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_cartucho OWNER TO postgres;

--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 1813
-- Name: id_cartucho; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_cartucho', 1, false);


--
-- TOC entry 1814 (class 1259 OID 59378)
-- Dependencies: 2156 5
-- Name: cartuchos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cartuchos (
    id bigint DEFAULT nextval('id_cartucho'::regclass) NOT NULL,
    marca character varying(150),
    modelo character varying(150),
    serial character varying(150),
    htdispositivo bigint,
    estatus integer,
    numero character varying(150),
    observaciones character varying(250),
    htipo bigint,
    himpresora bigint
);


ALTER TABLE public.cartuchos OWNER TO postgres;

--
-- TOC entry 1715 (class 1259 OID 16396)
-- Dependencies: 5
-- Name: cdrom; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cdrom (
    id bigint NOT NULL,
    numero character varying(150),
    serial character varying(150),
    modelo character varying(150),
    hequipo bigint,
    htdispositivo bigint,
    marca character varying(50)
);


ALTER TABLE public.cdrom OWNER TO postgres;

--
-- TOC entry 1747 (class 1259 OID 16549)
-- Dependencies: 5
-- Name: id_dep; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_dep
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_dep OWNER TO postgres;

--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 1747
-- Name: id_dep; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_dep', 23, true);


--
-- TOC entry 1716 (class 1259 OID 16399)
-- Dependencies: 2136 5
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departamento (
    id bigint DEFAULT nextval('id_dep'::regclass) NOT NULL,
    nombre character varying(150),
    responsable character varying(150),
    telefono character varying(20),
    descripcion character varying(250),
    codigo character varying(20),
    estatus integer
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- TOC entry 1748 (class 1259 OID 16553)
-- Dependencies: 5
-- Name: id_doc; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_doc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_doc OWNER TO postgres;

--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 1748
-- Name: id_doc; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_doc', 47, true);


--
-- TOC entry 1718 (class 1259 OID 16411)
-- Dependencies: 2137 5
-- Name: documento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documento (
    id bigint DEFAULT nextval('id_doc'::regclass) NOT NULL,
    fechasol timestamp without time zone,
    hdepartamento bigint,
    solicitante character varying(150),
    hsoftware bigint,
    hhardware bigint,
    observaciones character varying(250),
    hfalla bigint,
    estatus integer,
    fecharesp timestamp without time zone,
    hsoporte bigint,
    hequipo bigint,
    htipo bigint,
    equipo character varying(150)
);


ALTER TABLE public.documento OWNER TO postgres;

--
-- TOC entry 1719 (class 1259 OID 16417)
-- Dependencies: 5
-- Name: equipos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE equipos (
    id bigint NOT NULL,
    serial character varying(150),
    marca character varying(150),
    htipo bigint,
    responsable character varying(150),
    hdepartamento bigint,
    estatus integer,
    hsoftware bigint,
    observaciones character varying(250),
    nombre character varying(10),
    numero character varying(50)
);


ALTER TABLE public.equipos OWNER TO postgres;

--
-- TOC entry 1759 (class 1259 OID 16575)
-- Dependencies: 5
-- Name: id_tipoeq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_tipoeq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_tipoeq OWNER TO postgres;

--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 1759
-- Name: id_tipoeq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_tipoeq', 1, false);


--
-- TOC entry 1743 (class 1259 OID 16531)
-- Dependencies: 2149 5
-- Name: tipoequipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipoequipo (
    id bigint DEFAULT nextval('id_tipoeq'::regclass) NOT NULL,
    nombre character varying(150)
);


ALTER TABLE public.tipoequipo OWNER TO postgres;

--
-- TOC entry 1803 (class 1259 OID 41614)
-- Dependencies: 1935 5
-- Name: cpudocumento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW cpudocumento AS
    SELECT documento.id, documento.fechasol AS fecha, documento.solicitante, departamento.nombre AS departamento, tipoequipo.nombre AS tipo, documento.equipo, documento.hequipo, documento.estatus FROM documento, departamento, equipos, tipoequipo WHERE (((departamento.id = documento.hdepartamento) AND (tipoequipo.id = documento.htipo)) AND (documento.hequipo = equipos.id)) ORDER BY documento.fechasol;


ALTER TABLE public.cpudocumento OWNER TO postgres;

--
-- TOC entry 1758 (class 1259 OID 16573)
-- Dependencies: 5
-- Name: id_temp; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_temp
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99
    CACHE 1
    CYCLE;


ALTER TABLE public.id_temp OWNER TO postgres;

--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 1758
-- Name: id_temp; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_temp', 52, true);


--
-- TOC entry 1789 (class 1259 OID 33234)
-- Dependencies: 2153 5
-- Name: desincorporados; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE desincorporados (
    id bigint DEFAULT nextval('id_temp'::regclass) NOT NULL,
    serial character varying(50),
    marca character varying(50),
    numero character varying(50),
    htdispositivo bigint,
    capacidad character varying(50),
    htipo bigint,
    hequipo bigint,
    clave bigint,
    motivo character varying(250),
    fecha timestamp with time zone
);


ALTER TABLE public.desincorporados OWNER TO postgres;

--
-- TOC entry 1717 (class 1259 OID 16405)
-- Dependencies: 5
-- Name: discoduro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE discoduro (
    id bigint NOT NULL,
    serial character varying(150),
    marca character varying(150),
    numero character varying(150),
    htdispositivo bigint,
    capacidad character varying(150),
    hequipo bigint,
    hcapacidaddd bigint
);


ALTER TABLE public.discoduro OWNER TO postgres;

--
-- TOC entry 1749 (class 1259 OID 16555)
-- Dependencies: 5
-- Name: id_estatus; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_estatus
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_estatus OWNER TO postgres;

--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 1749
-- Name: id_estatus; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_estatus', 1, false);


--
-- TOC entry 1720 (class 1259 OID 16423)
-- Dependencies: 2138 5
-- Name: estatus; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus (
    id integer DEFAULT nextval('id_estatus'::regclass) NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.estatus OWNER TO postgres;

--
-- TOC entry 1750 (class 1259 OID 16557)
-- Dependencies: 5
-- Name: id_fsop; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_fsop
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_fsop OWNER TO postgres;

--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 1750
-- Name: id_fsop; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_fsop', 11, true);


--
-- TOC entry 1721 (class 1259 OID 16426)
-- Dependencies: 2139 5
-- Name: fsoporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fsoporte (
    id bigint DEFAULT nextval('id_fsop'::regclass) NOT NULL,
    falla character varying(250),
    solucion character varying(250),
    observaciones character varying(250),
    observacionesf character varying(250)
);


ALTER TABLE public.fsoporte OWNER TO postgres;

--
-- TOC entry 1751 (class 1259 OID 16559)
-- Dependencies: 5
-- Name: id_harde; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_harde
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_harde OWNER TO postgres;

--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 1751
-- Name: id_harde; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_harde', 1, false);


--
-- TOC entry 1722 (class 1259 OID 16432)
-- Dependencies: 2140 5
-- Name: hardequip; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hardequip (
    id bigint DEFAULT nextval('id_harde'::regclass) NOT NULL,
    ram bigint,
    discoduro bigint,
    procesador bigint,
    cdrom bigint,
    red bigint,
    video bigint,
    sonido bigint,
    mac character varying(50),
    observaciones character varying(250),
    motherboard bigint
);


ALTER TABLE public.hardequip OWNER TO postgres;

--
-- TOC entry 1752 (class 1259 OID 16561)
-- Dependencies: 5
-- Name: id_hardw; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_hardw
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_hardw OWNER TO postgres;

--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 1752
-- Name: id_hardw; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_hardw', 47, true);


--
-- TOC entry 1723 (class 1259 OID 16435)
-- Dependencies: 2141 5
-- Name: hardware; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hardware (
    id bigint DEFAULT nextval('id_hardw'::regclass) NOT NULL,
    cpu integer,
    impresora integer,
    monitor integer,
    teclado integer,
    mouse integer,
    regulador integer,
    conexionr integer,
    conexioni integer,
    observaciones character varying(250),
    switche integer
);


ALTER TABLE public.hardware OWNER TO postgres;

--
-- TOC entry 1794 (class 1259 OID 33258)
-- Dependencies: 5
-- Name: id_equipo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_equipo
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1
    CYCLE;


ALTER TABLE public.id_equipo OWNER TO postgres;

--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 1794
-- Name: id_equipo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_equipo', 734, true);


--
-- TOC entry 1753 (class 1259 OID 16563)
-- Dependencies: 5
-- Name: id_menu; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_menu
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_menu OWNER TO postgres;

--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 1753
-- Name: id_menu; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_menu', 41, true);


--
-- TOC entry 1755 (class 1259 OID 16567)
-- Dependencies: 5
-- Name: id_softw; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_softw
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_softw OWNER TO postgres;

--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 1755
-- Name: id_softw; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_softw', 47, true);


--
-- TOC entry 1756 (class 1259 OID 16569)
-- Dependencies: 5
-- Name: id_soper; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_soper
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_soper OWNER TO postgres;

--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 1756
-- Name: id_soper; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_soper', 9, true);


--
-- TOC entry 1779 (class 1259 OID 16847)
-- Dependencies: 5
-- Name: id_soport; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_soport
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_soport OWNER TO postgres;

--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 1779
-- Name: id_soport; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_soport', 13, true);


--
-- TOC entry 1757 (class 1259 OID 16571)
-- Dependencies: 5
-- Name: id_tdisp; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_tdisp
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_tdisp OWNER TO postgres;

--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 1757
-- Name: id_tdisp; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_tdisp', 40, true);


--
-- TOC entry 1790 (class 1259 OID 33241)
-- Dependencies: 5
-- Name: id_tipousu; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_tipousu
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_tipousu OWNER TO postgres;

--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 1790
-- Name: id_tipousu; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_tipousu', 3, false);


--
-- TOC entry 1760 (class 1259 OID 16577)
-- Dependencies: 5
-- Name: id_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_usuario OWNER TO postgres;

--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 1760
-- Name: id_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_usuario', 45, true);


--
-- TOC entry 1724 (class 1259 OID 16438)
-- Dependencies: 5
-- Name: impresoras; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE impresoras (
    id bigint NOT NULL,
    marca character varying(150),
    modelo character varying(150),
    serial character varying(150),
    htdispositivo bigint,
    responsable character varying(150),
    hdepartamento bigint,
    estatus integer,
    numero character varying(150),
    observaciones character varying(250),
    htipo bigint,
    nombre character varying(10)
);


ALTER TABLE public.impresoras OWNER TO postgres;

--
-- TOC entry 1804 (class 1259 OID 41618)
-- Dependencies: 1936 5
-- Name: impdocumento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW impdocumento AS
    SELECT documento.id, documento.fechasol AS fecha, documento.solicitante, departamento.nombre AS departamento, tipoequipo.nombre AS tipo, documento.equipo, documento.hequipo, documento.estatus FROM documento, departamento, impresoras, tipoequipo WHERE (((departamento.id = documento.hdepartamento) AND (tipoequipo.id = documento.htipo)) AND (documento.hequipo = impresoras.id)) ORDER BY documento.fechasol;


ALTER TABLE public.impdocumento OWNER TO postgres;

--
-- TOC entry 1754 (class 1259 OID 16565)
-- Dependencies: 5
-- Name: is_softe; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE is_softe
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.is_softe OWNER TO postgres;

--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 1754
-- Name: is_softe; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('is_softe', 113, true);


--
-- TOC entry 1725 (class 1259 OID 16444)
-- Dependencies: 5
-- Name: lan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lan (
    id bigint NOT NULL,
    marca character varying(150),
    numero character varying(150),
    serial character varying(150),
    modelo character varying(150),
    htdispositivo bigint,
    hequipo bigint
);


ALTER TABLE public.lan OWNER TO postgres;

--
-- TOC entry 1726 (class 1259 OID 16450)
-- Dependencies: 2142 5
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menu (
    id bigint DEFAULT nextval('id_menu'::regclass) NOT NULL,
    nombre character varying(150),
    ruta character varying(50),
    img character varying(20),
    hpadre bigint,
    estatus integer,
    nivel integer
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- TOC entry 1727 (class 1259 OID 16453)
-- Dependencies: 5
-- Name: monitores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE monitores (
    id bigint NOT NULL,
    serial character varying(150),
    marca character varying(150),
    numero character varying(150),
    responsable character varying(150),
    hdepartamento bigint,
    estatus integer,
    observaciones character varying(250),
    htipo bigint,
    nombre character varying(10),
    modelo character varying(150),
    htdispositivo bigint
);


ALTER TABLE public.monitores OWNER TO postgres;

--
-- TOC entry 1805 (class 1259 OID 41622)
-- Dependencies: 1937 5
-- Name: mondocumento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW mondocumento AS
    SELECT documento.id, documento.fechasol AS fecha, documento.solicitante, departamento.nombre AS departamento, tipoequipo.nombre AS tipo, documento.equipo, documento.hequipo, documento.estatus FROM documento, departamento, monitores, tipoequipo WHERE (((departamento.id = documento.hdepartamento) AND (tipoequipo.id = documento.htipo)) AND (documento.hequipo = monitores.id)) ORDER BY documento.fechasol;


ALTER TABLE public.mondocumento OWNER TO postgres;

--
-- TOC entry 1728 (class 1259 OID 16459)
-- Dependencies: 5
-- Name: motherboard; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE motherboard (
    id bigint NOT NULL,
    modelo character varying(150),
    serial character varying(150),
    numero character varying(150),
    marca character varying(150),
    hequipo bigint,
    htdispositivo bigint
);


ALTER TABLE public.motherboard OWNER TO postgres;

--
-- TOC entry 1729 (class 1259 OID 16465)
-- Dependencies: 5
-- Name: mouse; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mouse (
    id bigint NOT NULL,
    marca character varying(50),
    modelo character varying(50),
    serial character varying(50),
    htdispositivo bigint,
    numero character varying(50),
    responsable character varying(150),
    hdepartamento bigint,
    estatus integer,
    observaciones character varying(250),
    nombre character varying(10),
    htipo bigint
);


ALTER TABLE public.mouse OWNER TO postgres;

--
-- TOC entry 1806 (class 1259 OID 41626)
-- Dependencies: 1938 5
-- Name: moudocumento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW moudocumento AS
    SELECT documento.id, documento.fechasol AS fecha, documento.solicitante, departamento.nombre AS departamento, tipoequipo.nombre AS tipo, documento.equipo, documento.hequipo, documento.estatus FROM documento, departamento, mouse, tipoequipo WHERE (((departamento.id = documento.hdepartamento) AND (tipoequipo.id = documento.htipo)) AND (documento.hequipo = mouse.id)) ORDER BY documento.fechasol;


ALTER TABLE public.moudocumento OWNER TO postgres;

--
-- TOC entry 1730 (class 1259 OID 16471)
-- Dependencies: 5
-- Name: nivel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nivel (
    id bigint NOT NULL,
    nombre character varying(150)
);


ALTER TABLE public.nivel OWNER TO postgres;

--
-- TOC entry 1731 (class 1259 OID 16474)
-- Dependencies: 5
-- Name: procesador; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE procesador (
    id bigint NOT NULL,
    serial character varying(150),
    modelo character varying(150),
    marca character varying(150),
    numero character varying(150),
    hequipo bigint,
    htdispositivo bigint
);


ALTER TABLE public.procesador OWNER TO postgres;

--
-- TOC entry 1732 (class 1259 OID 16480)
-- Dependencies: 5
-- Name: ram; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ram (
    id bigint NOT NULL,
    serial character varying(150),
    numero character varying(150),
    marca character varying(150),
    capacidad character varying(150),
    hequipo bigint,
    htdispositivo bigint,
    hcapacidadram bigint
);


ALTER TABLE public.ram OWNER TO postgres;

--
-- TOC entry 1733 (class 1259 OID 16486)
-- Dependencies: 5
-- Name: reguladores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reguladores (
    id bigint NOT NULL,
    serial character varying(150),
    marca character varying(150),
    numero character varying(150),
    htipo bigint,
    responsable character varying(150),
    hdepartamento bigint,
    estatus integer,
    observaciones character varying(250),
    nombre character varying(10),
    htdispositivo bigint,
    modelo character varying(150)
);


ALTER TABLE public.reguladores OWNER TO postgres;

--
-- TOC entry 1807 (class 1259 OID 41630)
-- Dependencies: 1939 5
-- Name: regdocumento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW regdocumento AS
    SELECT documento.id, documento.fechasol AS fecha, documento.solicitante, departamento.nombre AS departamento, tipoequipo.nombre AS tipo, documento.equipo, documento.hequipo, documento.estatus FROM documento, departamento, reguladores, tipoequipo WHERE (((departamento.id = documento.hdepartamento) AND (tipoequipo.id = documento.htipo)) AND (documento.hequipo = reguladores.id)) ORDER BY documento.fechasol;


ALTER TABLE public.regdocumento OWNER TO postgres;

--
-- TOC entry 1734 (class 1259 OID 16492)
-- Dependencies: 2143 5
-- Name: softequip; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE softequip (
    id bigint DEFAULT nextval('is_softe'::regclass) NOT NULL,
    hso bigint,
    aplicaciones character varying(250),
    sistemas character varying(250),
    office character varying(250),
    observaciones character varying(250)
);


ALTER TABLE public.softequip OWNER TO postgres;

--
-- TOC entry 1735 (class 1259 OID 16498)
-- Dependencies: 2144 5
-- Name: software; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE software (
    id bigint DEFAULT nextval('id_softw'::regclass) NOT NULL,
    sa integer,
    ss integer,
    so integer,
    aplicaciones integer,
    windows integer,
    office integer,
    otro integer,
    observaciones character varying(250)
);


ALTER TABLE public.software OWNER TO postgres;

--
-- TOC entry 1736 (class 1259 OID 16501)
-- Dependencies: 5
-- Name: sonido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sonido (
    id bigint NOT NULL,
    marca character varying(150),
    modelo character varying(150),
    serial character varying(150),
    numero character varying(150),
    htdispositivo bigint,
    hequipo bigint
);


ALTER TABLE public.sonido OWNER TO postgres;

--
-- TOC entry 1737 (class 1259 OID 16507)
-- Dependencies: 2145 5
-- Name: soperativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE soperativo (
    id bigint DEFAULT nextval('id_soper'::regclass) NOT NULL,
    nombre character varying(150)
);


ALTER TABLE public.soperativo OWNER TO postgres;

--
-- TOC entry 1738 (class 1259 OID 16510)
-- Dependencies: 2146 5
-- Name: soporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE soporte (
    id bigint DEFAULT nextval('id_soport'::regclass) NOT NULL,
    nombre character varying(250),
    husuario bigint,
    estatus integer
);


ALTER TABLE public.soporte OWNER TO postgres;

--
-- TOC entry 1739 (class 1259 OID 16513)
-- Dependencies: 5
-- Name: switches; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE switches (
    id bigint NOT NULL,
    serial character varying(150),
    marca character varying(150),
    numero character varying(150),
    responsable character varying(150),
    hdepartamento bigint,
    estatus integer,
    observaciones character varying(250),
    nombre character varying(150)
);


ALTER TABLE public.switches OWNER TO postgres;

--
-- TOC entry 1808 (class 1259 OID 41634)
-- Dependencies: 1940 5
-- Name: swidocumento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW swidocumento AS
    SELECT documento.id, documento.fechasol AS fecha, documento.solicitante, departamento.nombre AS departamento, tipoequipo.nombre AS tipo, documento.equipo, documento.hequipo, documento.estatus FROM documento, departamento, switches, tipoequipo WHERE (((departamento.id = documento.hdepartamento) AND (tipoequipo.id = documento.htipo)) AND (documento.hequipo = switches.id)) ORDER BY documento.fechasol;


ALTER TABLE public.swidocumento OWNER TO postgres;

--
-- TOC entry 1740 (class 1259 OID 16519)
-- Dependencies: 2147 5
-- Name: tdispositivo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdispositivo (
    id bigint DEFAULT nextval('id_tdisp'::regclass) NOT NULL,
    nombre character varying(150),
    htipo bigint
);


ALTER TABLE public.tdispositivo OWNER TO postgres;

--
-- TOC entry 1741 (class 1259 OID 16522)
-- Dependencies: 5
-- Name: teclados; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE teclados (
    id bigint NOT NULL,
    serial character varying(150),
    marca character varying(150),
    numero character varying(150),
    htipo bigint,
    responsable character varying(150),
    hdepartamento bigint,
    estatus integer,
    observaciones character varying(250),
    nombre character varying(10),
    htdispositivo bigint,
    modelo character varying(150)
);


ALTER TABLE public.teclados OWNER TO postgres;

--
-- TOC entry 1809 (class 1259 OID 41638)
-- Dependencies: 1941 5
-- Name: tecdocumento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW tecdocumento AS
    SELECT documento.id, documento.fechasol AS fecha, documento.solicitante, departamento.nombre AS departamento, tipoequipo.nombre AS tipo, documento.equipo, documento.hequipo, documento.estatus FROM documento, departamento, teclados, tipoequipo WHERE (((departamento.id = documento.hdepartamento) AND (tipoequipo.id = documento.htipo)) AND (documento.hequipo = teclados.id)) ORDER BY documento.fechasol;


ALTER TABLE public.tecdocumento OWNER TO postgres;

--
-- TOC entry 1742 (class 1259 OID 16528)
-- Dependencies: 2148 5
-- Name: temporal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE temporal (
    id bigint DEFAULT nextval('id_temp'::regclass) NOT NULL,
    serial character varying(50),
    marca character varying(50),
    numero character varying(50),
    htdispositivo bigint,
    capacidad character varying(50),
    htipo bigint,
    hequipo bigint,
    clave bigint
);


ALTER TABLE public.temporal OWNER TO postgres;

--
-- TOC entry 1791 (class 1259 OID 33243)
-- Dependencies: 2154 5
-- Name: tipousuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipousuario (
    id bigint DEFAULT nextval('id_tipousu'::regclass) NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.tipousuario OWNER TO postgres;

--
-- TOC entry 1744 (class 1259 OID 16534)
-- Dependencies: 2150 5
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id bigint DEFAULT nextval('id_usuario'::regclass) NOT NULL,
    loggin character varying(8),
    password character varying(50),
    nombre character varying(150),
    estatus integer,
    hnivel bigint,
    hdepartamento bigint
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 1761 (class 1259 OID 16685)
-- Dependencies: 1903 5
-- Name: v1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v1 AS
    SELECT documento.id, documento.fechasol AS fecha, departamento.nombre AS departamento, documento.solicitante, software.sa, software.ss, software.so, software.aplicaciones AS app, software.windows AS win, software.office AS off, software.otro AS otr, software.observaciones AS observacioness, hardware.cpu, hardware.impresora, hardware.monitor, hardware.teclado, hardware.mouse, hardware.regulador, hardware.conexionr, hardware.conexioni, hardware.observaciones AS observacionesh, documento.estatus, hardware.switche FROM documento, departamento, software, hardware WHERE (((documento.hdepartamento = departamento.id) AND (documento.hsoftware = software.id)) AND (documento.hhardware = hardware.id)) ORDER BY documento.id;


ALTER TABLE public.v1 OWNER TO postgres;

--
-- TOC entry 1762 (class 1259 OID 16690)
-- Dependencies: 1904 5
-- Name: v2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v2 AS
    SELECT documento.id, documento.fechasol, departamento.nombre AS departamento, documento.solicitante, documento.fecharesp, soporte.nombre AS soporte, fsoporte.falla, fsoporte.observaciones AS observacionesf, fsoporte.solucion, software.sa, software.ss, software.so, software.aplicaciones AS app, software.windows AS win, software.office AS off, software.otro AS otr, software.observaciones AS observacioness, hardware.cpu, hardware.impresora, hardware.monitor, hardware.teclado, hardware.mouse, hardware.regulador, hardware.conexionr, hardware.conexioni, hardware.observaciones AS observacionesh, documento.hequipo FROM documento, departamento, software, hardware, soporte, fsoporte WHERE (((((documento.hdepartamento = departamento.id) AND (documento.hsoftware = software.id)) AND (documento.hhardware = hardware.id)) AND (documento.hsoporte = soporte.id)) AND (documento.hfalla = fsoporte.id)) ORDER BY documento.id;


ALTER TABLE public.v2 OWNER TO postgres;

--
-- TOC entry 1770 (class 1259 OID 16724)
-- Dependencies: 1912 5
-- Name: v10; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v10 AS
    SELECT v2.soporte, v2.fecharesp AS fecha, sum(v2.sa) AS sa, sum(v2.ss) AS ss, sum(v2.so) AS so, sum(v2.app) AS app, sum(v2.win) AS win, sum(v2.off) AS off, sum(v2.otr) AS otr, sum(v2.cpu) AS cpu, sum(v2.impresora) AS impresora, sum(v2.monitor) AS monitor, sum(v2.teclado) AS teclado, sum(v2.mouse) AS mouse, sum(v2.regulador) AS regulador, sum(v2.conexionr) AS conexionr, sum(v2.conexioni) AS conexioni, ((((((((((((((sum(v2.sa) + sum(v2.ss)) + sum(v2.so)) + sum(v2.app)) + sum(v2.win)) + sum(v2.off)) + sum(v2.otr)) + sum(v2.cpu)) + sum(v2.impresora)) + sum(v2.monitor)) + sum(v2.teclado)) + sum(v2.mouse)) + sum(v2.regulador)) + sum(v2.conexionr)) + sum(v2.conexioni)) AS total FROM v2 GROUP BY v2.soporte, v2.fecharesp ORDER BY v2.soporte;


ALTER TABLE public.v10 OWNER TO postgres;

--
-- TOC entry 1745 (class 1259 OID 16537)
-- Dependencies: 5
-- Name: video; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE video (
    id bigint NOT NULL,
    serial character varying(150),
    numero character varying(150),
    marca character varying(150),
    modelo character varying(150),
    htdispositivo bigint,
    hequipo bigint
);


ALTER TABLE public.video OWNER TO postgres;

--
-- TOC entry 1771 (class 1259 OID 16729)
-- Dependencies: 1913 5
-- Name: v11; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v11 AS
    SELECT equipos.id AS ideq, equipos.nombre, equipos.responsable, departamento.nombre AS departamento, softequip.aplicaciones, softequip.sistemas, soperativo.nombre AS soperativo, equipos.marca AS marcaeq, equipos.serial AS serialeq, equipos.numero AS numeroeq, equipos.observaciones AS observacioneseq, ram.serial AS serialram, ram.numero AS numram, ram.marca AS marcaram, ram.capacidad AS capram, discoduro.serial AS serialdd, discoduro.numero AS numerodd, discoduro.marca AS marcadd, discoduro.capacidad AS capdd, procesador.serial AS serialcpu, procesador.numero AS modelocpu, procesador.modelo AS capcpu, procesador.marca AS marcacpu, motherboard.serial AS serialmb, motherboard.modelo AS modelomb, motherboard.numero AS numeromb, motherboard.marca AS marcamb, lan.numero AS numerolan, lan.marca AS marcalan, lan.serial AS seriallan, lan.modelo AS maclan, video.serial AS serialvideo, video.marca AS marcavideo, video.modelo AS modelovideo, video.numero AS numerovideo, sonido.serial AS serialsonido, sonido.marca AS marcasonido, sonido.modelo AS modelosonido, sonido.numero AS numerosonido, impresoras.marca AS marcaimp, impresoras.numero AS numeroimp, impresoras.serial AS serialimp, monitores.marca AS marcamon, monitores.numero AS numeromon, monitores.serial AS serialmon, teclados.marca AS marcatec, teclados.numero AS numerotec, teclados.serial AS serialtec, mouse.marca AS marcamou, mouse.numero AS numeromou, mouse.serial AS serialmou, reguladores.marca AS marcareg, reguladores.numero AS numeroreg, reguladores.serial AS serialreg FROM equipos, monitores, impresoras, mouse, teclados, reguladores, departamento, softequip, soperativo, ram, discoduro, procesador, motherboard, lan, video, sonido WHERE ((((((((((((((((monitores.nombre)::text = (equipos.nombre)::text) AND ((impresoras.nombre)::text = (equipos.nombre)::text)) AND ((mouse.nombre)::text = (equipos.nombre)::text)) AND ((reguladores.nombre)::text = (equipos.nombre)::text)) AND ((teclados.nombre)::text = (equipos.nombre)::text)) AND (departamento.id = equipos.hdepartamento)) AND (softequip.id = equipos.hsoftware)) AND (soperativo.id = softequip.hso)) AND (ram.hequipo = equipos.id)) AND (motherboard.hequipo = equipos.id)) AND (procesador.hequipo = equipos.id)) AND (lan.hequipo = equipos.id)) AND (video.hequipo = equipos.id)) AND (sonido.hequipo = equipos.id)) AND (discoduro.hequipo = equipos.id)) ORDER BY equipos.marca;


ALTER TABLE public.v11 OWNER TO postgres;

--
-- TOC entry 1763 (class 1259 OID 16695)
-- Dependencies: 1905 5
-- Name: v3; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v3 AS
    SELECT equipos.serial, equipos.htipo, equipos.marca, tipoequipo.nombre AS tipo, equipos.id AS idequ FROM equipos, tipoequipo WHERE (tipoequipo.id = equipos.htipo);


ALTER TABLE public.v3 OWNER TO postgres;

--
-- TOC entry 1764 (class 1259 OID 16699)
-- Dependencies: 1906 5
-- Name: v4; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v4 AS
    SELECT v1.departamento, sum(v1.cpu) AS cpu, sum(v1.impresora) AS impresora, sum(v1.monitor) AS monitor, sum(v1.teclado) AS teclado, sum(v1.mouse) AS mouse, sum(v1.regulador) AS regulador, sum(v1.conexionr) AS conexionr, sum(v1.conexioni) AS conexioni FROM v1 GROUP BY v1.departamento;


ALTER TABLE public.v4 OWNER TO postgres;

--
-- TOC entry 1765 (class 1259 OID 16703)
-- Dependencies: 1907 5
-- Name: v5; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v5 AS
    SELECT v2.departamento, sum(v2.cpu) AS cpu, sum(v2.impresora) AS impresora, sum(v2.monitor) AS monitor, sum(v2.teclado) AS teclado, sum(v2.mouse) AS mouse, sum(v2.regulador) AS regulador, sum(v2.conexionr) AS conexionr, sum(v2.conexioni) AS conexioni FROM v2 GROUP BY v2.departamento;


ALTER TABLE public.v5 OWNER TO postgres;

--
-- TOC entry 1766 (class 1259 OID 16707)
-- Dependencies: 1908 5
-- Name: v6; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v6 AS
    SELECT v4.departamento, v4.cpu AS cpurep, v5.cpu AS cpures, ((v5.cpu / v4.cpu) * 100) AS cpup, v4.impresora AS impresorarep, v5.impresora AS impresorares, ((v5.impresora / v4.impresora) * 100) AS impresorap, v4.monitor AS monitorrep, v5.monitor AS monitorres, ((v5.monitor / v4.monitor) * 100) AS cmonitor, v4.teclado AS tecladorep, v5.teclado AS tecladores, ((v5.teclado / v4.teclado) * 100) AS tecladop, v4.mouse AS mouserep, v5.mouse AS mouseres, ((v5.mouse / v4.mouse) * 100) AS mousep, v4.regulador AS reguladorrep, v5.regulador AS reguladorres, ((v5.regulador / v4.regulador) * 100) AS reguladorp, v4.conexionr AS conexionrrep, v5.conexionr AS conexionrres, ((v5.conexionr / v4.conexionr) * 100) AS conexionrp, v4.conexioni AS conexionirep, v5.conexioni AS conexionires, ((v5.conexioni / v4.conexioni) * 100) AS conexionip FROM v4, v5 WHERE ((v4.departamento)::text = (v5.departamento)::text) ORDER BY v4.departamento;


ALTER TABLE public.v6 OWNER TO postgres;

--
-- TOC entry 1767 (class 1259 OID 16712)
-- Dependencies: 1909 5
-- Name: v7; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v7 AS
    SELECT v1.departamento, sum(v1.sa) AS sa, sum(v1.ss) AS ss, sum(v1.so) AS so, sum(v1.app) AS app, sum(v1.win) AS win, sum(v1.off) AS off, sum(v1.otr) AS otr FROM v1 GROUP BY v1.departamento;


ALTER TABLE public.v7 OWNER TO postgres;

--
-- TOC entry 1768 (class 1259 OID 16716)
-- Dependencies: 1910 5
-- Name: v8; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v8 AS
    SELECT v2.departamento, sum(v2.sa) AS sa, sum(v2.ss) AS ss, sum(v2.so) AS so, sum(v2.app) AS app, sum(v2.win) AS win, sum(v2.off) AS off, sum(v2.otr) AS otr FROM v2 GROUP BY v2.departamento;


ALTER TABLE public.v8 OWNER TO postgres;

--
-- TOC entry 1769 (class 1259 OID 16720)
-- Dependencies: 1911 5
-- Name: v9; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v9 AS
    SELECT v7.departamento, v7.sa AS sarep, v8.sa AS saresp, ((v8.sa / v7.sa) * 100) AS sap, v7.ss AS ssrep, v8.ss AS ssresp, ((v8.ss / v7.ss) * 100) AS ssp, v7.so AS sorep, v8.so AS soresp, ((v8.so / v7.so) * 100) AS sop, v7.app AS apprep, v8.app AS appresp, ((v8.app / v7.app) * 100) AS appp, v7.win AS winrep, v8.win AS winresp, ((v8.win / v7.win) * 100) AS winp, v7.off AS offrep, v8.off AS offresp, ((v8.off / v7.off) * 100) AS offp, v7.otr AS otrrep, v8.otr AS otrresp, ((v8.otr / v7.otr) * 100) AS otrp FROM v7, v8 WHERE ((v7.departamento)::text = (v8.departamento)::text) ORDER BY v7.departamento;


ALTER TABLE public.v9 OWNER TO postgres;

--
-- TOC entry 1816 (class 1259 OID 59391)
-- Dependencies: 1944 5
-- Name: vconteodedd; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vconteodedd AS
    SELECT tdispositivo.nombre AS dispositivo, discoduro.capacidad, count(discoduro.hcapacidaddd) AS total FROM discoduro, tdispositivo WHERE (discoduro.htdispositivo = tdispositivo.id) GROUP BY tdispositivo.nombre, discoduro.capacidad;


ALTER TABLE public.vconteodedd OWNER TO postgres;

--
-- TOC entry 1815 (class 1259 OID 59387)
-- Dependencies: 1943 5
-- Name: vconteoderam; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vconteoderam AS
    SELECT tdispositivo.nombre AS dispositivo, ram.capacidad, count(ram.hcapacidadram) AS total FROM ram, tdispositivo WHERE (ram.htdispositivo = tdispositivo.id) GROUP BY tdispositivo.nombre, ram.capacidad;


ALTER TABLE public.vconteoderam OWNER TO postgres;

--
-- TOC entry 1772 (class 1259 OID 16734)
-- Dependencies: 1914 5
-- Name: vdiscoduros; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vdiscoduros AS
    SELECT discoduro.id, discoduro.serial, discoduro.numero, discoduro.marca, discoduro.hequipo, discoduro.capacidad, tdispositivo.nombre AS htdispositivo FROM discoduro, tdispositivo WHERE (tdispositivo.id = discoduro.htdispositivo) ORDER BY discoduro.id;


ALTER TABLE public.vdiscoduros OWNER TO postgres;

--
-- TOC entry 1788 (class 1259 OID 25133)
-- Dependencies: 1926 5
-- Name: vdocumentosoporte; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vdocumentosoporte AS
    SELECT documento.id, documento.fechasol AS fecha, departamento.nombre AS departamento, documento.solicitante, documento.hsoporte, documento.estatus FROM documento, departamento WHERE (departamento.id = documento.hdepartamento) ORDER BY documento.id;


ALTER TABLE public.vdocumentosoporte OWNER TO postgres;

--
-- TOC entry 1780 (class 1259 OID 16850)
-- Dependencies: 1921 5
-- Name: vequipos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vequipos AS
    SELECT equipos.id, equipos.nombre, equipos.marca, equipos.serial, equipos.numero, equipos.responsable, departamento.nombre AS departamento FROM equipos, departamento WHERE (departamento.id = equipos.hdepartamento) ORDER BY equipos.id;


ALTER TABLE public.vequipos OWNER TO postgres;

--
-- TOC entry 1773 (class 1259 OID 16738)
-- Dependencies: 1915 5
-- Name: vimpresoras; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vimpresoras AS
    SELECT impresoras.id, impresoras.nombre, impresoras.serial, impresoras.marca, impresoras.modelo, impresoras.numero, impresoras.observaciones, impresoras.responsable, departamento.nombre AS departamento, tdispositivo.nombre AS htdispositivo FROM impresoras, departamento, tdispositivo WHERE ((departamento.id = impresoras.hdepartamento) AND (tdispositivo.id = impresoras.htdispositivo)) ORDER BY impresoras.id;


ALTER TABLE public.vimpresoras OWNER TO postgres;

--
-- TOC entry 1801 (class 1259 OID 33310)
-- Dependencies: 1933 5
-- Name: vimpresorasp; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vimpresorasp AS
    SELECT impresoras.id, impresoras.serial, impresoras.numero, impresoras.marca, impresoras.nombre, impresoras.responsable, departamento.nombre AS departamento, impresoras.modelo, tdispositivo.nombre AS tipo, impresoras.hdepartamento FROM impresoras, departamento, tdispositivo WHERE ((impresoras.hdepartamento = departamento.id) AND (impresoras.htdispositivo = tdispositivo.id));


ALTER TABLE public.vimpresorasp OWNER TO postgres;

--
-- TOC entry 1781 (class 1259 OID 25099)
-- Dependencies: 1922 5
-- Name: vistaculminado; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vistaculminado AS
    SELECT documento.id, documento.fechasol, departamento.nombre AS departamento, documento.solicitante, documento.fecharesp, soporte.nombre AS soporte, fsoporte.falla, fsoporte.observaciones AS observacionesf, fsoporte.solucion, software.sa, software.ss, software.so, software.aplicaciones AS app, software.windows AS win, software.office AS off, software.otro AS otr, software.observaciones AS observacioness, hardware.cpu, hardware.impresora, hardware.monitor, hardware.teclado, hardware.mouse, hardware.regulador, hardware.conexionr, hardware.conexioni, hardware.observaciones AS observacionesh, documento.hequipo FROM documento, departamento, software, hardware, soporte, fsoporte WHERE ((((((documento.hdepartamento = departamento.id) AND (documento.hsoftware = software.id)) AND (documento.hhardware = hardware.id)) AND (documento.hsoporte = soporte.id)) AND (documento.hfalla = fsoporte.id)) AND (documento.estatus = 3)) ORDER BY documento.id;


ALTER TABLE public.vistaculminado OWNER TO postgres;

--
-- TOC entry 1802 (class 1259 OID 33314)
-- Dependencies: 1934 5
-- Name: vistadocumento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vistadocumento AS
    SELECT documento.id, documento.fechasol AS fecha, documento.solicitante, departamento.nombre AS departamento, tipoequipo.nombre AS tipo, documento.equipo, documento.hequipo, estatus.nombre AS estatus FROM documento, estatus, departamento, tipoequipo WHERE (((departamento.id = documento.hdepartamento) AND (tipoequipo.id = documento.htipo)) AND (estatus.id = documento.estatus)) ORDER BY documento.fechasol;


ALTER TABLE public.vistadocumento OWNER TO postgres;

--
-- TOC entry 1782 (class 1259 OID 25104)
-- Dependencies: 1923 5
-- Name: vistaenrevision; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vistaenrevision AS
    SELECT documento.id, documento.fechasol, departamento.nombre AS departamento, documento.solicitante, documento.fecharesp, soporte.nombre AS soporte, fsoporte.falla, fsoporte.observaciones AS observacionesf, fsoporte.solucion, software.sa, software.ss, software.so, software.aplicaciones AS app, software.windows AS win, software.office AS off, software.otro AS otr, software.observaciones AS observacioness, hardware.cpu, hardware.impresora, hardware.monitor, hardware.teclado, hardware.mouse, hardware.regulador, hardware.conexionr, hardware.conexioni, hardware.observaciones AS observacionesh, documento.hequipo FROM documento, departamento, software, hardware, soporte, fsoporte WHERE ((((((documento.hdepartamento = departamento.id) AND (documento.hsoftware = software.id)) AND (documento.hhardware = hardware.id)) AND (documento.hsoporte = soporte.id)) AND (documento.hfalla = fsoporte.id)) AND (documento.estatus = 1)) ORDER BY documento.id;


ALTER TABLE public.vistaenrevision OWNER TO postgres;

--
-- TOC entry 1783 (class 1259 OID 25109)
-- Dependencies: 1924 5
-- Name: vistapendiente; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vistapendiente AS
    SELECT documento.id, documento.fechasol, departamento.nombre AS departamento, documento.solicitante, documento.fecharesp, soporte.nombre AS soporte, software.sa, software.ss, software.so, software.aplicaciones AS app, software.windows AS win, software.office AS off, software.otro AS otr, software.observaciones AS observacioness, hardware.cpu, hardware.impresora, hardware.monitor, hardware.teclado, hardware.mouse, hardware.regulador, hardware.conexionr, hardware.conexioni, hardware.observaciones AS observacionesh, documento.hequipo FROM documento, departamento, software, hardware, soporte, fsoporte WHERE (((((documento.hdepartamento = departamento.id) AND (documento.hsoftware = software.id)) AND (documento.hhardware = hardware.id)) AND (documento.hsoporte = soporte.id)) AND (documento.estatus = 0)) ORDER BY documento.id;


ALTER TABLE public.vistapendiente OWNER TO postgres;

--
-- TOC entry 1793 (class 1259 OID 33254)
-- Dependencies: 1928 5
-- Name: vistasoportes; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vistasoportes AS
    SELECT usuario.id AS idusuario, soporte.id AS idsoporte, usuario.loggin, soporte.nombre, soporte.estatus AS hestatus, estatus.nombre AS estatus FROM usuario, soporte, estatus WHERE (((usuario.id = soporte.husuario) AND (estatus.id = soporte.estatus)) AND (usuario.hnivel = 2)) ORDER BY usuario.id;


ALTER TABLE public.vistasoportes OWNER TO postgres;

--
-- TOC entry 1810 (class 1259 OID 57961)
-- Dependencies: 1942 5
-- Name: vistausuarios; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vistausuarios AS
    SELECT usuario.id AS idusuario, usuario.loggin, usuario.password, usuario.nombre, nivel.nombre AS nivel, departamento.nombre AS departamento, estatus.nombre AS estatus FROM usuario, departamento, nivel, estatus WHERE (((usuario.hdepartamento = departamento.id) AND (usuario.hnivel = nivel.id)) AND (usuario.estatus = estatus.id)) ORDER BY usuario.id;


ALTER TABLE public.vistausuarios OWNER TO postgres;

--
-- TOC entry 1774 (class 1259 OID 16746)
-- Dependencies: 1916 5
-- Name: vmonitores; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vmonitores AS
    SELECT monitores.id, monitores.serial, monitores.marca, monitores.nombre, monitores.modelo, monitores.numero, monitores.responsable, departamento.nombre AS departamento, monitores.observaciones FROM monitores, departamento WHERE (departamento.id = monitores.hdepartamento) ORDER BY monitores.id;


ALTER TABLE public.vmonitores OWNER TO postgres;

--
-- TOC entry 1797 (class 1259 OID 33294)
-- Dependencies: 1929 5
-- Name: vmonitoresp; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vmonitoresp AS
    SELECT monitores.id, monitores.serial, monitores.numero, monitores.marca, monitores.nombre, monitores.responsable, departamento.nombre AS departamento, monitores.modelo, tdispositivo.nombre AS tipo, monitores.hdepartamento FROM monitores, departamento, tdispositivo WHERE ((monitores.hdepartamento = departamento.id) AND (monitores.htdispositivo = tdispositivo.id));


ALTER TABLE public.vmonitoresp OWNER TO postgres;

--
-- TOC entry 1775 (class 1259 OID 16750)
-- Dependencies: 1917 5
-- Name: vmouse; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vmouse AS
    SELECT mouse.id, mouse.nombre, mouse.marca, mouse.modelo, mouse.numero, mouse.responsable, departamento.nombre AS departamento, tdispositivo.nombre AS htdispositivo FROM mouse, departamento, tdispositivo WHERE ((departamento.id = mouse.hdepartamento) AND (tdispositivo.id = mouse.htdispositivo)) ORDER BY mouse.id;


ALTER TABLE public.vmouse OWNER TO postgres;

--
-- TOC entry 1799 (class 1259 OID 33302)
-- Dependencies: 1931 5
-- Name: vmousep; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vmousep AS
    SELECT mouse.id, mouse.serial, mouse.numero, mouse.marca, mouse.nombre, mouse.responsable, departamento.nombre AS departamento, mouse.modelo, tdispositivo.nombre AS tipo, mouse.hdepartamento FROM mouse, departamento, tdispositivo WHERE ((mouse.hdepartamento = departamento.id) AND (mouse.htdispositivo = tdispositivo.id));


ALTER TABLE public.vmousep OWNER TO postgres;

--
-- TOC entry 1776 (class 1259 OID 16754)
-- Dependencies: 1918 5
-- Name: vreguladores; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vreguladores AS
    SELECT reguladores.id, reguladores.nombre, reguladores.marca, reguladores.serial, reguladores.numero, reguladores.responsable, departamento.nombre AS departamento FROM reguladores, departamento WHERE (departamento.id = reguladores.hdepartamento) ORDER BY reguladores.id;


ALTER TABLE public.vreguladores OWNER TO postgres;

--
-- TOC entry 1800 (class 1259 OID 33306)
-- Dependencies: 1932 5
-- Name: vreguladoresp; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vreguladoresp AS
    SELECT reguladores.id, reguladores.serial, reguladores.numero, reguladores.marca, reguladores.nombre, reguladores.responsable, departamento.nombre AS departamento, reguladores.modelo, tdispositivo.nombre AS tipo, reguladores.hdepartamento FROM reguladores, departamento, tdispositivo WHERE ((reguladores.hdepartamento = departamento.id) AND (reguladores.htdispositivo = tdispositivo.id));


ALTER TABLE public.vreguladoresp OWNER TO postgres;

--
-- TOC entry 1777 (class 1259 OID 16758)
-- Dependencies: 1919 5
-- Name: vswitches; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vswitches AS
    SELECT switches.id, switches.marca, switches.serial, switches.numero, switches.responsable, departamento.nombre AS departamento FROM switches, departamento WHERE (departamento.id = switches.hdepartamento) ORDER BY switches.id;


ALTER TABLE public.vswitches OWNER TO postgres;

--
-- TOC entry 1778 (class 1259 OID 16762)
-- Dependencies: 1920 5
-- Name: vteclados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vteclados AS
    SELECT teclados.id, teclados.nombre, teclados.marca, teclados.serial, teclados.numero, teclados.responsable, departamento.nombre AS departamento FROM teclados, departamento WHERE (departamento.id = teclados.hdepartamento) ORDER BY teclados.id;


ALTER TABLE public.vteclados OWNER TO postgres;

--
-- TOC entry 1798 (class 1259 OID 33298)
-- Dependencies: 1930 5
-- Name: vtecladosp; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vtecladosp AS
    SELECT teclados.id, teclados.serial, teclados.numero, teclados.marca, teclados.nombre, teclados.responsable, departamento.nombre AS departamento, teclados.modelo, tdispositivo.nombre AS tipo, teclados.hdepartamento FROM teclados, departamento, tdispositivo WHERE ((teclados.hdepartamento = departamento.id) AND (teclados.htdispositivo = tdispositivo.id));


ALTER TABLE public.vtecladosp OWNER TO postgres;

--
-- TOC entry 1787 (class 1259 OID 25129)
-- Dependencies: 1925 5
-- Name: vusuariossoporte; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vusuariossoporte AS
    SELECT usuario.id AS idusuario, soporte.id AS idsoporte, usuario.loggin, soporte.nombre FROM usuario, soporte WHERE ((usuario.id = soporte.husuario) AND (usuario.hnivel = 2)) ORDER BY usuario.id;


ALTER TABLE public.vusuariossoporte OWNER TO postgres;

--
-- TOC entry 1792 (class 1259 OID 33250)
-- Dependencies: 1927 5
-- Name: vusuariossoporte21; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vusuariossoporte21 AS
    SELECT soporte.id AS idsoporte, soporte.nombre, soporte.husuario AS idusuario, usuario.loggin FROM usuario, soporte WHERE ((usuario.id = soporte.husuario) AND (usuario.hnivel = ANY (ARRAY[(1)::bigint, (2)::bigint]))) ORDER BY usuario.id;


ALTER TABLE public.vusuariossoporte21 OWNER TO postgres;

--
-- TOC entry 2262 (class 0 OID 25119)
-- Dependencies: 1785
-- Data for Name: asignadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO asignadas VALUES (10, '2011-07-22 08:17:30.747807', 7, 1, 10);
INSERT INTO asignadas VALUES (11, '2011-07-22 08:46:42.04427', 8, 1, 11);
INSERT INTO asignadas VALUES (12, '2011-09-29 12:21:03.19213', 11, 1, 9);


--
-- TOC entry 2263 (class 0 OID 25125)
-- Dependencies: 1786
-- Data for Name: auditoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auditoria VALUES (1, 'robetorr', '2011-07-14 05:43:35.764695', 0);
INSERT INTO auditoria VALUES (2, 'robetorr', '2011-07-14 05:44:39.151976', 21);
INSERT INTO auditoria VALUES (3, 'robetorr', '2011-07-14 05:45:01.07285', 0);
INSERT INTO auditoria VALUES (4, 'carlos', '2011-07-15 08:09:31.871373', 0);
INSERT INTO auditoria VALUES (5, 'carlos', '2011-07-15 08:10:47.526512', 3);
INSERT INTO auditoria VALUES (6, 'carlos', '2011-07-15 08:17:35.664858', 9);
INSERT INTO auditoria VALUES (7, 'carlos', '2011-07-15 08:20:03.257217', 9);
INSERT INTO auditoria VALUES (8, 'carlos', '2011-07-15 08:23:01.440998', 16);
INSERT INTO auditoria VALUES (9, 'carlos', '2011-07-15 08:30:39.383775', 21);
INSERT INTO auditoria VALUES (10, 'carlos', '2011-07-15 08:31:16.789775', 17);
INSERT INTO auditoria VALUES (11, 'carlos', '2011-07-15 08:31:54.161649', 22);
INSERT INTO auditoria VALUES (12, 'carlos', '2011-07-15 08:32:06.076685', 18);
INSERT INTO auditoria VALUES (13, 'carlos', '2011-07-15 08:32:22.411339', 21);
INSERT INTO auditoria VALUES (14, 'carlos', '2011-07-15 08:32:56.371156', 17);
INSERT INTO auditoria VALUES (15, 'carlos', '2011-07-15 08:33:28.489453', 22);
INSERT INTO auditoria VALUES (16, 'carlos', '2011-07-15 08:33:40.968165', 18);
INSERT INTO auditoria VALUES (17, 'carlos', '2011-07-15 08:34:15.701064', 14);
INSERT INTO auditoria VALUES (18, 'carlos', '2011-07-15 08:35:18.640052', 34);
INSERT INTO auditoria VALUES (19, 'carlos', '2011-07-15 08:37:56.83931', 11);
INSERT INTO auditoria VALUES (20, 'carlos', '2011-07-15 08:41:16.795661', 11);
INSERT INTO auditoria VALUES (21, 'carlos', '2011-07-15 08:41:54.268249', 11);
INSERT INTO auditoria VALUES (22, 'jesus', '2011-07-15 08:44:51.54974', 0);
INSERT INTO auditoria VALUES (23, 'carlos', '2011-07-15 09:04:18.017009', 0);
INSERT INTO auditoria VALUES (24, 'carlos', '2011-07-15 09:04:37.212244', 3);
INSERT INTO auditoria VALUES (25, 'carlos', '2011-07-15 09:05:47.915945', 18);
INSERT INTO auditoria VALUES (26, 'carlos', '2011-07-15 09:07:42.583075', 34);
INSERT INTO auditoria VALUES (27, 'carlos', '2011-07-15 09:20:20.383868', 9);
INSERT INTO auditoria VALUES (28, 'robetorr', '2011-07-15 11:27:40.813405', 0);
INSERT INTO auditoria VALUES (29, 'robetorr', '2011-07-15 11:28:36.724311', 23);
INSERT INTO auditoria VALUES (30, 'robetorr', '2011-07-15 11:29:30.534122', 15);
INSERT INTO auditoria VALUES (31, 'robetorr', '2011-07-15 11:30:07.579565', 34);
INSERT INTO auditoria VALUES (32, 'robetorr', '2011-07-15 11:31:13.94893', 16);
INSERT INTO auditoria VALUES (33, 'robetorr', '2011-07-15 11:31:34.523898', 34);
INSERT INTO auditoria VALUES (34, 'robetorr', '2011-07-15 11:34:52.130344', 23);
INSERT INTO auditoria VALUES (35, 'robetorr', '2011-07-15 11:35:23.109118', 11);
INSERT INTO auditoria VALUES (36, 'robetorr', '2011-07-15 11:35:28.716764', 23);
INSERT INTO auditoria VALUES (37, 'robetorr', '2011-07-15 11:38:01.597874', 33);
INSERT INTO auditoria VALUES (38, 'robetorr', '2011-07-15 11:41:59.853334', 18);
INSERT INTO auditoria VALUES (39, 'robetorr', '2011-07-15 11:45:00.475159', 11);
INSERT INTO auditoria VALUES (40, 'robetorr', '2011-07-15 11:46:17.070083', 15);
INSERT INTO auditoria VALUES (41, 'robetorr', '2011-07-15 11:46:22.493882', 14);
INSERT INTO auditoria VALUES (42, 'robetorr', '2011-07-15 11:46:38.10988', 3);
INSERT INTO auditoria VALUES (43, 'robetorr', '2011-07-15 11:46:58.95106', 3);
INSERT INTO auditoria VALUES (44, 'robetorr', '2011-07-15 11:47:01.653334', 15);
INSERT INTO auditoria VALUES (45, 'robetorr', '2011-07-15 11:47:26.280029', 22);
INSERT INTO auditoria VALUES (46, 'robetorr', '2011-07-15 11:48:51.949739', 34);
INSERT INTO auditoria VALUES (47, 'robetorr', '2011-07-15 11:50:36.662724', 9);
INSERT INTO auditoria VALUES (48, 'robetorr', '2011-07-15 11:50:55.601934', 18);
INSERT INTO auditoria VALUES (49, 'robetorr', '2011-07-15 11:51:15.74778', 33);
INSERT INTO auditoria VALUES (50, 'carlos', '2011-07-22 07:35:09.046053', 0);
INSERT INTO auditoria VALUES (51, 'carlos', '2011-07-22 07:35:13.18133', 9);
INSERT INTO auditoria VALUES (52, 'carlos', '2011-07-22 07:52:16.815725', 9);
INSERT INTO auditoria VALUES (53, 'carlos', '2011-07-22 07:52:23.160355', 9);
INSERT INTO auditoria VALUES (54, 'carlos', '2011-07-22 07:54:15.081229', 26);
INSERT INTO auditoria VALUES (55, 'carlos', '2011-07-22 07:54:21.990414', 9);
INSERT INTO auditoria VALUES (56, 'carlos', '2011-07-22 07:55:33.643941', 9);
INSERT INTO auditoria VALUES (57, 'carlos', '2011-07-22 07:55:47.44511', 29);
INSERT INTO auditoria VALUES (58, 'carlos', '2011-07-22 07:55:50.51249', 17);
INSERT INTO auditoria VALUES (59, 'carlos', '2011-07-22 07:56:01.963818', 9);
INSERT INTO auditoria VALUES (60, 'carlos', '2011-07-22 07:57:07.274991', 9);
INSERT INTO auditoria VALUES (61, 'carlos', '2011-07-22 07:58:12.092036', 27);
INSERT INTO auditoria VALUES (62, 'carlos', '2011-07-22 07:58:26.809242', 9);
INSERT INTO auditoria VALUES (63, 'carlos', '2011-07-22 07:58:36.765524', 29);
INSERT INTO auditoria VALUES (64, 'carlos', '2011-07-22 07:58:51.066338', 27);
INSERT INTO auditoria VALUES (65, 'carlos', '2011-07-22 08:00:15.418956', 9);
INSERT INTO auditoria VALUES (66, 'carlos', '2011-07-22 08:00:52.602045', 27);
INSERT INTO auditoria VALUES (67, 'carlos', '2011-07-22 08:02:24.331577', 22);
INSERT INTO auditoria VALUES (68, 'carlos', '2011-07-22 08:02:50.634342', 16);
INSERT INTO auditoria VALUES (69, 'carlos', '2011-07-22 08:03:10.690387', 23);
INSERT INTO auditoria VALUES (70, 'carlos', '2011-07-22 08:04:07.833359', 11);
INSERT INTO auditoria VALUES (71, 'carlos', '2011-07-22 08:04:29.138749', 23);
INSERT INTO auditoria VALUES (72, 'carlos', '2011-07-22 08:05:01.381743', 12);
INSERT INTO auditoria VALUES (73, 'carlos', '2011-07-22 08:05:10.858145', 11);
INSERT INTO auditoria VALUES (74, 'carlos', '2011-07-22 08:06:17.210814', 11);
INSERT INTO auditoria VALUES (75, 'carlos', '2011-07-22 08:08:35.388651', 23);
INSERT INTO auditoria VALUES (76, 'carlos', '2011-07-22 08:09:28.129394', 23);
INSERT INTO auditoria VALUES (77, 'carlos', '2011-07-22 08:11:20.555029', 11);
INSERT INTO auditoria VALUES (78, 'carlos', '2011-07-22 08:11:55.708811', 11);
INSERT INTO auditoria VALUES (79, 'carlos', '2011-07-22 08:12:00.395159', 23);
INSERT INTO auditoria VALUES (80, 'carlos', '2011-07-22 08:16:08.356599', 9);
INSERT INTO auditoria VALUES (81, 'carlos', '2011-07-22 08:16:11.66637', 27);
INSERT INTO auditoria VALUES (82, 'carlos', '2011-07-22 08:17:01.409782', 16);
INSERT INTO auditoria VALUES (83, 'carlos', '2011-07-22 08:17:24.535393', 34);
INSERT INTO auditoria VALUES (84, 'carlos', '2011-07-22 08:17:33.359033', 34);
INSERT INTO auditoria VALUES (85, 'carlos', '2011-07-22 08:17:47.788423', 15);
INSERT INTO auditoria VALUES (86, 'carlos', '2011-07-22 08:17:57.965186', 22);
INSERT INTO auditoria VALUES (87, 'WILFREDO', '2011-07-22 08:18:40.810583', 0);
INSERT INTO auditoria VALUES (88, 'WILFREDO', '2011-07-22 08:19:30.543329', 3);
INSERT INTO auditoria VALUES (89, 'WILFREDO', '2011-07-22 08:19:41.479183', 18);
INSERT INTO auditoria VALUES (90, 'WILFREDO', '2011-07-22 08:19:45.286183', 16);
INSERT INTO auditoria VALUES (91, 'WILFREDO', '2011-07-22 08:19:53.495218', 16);
INSERT INTO auditoria VALUES (92, 'carlos', '2011-07-22 08:20:20.449965', 0);
INSERT INTO auditoria VALUES (93, 'carlos', '2011-07-22 08:20:24.911472', 16);
INSERT INTO auditoria VALUES (94, 'carlos', '2011-07-22 08:21:13.903663', 0);
INSERT INTO auditoria VALUES (95, 'carlos', '2011-07-22 08:21:38.222765', 0);
INSERT INTO auditoria VALUES (96, 'carlos', '2011-07-22 08:21:51.069566', 3);
INSERT INTO auditoria VALUES (97, 'carlos', '2011-07-22 08:21:53.490886', 16);
INSERT INTO auditoria VALUES (98, 'carlos', '2011-07-22 08:22:00.335188', 23);
INSERT INTO auditoria VALUES (99, 'carlos', '2011-07-22 08:22:02.117039', 34);
INSERT INTO auditoria VALUES (100, 'carlos', '2011-07-22 08:22:43.134575', 0);
INSERT INTO auditoria VALUES (101, 'carlos', '2011-07-22 08:22:48.984719', 18);
INSERT INTO auditoria VALUES (102, 'carlos', '2011-07-22 08:23:00.972735', 18);
INSERT INTO auditoria VALUES (103, 'carlos', '2011-07-22 08:23:04.309856', 16);
INSERT INTO auditoria VALUES (104, 'carlos', '2011-07-22 08:23:10.775175', 16);
INSERT INTO auditoria VALUES (105, 'carlos', '2011-07-22 08:23:12.597852', 18);
INSERT INTO auditoria VALUES (106, 'carlos', '2011-07-22 08:23:32.176368', 3);
INSERT INTO auditoria VALUES (107, 'carlos', '2011-07-22 08:23:36.965578', 18);
INSERT INTO auditoria VALUES (108, 'carlos', '2011-07-22 08:23:40.785528', 16);
INSERT INTO auditoria VALUES (109, 'carlos', '2011-07-22 08:24:02.979772', 14);
INSERT INTO auditoria VALUES (110, 'carlos', '2011-07-22 08:24:11.458513', 22);
INSERT INTO auditoria VALUES (111, 'carlos', '2011-07-22 08:24:31.364309', 18);
INSERT INTO auditoria VALUES (112, 'carlos', '2011-07-22 08:24:35.950487', 16);
INSERT INTO auditoria VALUES (113, 'carlos', '2011-07-22 08:24:55.969585', 16);
INSERT INTO auditoria VALUES (114, 'carlos', '2011-07-22 08:25:03.254905', 16);
INSERT INTO auditoria VALUES (115, 'carlos', '2011-07-22 08:25:05.614658', 18);
INSERT INTO auditoria VALUES (116, 'carlos', '2011-07-22 08:25:33.790406', 18);
INSERT INTO auditoria VALUES (117, 'carlos', '2011-07-22 08:26:01.119192', 18);
INSERT INTO auditoria VALUES (118, 'carlos', '2011-07-22 08:26:05.133001', 14);
INSERT INTO auditoria VALUES (119, 'carlos', '2011-07-22 08:26:16.101321', 22);
INSERT INTO auditoria VALUES (120, 'carlos', '2011-07-22 08:26:32.758227', 22);
INSERT INTO auditoria VALUES (121, 'carlos', '2011-07-22 08:36:15.638572', 18);
INSERT INTO auditoria VALUES (122, 'carlos', '2011-07-22 08:36:29.325956', 16);
INSERT INTO auditoria VALUES (123, 'carlos', '2011-07-22 08:37:15.510189', 0);
INSERT INTO auditoria VALUES (124, 'carlos', '2011-07-22 08:37:20.989228', 11);
INSERT INTO auditoria VALUES (125, 'carlos', '2011-07-22 08:38:00.697624', 11);
INSERT INTO auditoria VALUES (126, 'carlos', '2011-07-22 08:38:01.73686', 11);
INSERT INTO auditoria VALUES (127, 'prueba', '2011-07-22 08:38:30.745457', 0);
INSERT INTO auditoria VALUES (128, 'prueba', '2011-07-22 08:38:43.054097', 16);
INSERT INTO auditoria VALUES (129, 'prueba', '2011-07-22 08:38:51.142252', 18);
INSERT INTO auditoria VALUES (130, 'prueba', '2011-07-22 08:39:08.880133', 16);
INSERT INTO auditoria VALUES (131, 'prueba', '2011-07-22 08:39:15.894847', 18);
INSERT INTO auditoria VALUES (132, 'prueba', '2011-07-22 08:40:02.808392', 22);
INSERT INTO auditoria VALUES (133, 'prueba', '2011-07-22 08:40:12.733164', 15);
INSERT INTO auditoria VALUES (134, 'prueba', '2011-07-22 08:40:17.157894', 14);
INSERT INTO auditoria VALUES (135, 'prueba', '2011-07-22 08:41:09.735627', 33);
INSERT INTO auditoria VALUES (136, 'prueba', '2011-07-22 08:41:37.922767', 33);
INSERT INTO auditoria VALUES (137, 'carlos', '2011-07-22 08:43:08.42111', 0);
INSERT INTO auditoria VALUES (138, 'carlos', '2011-07-22 08:43:20.932634', 11);
INSERT INTO auditoria VALUES (139, 'carlos', '2011-07-22 08:43:40.040071', 11);
INSERT INTO auditoria VALUES (140, 'usuario', '2011-07-22 08:43:51.27511', 0);
INSERT INTO auditoria VALUES (141, 'usuario', '2011-07-22 08:43:58.118168', 3);
INSERT INTO auditoria VALUES (142, 'usuario', '2011-07-22 08:45:05.979268', 3);
INSERT INTO auditoria VALUES (143, 'usuario', '2011-07-22 08:45:10.091037', 22);
INSERT INTO auditoria VALUES (144, 'carlos', '2011-07-22 08:45:46.951609', 0);
INSERT INTO auditoria VALUES (145, 'carlos', '2011-07-22 08:45:54.521014', 15);
INSERT INTO auditoria VALUES (146, 'carlos', '2011-07-22 08:46:19.523283', 23);
INSERT INTO auditoria VALUES (147, 'carlos', '2011-07-22 08:46:30.278233', 23);
INSERT INTO auditoria VALUES (148, 'carlos', '2011-07-22 08:46:37.756399', 34);
INSERT INTO auditoria VALUES (149, 'carlos', '2011-07-22 08:46:43.278695', 34);
INSERT INTO auditoria VALUES (150, 'usuario', '2011-07-22 08:47:57.98957', 0);
INSERT INTO auditoria VALUES (151, 'usuario', '2011-07-22 08:48:00.851501', 22);
INSERT INTO auditoria VALUES (152, 'prueba', '2011-07-22 08:48:47.543402', 0);
INSERT INTO auditoria VALUES (153, 'prueba', '2011-07-22 08:48:59.951721', 15);
INSERT INTO auditoria VALUES (154, 'prueba', '2011-07-22 08:49:03.047555', 22);
INSERT INTO auditoria VALUES (155, 'carlos', '2011-07-22 08:50:36.557648', 0);
INSERT INTO auditoria VALUES (156, 'carlos', '2011-07-22 08:50:44.25562', 11);
INSERT INTO auditoria VALUES (157, 'carlos', '2011-07-22 08:51:16.212195', 11);
INSERT INTO auditoria VALUES (158, 'soporte', '2011-07-22 08:51:26.728059', 0);
INSERT INTO auditoria VALUES (159, 'carlos', '2011-07-22 08:51:45.417246', 0);
INSERT INTO auditoria VALUES (160, 'carlos', '2011-07-22 08:51:49.458614', 11);
INSERT INTO auditoria VALUES (161, 'carlos', '2011-07-22 08:52:22.656766', 11);
INSERT INTO auditoria VALUES (162, 'soporte', '2011-07-22 08:52:30.582073', 0);
INSERT INTO auditoria VALUES (163, 'carlos', '2011-07-22 08:52:48.896161', 0);
INSERT INTO auditoria VALUES (164, 'carlos', '2011-07-22 08:52:52.200424', 11);
INSERT INTO auditoria VALUES (165, 'carlos', '2011-07-22 08:53:11.676219', 11);
INSERT INTO auditoria VALUES (166, 'soporte1', '2011-07-22 08:53:21.774814', 0);
INSERT INTO auditoria VALUES (167, 'soporte1', '2011-07-22 08:53:31.581595', 15);
INSERT INTO auditoria VALUES (168, 'soporte1', '2011-07-22 08:53:39.94128', 14);
INSERT INTO auditoria VALUES (169, 'soporte1', '2011-07-22 08:53:46.244805', 15);
INSERT INTO auditoria VALUES (170, 'soporte1', '2011-07-22 08:53:52.462663', 16);
INSERT INTO auditoria VALUES (171, 'prueba', '2011-07-22 08:54:16.062405', 0);
INSERT INTO auditoria VALUES (172, 'prueba', '2011-07-22 08:54:19.803639', 16);
INSERT INTO auditoria VALUES (173, 'prueba', '2011-07-22 08:54:55.295365', 16);
INSERT INTO auditoria VALUES (174, 'prueba', '2011-07-22 08:55:25.398001', 16);
INSERT INTO auditoria VALUES (175, 'carlos', '2011-07-22 08:57:05.940544', 0);
INSERT INTO auditoria VALUES (176, 'carlos', '2011-07-22 08:57:09.773503', 33);
INSERT INTO auditoria VALUES (177, 'carlos', '2011-07-22 08:58:17.827501', 5);
INSERT INTO auditoria VALUES (178, 'carlos', '2011-07-22 08:59:26.643315', 22);
INSERT INTO auditoria VALUES (179, 'carlos', '2011-07-22 08:59:38.721147', 5);
INSERT INTO auditoria VALUES (180, 'carlos', '2011-07-22 08:59:42.59347', 22);
INSERT INTO auditoria VALUES (181, 'carlos', '2011-07-22 08:59:54.730782', 5);
INSERT INTO auditoria VALUES (182, 'prueba', '2011-07-22 09:00:49.586264', 0);
INSERT INTO auditoria VALUES (183, 'prueba', '2011-07-22 09:01:02.559464', 16);
INSERT INTO auditoria VALUES (184, 'prueba', '2011-07-22 09:01:16.429971', 16);
INSERT INTO auditoria VALUES (185, 'carlos', '2011-07-22 09:01:33.329965', 0);
INSERT INTO auditoria VALUES (186, 'carlos', '2011-07-22 09:01:35.873531', 33);
INSERT INTO auditoria VALUES (187, 'carlos', '2011-07-22 09:03:01.70787', 22);
INSERT INTO auditoria VALUES (188, 'carlos', '2011-07-22 09:03:05.825731', 15);
INSERT INTO auditoria VALUES (189, 'carlos', '2011-07-22 09:03:23.102707', 14);
INSERT INTO auditoria VALUES (190, 'carlos', '2011-07-22 09:03:39.374388', 22);
INSERT INTO auditoria VALUES (191, 'carlos', '2011-07-22 09:03:52.724907', 3);
INSERT INTO auditoria VALUES (192, 'carlos', '2011-07-22 09:04:05.116772', 3);
INSERT INTO auditoria VALUES (193, 'carlos', '2011-07-22 09:04:08.174197', 14);
INSERT INTO auditoria VALUES (194, 'carlos', '2011-07-22 09:04:17.271997', 15);
INSERT INTO auditoria VALUES (195, 'carlos', '2011-07-22 09:04:26.782609', 16);
INSERT INTO auditoria VALUES (196, 'carlos', '2011-07-22 09:04:35.266773', 16);
INSERT INTO auditoria VALUES (197, 'carlos', '2011-07-22 09:04:37.400491', 18);
INSERT INTO auditoria VALUES (198, 'carlos', '2011-07-22 09:04:48.780733', 18);
INSERT INTO auditoria VALUES (199, 'carlos', '2011-07-22 09:04:53.577613', 14);
INSERT INTO auditoria VALUES (200, 'carlos', '2011-07-22 09:04:57.642895', 22);
INSERT INTO auditoria VALUES (201, 'carlos', '2011-07-22 09:05:33.493482', 33);
INSERT INTO auditoria VALUES (202, 'carlos', '2011-07-22 09:06:10.491588', 16);
INSERT INTO auditoria VALUES (203, 'carlos', '2011-07-22 09:06:12.462525', 18);
INSERT INTO auditoria VALUES (204, 'carlos', '2011-07-22 09:06:19.303318', 33);
INSERT INTO auditoria VALUES (205, 'carlos', '2011-07-22 09:06:42.189318', 22);
INSERT INTO auditoria VALUES (206, 'carlos', '2011-07-22 09:07:15.469653', 33);
INSERT INTO auditoria VALUES (207, 'carlos', '2011-07-22 09:07:43.770463', 15);
INSERT INTO auditoria VALUES (208, 'carlos', '2011-07-22 09:07:47.095977', 22);
INSERT INTO auditoria VALUES (209, 'carlos', '2011-07-22 09:08:04.538895', 5);
INSERT INTO auditoria VALUES (210, 'carlos', '2011-07-22 09:08:19.899113', 33);
INSERT INTO auditoria VALUES (211, 'carlos', '2011-07-22 09:08:47.436919', 23);
INSERT INTO auditoria VALUES (212, 'carlos', '2011-07-22 09:09:20.992114', 23);
INSERT INTO auditoria VALUES (213, 'carlos', '2011-07-22 09:09:25.935525', 11);
INSERT INTO auditoria VALUES (214, 'robetorr', '2011-07-25 05:36:54.594979', 0);
INSERT INTO auditoria VALUES (215, 'robetorr', '2011-07-25 05:37:09.662945', 9);
INSERT INTO auditoria VALUES (216, 'robetorr', '2011-07-25 05:40:40.336872', 9);
INSERT INTO auditoria VALUES (217, 'robetorr', '2011-07-25 05:45:15.693547', 0);
INSERT INTO auditoria VALUES (218, 'robetorr', '2011-07-25 05:45:22.784393', 9);
INSERT INTO auditoria VALUES (219, 'robetorr', '2011-07-25 05:48:35.259597', 9);
INSERT INTO auditoria VALUES (220, 'jesus', '2011-07-26 06:48:37.006655', 0);
INSERT INTO auditoria VALUES (221, 'jesus', '2011-07-26 06:49:00.773964', 3);
INSERT INTO auditoria VALUES (222, 'jesus', '2011-07-26 06:52:20.387916', 12);
INSERT INTO auditoria VALUES (223, 'jesus', '2011-07-26 06:52:43.619245', 23);
INSERT INTO auditoria VALUES (224, 'jesus', '2011-07-26 06:53:19.807042', 34);
INSERT INTO auditoria VALUES (225, 'jesus', '2011-07-26 06:53:25.253275', 34);
INSERT INTO auditoria VALUES (226, 'jesus', '2011-07-26 06:53:47.394303', 9);
INSERT INTO auditoria VALUES (227, 'jesus', '2011-07-26 06:54:50.997879', 9);
INSERT INTO auditoria VALUES (228, 'jesus', '2011-07-26 06:55:02.830453', 21);
INSERT INTO auditoria VALUES (229, 'jesus', '2011-07-26 06:55:56.049345', 22);
INSERT INTO auditoria VALUES (230, 'jesus', '2011-07-26 06:56:09.523672', 15);
INSERT INTO auditoria VALUES (231, 'jesus', '2011-07-26 06:56:13.522413', 14);
INSERT INTO auditoria VALUES (232, 'jesus', '2011-07-26 06:56:20.999595', 26);
INSERT INTO auditoria VALUES (233, 'jesus', '2011-07-26 06:56:24.815749', 25);
INSERT INTO auditoria VALUES (234, 'jesus', '2011-07-26 06:56:28.808654', 27);
INSERT INTO auditoria VALUES (235, 'jesus', '2011-07-26 06:56:37.883816', 29);
INSERT INTO auditoria VALUES (236, 'jesus', '2011-07-26 06:56:41.332275', 28);
INSERT INTO auditoria VALUES (237, 'jesus', '2011-07-26 06:56:44.628057', 30);
INSERT INTO auditoria VALUES (238, 'jesus', '2011-07-26 06:56:49.908879', 31);
INSERT INTO auditoria VALUES (239, 'jesus', '2011-07-26 06:56:52.835371', 11);
INSERT INTO auditoria VALUES (240, 'jesus', '2011-07-26 06:57:21.318253', 11);
INSERT INTO auditoria VALUES (241, 'jesus', '2011-07-26 06:58:20.926397', 12);
INSERT INTO auditoria VALUES (242, 'jesus', '2011-07-26 06:59:16.828238', 12);
INSERT INTO auditoria VALUES (243, 'jesus', '2011-07-26 07:00:18.198131', 34);
INSERT INTO auditoria VALUES (244, 'jesus', '2011-07-26 07:00:27.817671', 12);
INSERT INTO auditoria VALUES (245, 'jesus', '2011-07-26 07:28:43.791335', 18);
INSERT INTO auditoria VALUES (246, 'jesus', '2011-07-26 07:28:54.541297', 16);
INSERT INTO auditoria VALUES (247, 'jesus', '2011-07-26 07:55:59.452697', 0);
INSERT INTO auditoria VALUES (248, 'jesus', '2011-07-26 07:58:22.758878', 11);
INSERT INTO auditoria VALUES (249, 'jesus', '2011-07-26 07:59:12.201594', 12);
INSERT INTO auditoria VALUES (250, 'jesus', '2011-07-26 08:02:12.113372', 23);
INSERT INTO auditoria VALUES (251, 'jesus', '2011-07-26 08:02:28.981571', 11);
INSERT INTO auditoria VALUES (252, 'jesus', '2011-07-26 08:02:34.431439', 23);
INSERT INTO auditoria VALUES (253, 'jesus', '2011-07-26 08:03:12.697046', 11);
INSERT INTO auditoria VALUES (254, 'jesus', '2011-07-26 08:06:32.062153', 34);
INSERT INTO auditoria VALUES (255, 'jesus', '2011-07-26 08:07:30.19618', 9);
INSERT INTO auditoria VALUES (256, 'jesus', '2011-07-26 08:08:21.846682', 27);
INSERT INTO auditoria VALUES (257, 'jesus', '2011-07-26 08:09:09.954756', 9);
INSERT INTO auditoria VALUES (258, 'jesus', '2011-07-26 08:15:50.166174', 3);
INSERT INTO auditoria VALUES (259, 'jesus', '2011-07-26 08:18:28.530858', 9);
INSERT INTO auditoria VALUES (260, 'jesus', '2011-07-26 08:19:04.537399', 3);
INSERT INTO auditoria VALUES (261, 'jesus', '2011-07-26 08:21:37.217317', 18);
INSERT INTO auditoria VALUES (262, 'jesus', '2011-07-26 08:22:08.202503', 16);
INSERT INTO auditoria VALUES (263, 'jesus', '2011-07-26 08:22:50.523753', 22);
INSERT INTO auditoria VALUES (264, 'jesus', '2011-07-26 08:23:06.803644', 16);
INSERT INTO auditoria VALUES (265, 'jesus', '2011-07-26 08:23:20.092794', 15);
INSERT INTO auditoria VALUES (266, 'jesus', '2011-07-26 08:23:25.393434', 22);
INSERT INTO auditoria VALUES (267, 'jesus', '2011-07-26 08:24:00.652297', 16);
INSERT INTO auditoria VALUES (268, 'jesus', '2011-07-26 08:24:07.99993', 3);
INSERT INTO auditoria VALUES (269, 'jesus', '2011-07-26 08:25:09.458848', 3);
INSERT INTO auditoria VALUES (270, 'jesus', '2011-07-26 08:25:35.212989', 16);
INSERT INTO auditoria VALUES (271, 'jesus', '2011-07-26 08:26:05.120003', 16);
INSERT INTO auditoria VALUES (272, 'jesus', '2011-07-26 08:26:31.157497', 18);
INSERT INTO auditoria VALUES (273, 'jesus', '2011-07-26 08:27:10.573263', 18);
INSERT INTO auditoria VALUES (274, 'jesus', '2011-07-26 08:27:41.561763', 21);
INSERT INTO auditoria VALUES (275, 'jesus', '2011-07-26 08:32:04.773848', 14);
INSERT INTO auditoria VALUES (276, 'jesus', '2011-07-26 08:32:21.537597', 14);
INSERT INTO auditoria VALUES (277, 'jesus', '2011-07-26 08:32:26.660363', 14);
INSERT INTO auditoria VALUES (278, 'jesus', '2011-07-26 08:33:34.076252', 5);
INSERT INTO auditoria VALUES (279, 'jesus', '2011-07-26 08:35:44.664956', 33);
INSERT INTO auditoria VALUES (280, 'jesus', '2011-07-26 08:39:51.587016', 28);
INSERT INTO auditoria VALUES (281, 'jesus', '2011-07-26 08:39:58.994967', 26);
INSERT INTO auditoria VALUES (282, 'jesus', '2011-07-26 08:40:06.402749', 27);
INSERT INTO auditoria VALUES (283, 'carlos', '2011-07-26 13:43:12.766107', 0);
INSERT INTO auditoria VALUES (284, 'carlos', '2011-07-26 13:43:17.009532', 11);
INSERT INTO auditoria VALUES (285, 'carlos', '2011-07-26 13:43:32.981319', 22);
INSERT INTO auditoria VALUES (286, 'carlos', '2011-07-26 13:43:49.882654', 15);
INSERT INTO auditoria VALUES (287, 'carlos', '2011-07-26 13:43:57.266025', 22);
INSERT INTO auditoria VALUES (288, 'carlos', '2011-07-26 13:44:13.69536', 16);
INSERT INTO auditoria VALUES (289, 'carlos', '2011-07-26 13:44:19.075555', 18);
INSERT INTO auditoria VALUES (290, 'carlos', '2011-07-26 13:44:34.922738', 18);
INSERT INTO auditoria VALUES (291, 'carlos', '2011-07-26 13:44:38.548415', 22);
INSERT INTO auditoria VALUES (292, 'carlos', '2011-07-26 13:44:52.592956', 33);
INSERT INTO auditoria VALUES (293, 'carlos', '2011-07-26 13:45:04.127744', 9);
INSERT INTO auditoria VALUES (294, 'carlos', '2011-07-27 07:16:13.704021', 0);
INSERT INTO auditoria VALUES (295, 'carlos', '2011-07-27 07:16:56.414866', 17);
INSERT INTO auditoria VALUES (296, 'carlos', '2011-07-27 07:17:00.738158', 27);
INSERT INTO auditoria VALUES (297, 'carlos', '2011-07-27 07:17:56.232038', 9);
INSERT INTO auditoria VALUES (298, 'carlos', '2011-07-27 08:18:18.294744', 0);
INSERT INTO auditoria VALUES (299, 'carlos', '2011-07-27 08:18:21.65493', 9);
INSERT INTO auditoria VALUES (300, 'carlos', '2011-07-27 08:28:37.972749', 9);
INSERT INTO auditoria VALUES (301, 'carlos', '2011-07-27 08:29:04.796115', 27);
INSERT INTO auditoria VALUES (302, 'carlos', '2011-07-27 08:30:50.752872', 9);
INSERT INTO auditoria VALUES (303, 'carlos', '2011-07-27 08:58:58.249803', 9);
INSERT INTO auditoria VALUES (304, 'carlos', '2011-07-27 08:59:01.294958', 17);
INSERT INTO auditoria VALUES (305, 'carlos', '2011-07-27 08:59:04.327293', 27);
INSERT INTO auditoria VALUES (306, 'carlos', '2011-07-27 09:12:04.57273', 22);
INSERT INTO auditoria VALUES (307, 'carlos', '2011-07-27 09:12:24.745005', 21);
INSERT INTO auditoria VALUES (308, 'carlos', '2011-07-27 09:14:04.742748', 21);
INSERT INTO auditoria VALUES (309, 'carlos', '2011-07-27 09:14:29.167218', 17);
INSERT INTO auditoria VALUES (310, 'carlos', '2011-07-27 09:14:31.555364', 22);
INSERT INTO auditoria VALUES (311, 'carlos', '2011-07-27 09:14:37.068303', 15);
INSERT INTO auditoria VALUES (312, 'carlos', '2011-07-27 09:14:39.109435', 14);
INSERT INTO auditoria VALUES (313, 'robetorr', '2011-07-27 09:20:13.193982', 0);
INSERT INTO auditoria VALUES (314, 'robetorr', '2011-07-27 09:24:14.696674', 0);
INSERT INTO auditoria VALUES (315, 'carlos', '2011-07-27 10:20:27.03446', 0);
INSERT INTO auditoria VALUES (316, 'carlos', '2011-07-27 10:20:31.622684', 9);
INSERT INTO auditoria VALUES (317, 'carlos', '2011-07-27 10:20:42.78604', 27);
INSERT INTO auditoria VALUES (318, 'robetorr', '2011-07-27 10:48:48.166986', 0);
INSERT INTO auditoria VALUES (319, 'carlos', '2011-07-27 10:52:13.134027', 0);
INSERT INTO auditoria VALUES (320, 'carlos', '2011-07-27 10:56:01.29583', 14);
INSERT INTO auditoria VALUES (321, 'robetorr', '2011-07-27 10:59:01.293299', 9);
INSERT INTO auditoria VALUES (322, 'robetorr', '2011-07-27 10:59:32.417244', 9);
INSERT INTO auditoria VALUES (323, 'carlos', '2011-07-28 08:15:36.561029', 0);
INSERT INTO auditoria VALUES (324, 'carlos', '2011-07-28 08:15:53.687842', 11);
INSERT INTO auditoria VALUES (325, 'carlos', '2011-07-28 08:18:14.813359', 11);
INSERT INTO auditoria VALUES (326, 'carlos', '2011-07-28 08:19:38.087184', 3);
INSERT INTO auditoria VALUES (327, 'carlos', '2011-07-28 08:23:35.231768', 9);
INSERT INTO auditoria VALUES (328, 'carlos', '2011-07-28 08:27:08.129962', 21);
INSERT INTO auditoria VALUES (329, 'carlos', '2011-07-28 08:28:15.803573', 17);
INSERT INTO auditoria VALUES (330, 'carlos', '2011-07-28 08:28:20.886755', 22);
INSERT INTO auditoria VALUES (331, 'carlos', '2011-07-28 08:28:52.071185', 15);
INSERT INTO auditoria VALUES (332, 'carlos', '2011-07-28 08:28:56.247994', 14);
INSERT INTO auditoria VALUES (333, 'carlos', '2011-07-28 08:30:26.853511', 5);
INSERT INTO auditoria VALUES (334, 'carlos', '2011-07-28 08:31:21.253559', 33);
INSERT INTO auditoria VALUES (335, 'carlos', '2011-07-28 08:31:36.556462', 15);
INSERT INTO auditoria VALUES (336, 'carlos', '2011-07-28 08:31:39.575244', 22);
INSERT INTO auditoria VALUES (337, 'carlos', '2011-07-28 08:31:51.757246', 14);
INSERT INTO auditoria VALUES (338, 'carlos', '2011-07-28 08:32:02.062467', 5);
INSERT INTO auditoria VALUES (339, 'carlos', '2011-07-28 08:33:31.852725', 17);
INSERT INTO auditoria VALUES (340, 'carlos', '2011-07-28 08:33:36.137784', 9);
INSERT INTO auditoria VALUES (341, 'carlos', '2011-07-28 08:35:27.401584', 22);
INSERT INTO auditoria VALUES (342, 'carlos', '2011-07-28 08:35:40.646414', 5);
INSERT INTO auditoria VALUES (343, 'carlos', '2011-07-28 08:36:16.28708', 22);
INSERT INTO auditoria VALUES (344, 'carlos', '2011-07-28 08:36:26.494239', 14);
INSERT INTO auditoria VALUES (345, 'carlos', '2011-07-28 08:36:31.937591', 15);
INSERT INTO auditoria VALUES (346, 'carlos', '2011-07-28 08:36:47.897235', 5);
INSERT INTO auditoria VALUES (347, 'carlos', '2011-07-28 08:47:01.733934', 33);
INSERT INTO auditoria VALUES (348, 'carlos', '2011-07-28 08:48:21.76552', 5);
INSERT INTO auditoria VALUES (349, 'carlos', '2011-07-28 08:48:24.586958', 33);
INSERT INTO auditoria VALUES (350, 'carlos', '2011-07-28 08:52:19.500114', 33);
INSERT INTO auditoria VALUES (351, 'ramonp', '2011-07-29 09:11:46.409115', 0);
INSERT INTO auditoria VALUES (352, 'ramonp', '2011-07-29 09:13:51.183957', 21);
INSERT INTO auditoria VALUES (353, 'ramonp', '2011-07-29 09:16:51.184977', 12);
INSERT INTO auditoria VALUES (354, 'ramonp', '2011-07-29 09:17:41.316029', 3);
INSERT INTO auditoria VALUES (355, 'ramonp', '2011-07-29 10:44:02.645743', 0);
INSERT INTO auditoria VALUES (356, 'ramonp', '2011-07-29 10:53:39.366543', 5);
INSERT INTO auditoria VALUES (357, 'jorman', '2011-08-01 06:12:28.384345', 0);
INSERT INTO auditoria VALUES (358, 'jorman', '2011-08-01 06:12:50.627146', 9);
INSERT INTO auditoria VALUES (359, 'jorman', '2011-08-01 06:14:19.685723', 18);
INSERT INTO auditoria VALUES (360, 'jorman', '2011-08-01 06:14:37.203719', 16);
INSERT INTO auditoria VALUES (361, 'jorman', '2011-08-01 06:14:48.973845', 18);
INSERT INTO auditoria VALUES (362, 'jorman', '2011-08-01 06:14:52.909966', 9);
INSERT INTO auditoria VALUES (363, 'jorman', '2011-08-01 06:36:31.208476', 9);
INSERT INTO auditoria VALUES (364, 'jorman', '2011-08-01 06:38:45.044846', 3);
INSERT INTO auditoria VALUES (365, 'carlos', '2011-08-01 06:40:25.624029', 0);
INSERT INTO auditoria VALUES (366, 'carlos', '2011-08-01 06:41:59.868843', 9);
INSERT INTO auditoria VALUES (367, 'jorman', '2011-08-01 06:42:13.552859', 9);
INSERT INTO auditoria VALUES (368, 'carlos', '2011-08-01 06:50:41.582213', 0);
INSERT INTO auditoria VALUES (369, 'carlos', '2011-08-01 06:50:50.714615', 27);
INSERT INTO auditoria VALUES (370, 'jorman', '2011-08-01 07:32:56.030046', 0);
INSERT INTO auditoria VALUES (371, 'jorman', '2011-08-01 07:52:48.031523', 11);
INSERT INTO auditoria VALUES (372, 'jorman', '2011-08-01 07:53:43.849437', 11);
INSERT INTO auditoria VALUES (373, 'jorman', '2011-08-01 07:53:53.715634', 11);
INSERT INTO auditoria VALUES (374, 'jorman', '2011-08-01 07:54:50.543723', 11);
INSERT INTO auditoria VALUES (375, 'yalitza', '2011-08-01 07:55:06.86911', 0);
INSERT INTO auditoria VALUES (376, 'mayelix', '2011-08-01 07:55:22.065192', 0);
INSERT INTO auditoria VALUES (377, 'jorman', '2011-08-01 07:56:08.497022', 0);
INSERT INTO auditoria VALUES (378, 'jorman', '2011-08-01 07:56:11.88451', 9);
INSERT INTO auditoria VALUES (379, 'robetorr', '2011-08-01 08:01:12.735864', 0);
INSERT INTO auditoria VALUES (380, 'robetorr', '2011-08-01 08:01:19.046053', 9);
INSERT INTO auditoria VALUES (381, 'robetorr', '2011-08-01 08:03:40.945695', 9);
INSERT INTO auditoria VALUES (382, 'robetorr', '2011-08-01 08:10:46.938158', 0);
INSERT INTO auditoria VALUES (383, 'carlos', '2011-08-01 08:28:35.830497', 0);
INSERT INTO auditoria VALUES (384, 'yalitza', '2011-08-01 08:47:48.936631', 0);
INSERT INTO auditoria VALUES (385, 'yalitza', '2011-08-01 08:47:55.828896', 9);
INSERT INTO auditoria VALUES (386, 'yalitza', '2011-08-01 09:08:57.881408', 9);
INSERT INTO auditoria VALUES (387, 'yalitza', '2011-08-01 09:13:53.377207', 9);
INSERT INTO auditoria VALUES (388, 'yalitza', '2011-08-01 09:15:25.187025', 9);
INSERT INTO auditoria VALUES (389, 'yalitza', '2011-08-01 09:17:08.782484', 9);
INSERT INTO auditoria VALUES (390, 'yalitza', '2011-08-01 09:18:33.55025', 9);
INSERT INTO auditoria VALUES (391, 'yalitza', '2011-08-01 09:19:13.449966', 17);
INSERT INTO auditoria VALUES (392, 'yalitza', '2011-08-01 09:19:18.940849', 21);
INSERT INTO auditoria VALUES (393, 'yalitza', '2011-08-01 09:20:35.673259', 9);
INSERT INTO auditoria VALUES (394, 'yalitza', '2011-08-01 09:21:02.623576', 26);
INSERT INTO auditoria VALUES (395, 'yalitza', '2011-08-01 09:21:15.298452', 25);
INSERT INTO auditoria VALUES (396, 'yalitza', '2011-08-01 09:21:25.848924', 28);
INSERT INTO auditoria VALUES (397, 'yalitza', '2011-08-01 09:21:52.145813', 9);
INSERT INTO auditoria VALUES (398, 'yalitza', '2011-08-01 09:22:51.543683', 9);
INSERT INTO auditoria VALUES (399, 'yalitza', '2011-08-01 10:54:23.290402', 0);
INSERT INTO auditoria VALUES (400, 'yalitza', '2011-08-01 10:54:29.135549', 9);
INSERT INTO auditoria VALUES (401, 'yalitza', '2011-08-01 10:55:06.541109', 17);
INSERT INTO auditoria VALUES (402, 'yalitza', '2011-08-01 10:58:00.228823', 9);
INSERT INTO auditoria VALUES (403, 'yalitza', '2011-08-01 11:00:55.018519', 9);
INSERT INTO auditoria VALUES (404, 'yalitza', '2011-08-01 11:01:07.147277', 17);
INSERT INTO auditoria VALUES (405, 'yalitza', '2011-08-01 11:01:25.721518', 9);
INSERT INTO auditoria VALUES (406, 'yalitza', '2011-08-01 11:14:52.534135', 9);
INSERT INTO auditoria VALUES (407, 'yalitza', '2011-08-01 11:19:59.334664', 17);
INSERT INTO auditoria VALUES (408, 'yalitza', '2011-08-01 11:20:30.864249', 9);
INSERT INTO auditoria VALUES (409, 'yalitza', '2011-08-01 11:22:59.555314', 9);
INSERT INTO auditoria VALUES (410, 'yalitza', '2011-08-01 11:36:19.498615', 9);
INSERT INTO auditoria VALUES (411, 'robetorr', '2011-08-01 11:43:06.326732', 0);
INSERT INTO auditoria VALUES (412, 'yalitza', '2011-08-01 11:43:07.080538', 9);
INSERT INTO auditoria VALUES (413, 'robetorr', '2011-08-01 11:43:15.310285', 9);
INSERT INTO auditoria VALUES (414, 'yalitza', '2011-08-01 11:43:26.480151', 17);
INSERT INTO auditoria VALUES (415, 'yalitza', '2011-08-01 11:43:31.084477', 21);
INSERT INTO auditoria VALUES (416, 'yalitza', '2011-08-01 11:44:26.065098', 9);
INSERT INTO auditoria VALUES (417, 'robetorr', '2011-08-01 11:49:09.584502', 0);
INSERT INTO auditoria VALUES (418, 'robetorr', '2011-08-01 11:49:16.062147', 9);
INSERT INTO auditoria VALUES (419, 'robetorr', '2011-08-01 11:49:52.238387', 9);
INSERT INTO auditoria VALUES (420, 'robetorr', '2011-08-01 12:00:33.02181', 0);
INSERT INTO auditoria VALUES (421, 'robetorr', '2011-08-01 12:00:42.37211', 9);
INSERT INTO auditoria VALUES (422, 'yalitza', '2011-08-01 12:01:08.109097', 0);
INSERT INTO auditoria VALUES (423, 'yalitza', '2011-08-01 12:01:22.290421', 9);
INSERT INTO auditoria VALUES (424, 'robetorr', '2011-08-01 12:03:25.006061', 0);
INSERT INTO auditoria VALUES (425, 'robetorr', '2011-08-01 12:03:31.288106', 9);
INSERT INTO auditoria VALUES (426, 'robetorr', '2011-08-01 12:03:59.878068', 9);
INSERT INTO auditoria VALUES (427, 'robetorr', '2011-08-01 12:05:10.872437', 9);
INSERT INTO auditoria VALUES (428, 'robetorr', '2011-08-01 12:05:34.771733', 9);
INSERT INTO auditoria VALUES (429, 'robetorr', '2011-08-01 12:06:07.215794', 9);
INSERT INTO auditoria VALUES (430, 'robetorr', '2011-08-01 12:06:34.839581', 9);
INSERT INTO auditoria VALUES (431, 'mayelix', '2011-08-01 12:11:16.900639', 0);
INSERT INTO auditoria VALUES (432, 'mayelix', '2011-08-01 12:11:23.019964', 9);
INSERT INTO auditoria VALUES (433, 'mayelix', '2011-08-01 12:12:30.760907', 9);
INSERT INTO auditoria VALUES (434, 'mayelix', '2011-08-01 12:13:26.980938', 9);
INSERT INTO auditoria VALUES (435, 'mayelix', '2011-08-01 12:14:21.304608', 9);
INSERT INTO auditoria VALUES (436, 'robetorr', '2011-08-01 12:14:32.084464', 0);
INSERT INTO auditoria VALUES (437, 'mayelix', '2011-08-01 12:15:18.53867', 9);
INSERT INTO auditoria VALUES (438, 'mayelix', '2011-08-01 12:15:49.476738', 9);
INSERT INTO auditoria VALUES (439, 'mayelix', '2011-08-01 12:25:55.261967', 9);
INSERT INTO auditoria VALUES (440, 'mayelix', '2011-08-01 12:26:59.427969', 9);
INSERT INTO auditoria VALUES (441, 'mayelix', '2011-08-01 12:27:55.629585', 9);
INSERT INTO auditoria VALUES (442, 'mayelix', '2011-08-01 12:29:15.772167', 9);
INSERT INTO auditoria VALUES (443, 'mayelix', '2011-08-01 12:32:11.209387', 9);
INSERT INTO auditoria VALUES (444, 'mayelix', '2011-08-01 12:33:34.166546', 9);
INSERT INTO auditoria VALUES (445, 'robetorr', '2011-08-02 05:55:57.806683', 0);
INSERT INTO auditoria VALUES (446, 'robetorr', '2011-08-02 05:56:09.024462', 9);
INSERT INTO auditoria VALUES (447, 'robetorr', '2011-08-02 05:56:39.058687', 9);
INSERT INTO auditoria VALUES (448, 'robetorr', '2011-08-02 05:57:17.428283', 9);
INSERT INTO auditoria VALUES (449, 'robetorr', '2011-08-02 06:08:44.236013', 0);
INSERT INTO auditoria VALUES (450, 'robetorr', '2011-08-02 06:08:54.301318', 9);
INSERT INTO auditoria VALUES (451, 'robetorr', '2011-08-02 06:10:05.964739', 9);
INSERT INTO auditoria VALUES (452, 'yalitza', '2011-08-02 06:16:33.669305', 0);
INSERT INTO auditoria VALUES (453, 'yalitza', '2011-08-02 06:16:39.311725', 9);
INSERT INTO auditoria VALUES (454, 'robetorr', '2011-08-02 06:46:14.679544', 0);
INSERT INTO auditoria VALUES (455, 'robetorr', '2011-08-02 06:46:20.883226', 16);
INSERT INTO auditoria VALUES (456, 'robetorr', '2011-08-02 06:46:24.614541', 9);
INSERT INTO auditoria VALUES (457, 'robetorr', '2011-08-02 06:47:00.985373', 9);
INSERT INTO auditoria VALUES (458, 'robetorr', '2011-08-02 07:01:20.727297', 0);
INSERT INTO auditoria VALUES (459, 'robetorr', '2011-08-02 07:01:26.707192', 9);
INSERT INTO auditoria VALUES (460, 'robetorr', '2011-08-02 07:04:29.62169', 0);
INSERT INTO auditoria VALUES (461, 'robetorr', '2011-08-02 07:04:35.420101', 9);
INSERT INTO auditoria VALUES (462, 'yalitza', '2011-08-02 07:10:57.890904', 0);
INSERT INTO auditoria VALUES (463, 'yalitza', '2011-08-02 07:11:02.048621', 9);
INSERT INTO auditoria VALUES (464, 'yalitza', '2011-08-02 07:12:01.668189', 9);
INSERT INTO auditoria VALUES (465, 'robetorr', '2011-08-02 07:17:53.96139', 0);
INSERT INTO auditoria VALUES (466, 'yalitza', '2011-08-02 07:18:37.310919', 0);
INSERT INTO auditoria VALUES (467, 'yalitza', '2011-08-02 07:18:40.378886', 9);
INSERT INTO auditoria VALUES (468, 'yalitza', '2011-08-02 07:34:06.774162', 9);
INSERT INTO auditoria VALUES (469, 'robetorr', '2011-08-02 07:36:19.989717', 9);
INSERT INTO auditoria VALUES (470, 'yalitza', '2011-08-02 07:59:23.749932', 9);
INSERT INTO auditoria VALUES (471, 'robetorr', '2011-08-02 08:11:03.984414', 0);
INSERT INTO auditoria VALUES (472, 'robetorr', '2011-08-02 08:11:09.562116', 9);
INSERT INTO auditoria VALUES (473, 'yalitza', '2011-08-02 08:26:13.67697', 0);
INSERT INTO auditoria VALUES (474, 'yalitza', '2011-08-02 08:26:19.559411', 9);
INSERT INTO auditoria VALUES (475, 'yalitza', '2011-08-02 08:38:33.45816', 26);
INSERT INTO auditoria VALUES (476, 'yalitza', '2011-08-02 08:44:12.500442', 0);
INSERT INTO auditoria VALUES (477, 'yalitza', '2011-08-02 08:44:15.161764', 9);
INSERT INTO auditoria VALUES (478, 'carlos', '2011-08-02 10:26:45.567495', 0);
INSERT INTO auditoria VALUES (479, 'carlos', '2011-08-02 10:26:53.12047', 17);
INSERT INTO auditoria VALUES (480, 'carlos', '2011-08-02 10:27:30.855754', 11);
INSERT INTO auditoria VALUES (481, 'carlos', '2011-08-02 10:27:40.993398', 27);
INSERT INTO auditoria VALUES (482, 'carlos', '2011-08-02 10:27:50.064739', 21);
INSERT INTO auditoria VALUES (483, 'yalitza', '2011-08-02 12:14:00.932476', 0);
INSERT INTO auditoria VALUES (484, 'yalitza', '2011-08-02 12:14:29.031424', 9);
INSERT INTO auditoria VALUES (485, 'yalitza', '2011-08-02 12:16:53.888415', 9);
INSERT INTO auditoria VALUES (486, 'yalitza', '2011-08-02 12:17:37.340066', 9);
INSERT INTO auditoria VALUES (487, 'yalitza', '2011-08-02 12:19:52.359119', 9);
INSERT INTO auditoria VALUES (488, 'yalitza', '2011-08-02 12:19:57.075634', 17);
INSERT INTO auditoria VALUES (489, 'yalitza', '2011-08-02 12:20:25.595269', 17);
INSERT INTO auditoria VALUES (490, 'yalitza', '2011-08-02 12:20:43.800356', 21);
INSERT INTO auditoria VALUES (491, 'yalitza', '2011-08-02 12:20:46.296871', 21);
INSERT INTO auditoria VALUES (492, 'yalitza', '2011-08-02 12:20:48.886999', 21);
INSERT INTO auditoria VALUES (493, 'yalitza', '2011-08-02 12:20:50.465153', 17);
INSERT INTO auditoria VALUES (494, 'yalitza', '2011-08-02 12:21:10.983549', 9);
INSERT INTO auditoria VALUES (495, 'yalitza', '2011-08-02 12:24:06.507943', 17);
INSERT INTO auditoria VALUES (496, 'yalitza', '2011-08-02 12:24:40.284194', 27);
INSERT INTO auditoria VALUES (497, 'yalitza', '2011-08-02 12:25:49.527292', 17);
INSERT INTO auditoria VALUES (498, 'yalitza', '2011-08-02 12:26:05.618559', 29);
INSERT INTO auditoria VALUES (499, 'nerio', '2011-08-02 12:30:49.696693', 0);
INSERT INTO auditoria VALUES (500, 'nerio', '2011-08-02 12:31:28.661869', 31);
INSERT INTO auditoria VALUES (501, 'robetorr', '2011-08-03 07:13:09.554519', 0);
INSERT INTO auditoria VALUES (502, 'robetorr', '2011-08-03 07:15:53.556337', 17);
INSERT INTO auditoria VALUES (503, 'robetorr', '2011-08-03 07:16:55.71823', 15);
INSERT INTO auditoria VALUES (504, 'robetorr', '2011-08-03 07:16:59.493849', 14);
INSERT INTO auditoria VALUES (505, 'robetorr', '2011-08-03 07:17:06.949182', 21);
INSERT INTO auditoria VALUES (506, 'robetorr', '2011-08-03 07:17:52.802082', 26);
INSERT INTO auditoria VALUES (507, 'robetorr', '2011-08-03 07:18:23.767306', 21);
INSERT INTO auditoria VALUES (508, 'robetorr', '2011-08-03 07:19:26.42637', 11);
INSERT INTO auditoria VALUES (509, 'robetorr', '2011-08-03 07:19:36.004605', 34);
INSERT INTO auditoria VALUES (510, 'robetorr', '2011-08-03 07:19:44.437946', 23);
INSERT INTO auditoria VALUES (511, 'robetorr', '2011-08-03 07:21:00.777594', 22);
INSERT INTO auditoria VALUES (512, 'robetorr', '2011-08-03 07:22:37.944107', 21);
INSERT INTO auditoria VALUES (513, 'robetorr', '2011-08-03 07:31:38.907542', 0);
INSERT INTO auditoria VALUES (514, 'robetorr', '2011-08-03 07:38:11.297493', 0);
INSERT INTO auditoria VALUES (515, 'robetorr', '2011-08-03 07:53:13.412036', 0);
INSERT INTO auditoria VALUES (516, 'robetorr', '2011-08-03 07:56:15.87266', 21);
INSERT INTO auditoria VALUES (517, 'yalitza', '2011-08-03 08:17:18.523181', 0);
INSERT INTO auditoria VALUES (518, 'yalitza', '2011-08-03 08:17:32.14606', 9);
INSERT INTO auditoria VALUES (519, 'yalitza', '2011-08-03 08:22:53.426411', 9);
INSERT INTO auditoria VALUES (520, 'yalitza', '2011-08-03 08:24:25.045734', 9);
INSERT INTO auditoria VALUES (521, 'yalitza', '2011-08-03 08:27:18.737323', 9);
INSERT INTO auditoria VALUES (522, 'yalitza', '2011-08-03 08:28:49.757494', 9);
INSERT INTO auditoria VALUES (523, 'yalitza', '2011-08-03 08:29:57.759422', 9);
INSERT INTO auditoria VALUES (524, 'robetorr', '2011-08-05 07:06:46.771798', 0);
INSERT INTO auditoria VALUES (525, 'robetorr', '2011-08-05 07:06:57.766543', 3);
INSERT INTO auditoria VALUES (526, 'carlos', '2011-08-05 08:13:32.555054', 0);
INSERT INTO auditoria VALUES (527, 'carlos', '2011-08-05 08:15:55.65087', 17);
INSERT INTO auditoria VALUES (528, 'carlos', '2011-08-05 08:16:52.362115', 11);
INSERT INTO auditoria VALUES (529, 'carlos', '2011-08-05 08:22:49.417548', 17);
INSERT INTO auditoria VALUES (530, 'carlos', '2011-08-05 08:24:00.394236', 40);
INSERT INTO auditoria VALUES (531, 'mayelix', '2011-08-05 10:46:51.469594', 0);
INSERT INTO auditoria VALUES (532, 'mayelix', '2011-08-05 10:46:58.857116', 9);
INSERT INTO auditoria VALUES (533, 'mayelix', '2011-08-05 11:37:23.063095', 17);
INSERT INTO auditoria VALUES (534, 'mayelix', '2011-08-05 11:37:37.792819', 21);
INSERT INTO auditoria VALUES (535, 'mayelix', '2011-08-05 11:37:37.80992', 21);
INSERT INTO auditoria VALUES (536, 'mayelix', '2011-08-05 11:37:41.446967', 14);
INSERT INTO auditoria VALUES (537, 'mayelix', '2011-08-05 11:37:55.011124', 17);
INSERT INTO auditoria VALUES (538, 'mayelix', '2011-08-05 11:38:18.053622', 9);
INSERT INTO auditoria VALUES (539, 'mayelix', '2011-08-05 11:38:28.998002', 17);
INSERT INTO auditoria VALUES (540, 'mayelix', '2011-08-05 11:38:39.903148', 9);
INSERT INTO auditoria VALUES (541, 'mayelix', '2011-08-05 11:51:16.479118', 9);
INSERT INTO auditoria VALUES (542, 'mayelix', '2011-08-05 11:52:54.512168', 9);
INSERT INTO auditoria VALUES (543, 'mayelix', '2011-08-05 11:54:13.138941', 9);
INSERT INTO auditoria VALUES (544, 'mayelix', '2011-08-05 11:55:37.962697', 9);
INSERT INTO auditoria VALUES (545, 'mayelix', '2011-08-05 11:57:02.136436', 9);
INSERT INTO auditoria VALUES (546, 'mayelix', '2011-08-05 11:58:24.411361', 9);
INSERT INTO auditoria VALUES (547, 'mayelix', '2011-08-05 12:07:36.124612', 9);
INSERT INTO auditoria VALUES (548, 'mayelix', '2011-08-05 12:20:30.962745', 9);
INSERT INTO auditoria VALUES (549, 'mayelix', '2011-08-05 12:22:22.14345', 9);
INSERT INTO auditoria VALUES (550, 'mayelix', '2011-08-05 12:23:24.808187', 9);
INSERT INTO auditoria VALUES (551, 'mayelix', '2011-08-05 12:30:16.797692', 9);
INSERT INTO auditoria VALUES (552, 'mayelix', '2011-08-05 12:31:18.212369', 9);
INSERT INTO auditoria VALUES (553, 'mayelix', '2011-08-05 12:41:18.388846', 9);
INSERT INTO auditoria VALUES (554, 'yalitza', '2011-08-09 08:07:45.46617', 0);
INSERT INTO auditoria VALUES (555, 'yalitza', '2011-08-09 08:07:53.24171', 9);
INSERT INTO auditoria VALUES (556, 'yalitza', '2011-08-09 08:19:55.258894', 9);
INSERT INTO auditoria VALUES (557, 'yalitza', '2011-08-17 10:52:13.85904', 0);
INSERT INTO auditoria VALUES (558, 'yalitza', '2011-08-17 10:52:37.949466', 9);
INSERT INTO auditoria VALUES (559, 'yalitza', '2011-08-17 11:03:49.710667', 9);
INSERT INTO auditoria VALUES (560, 'yalitza', '2011-08-17 11:03:59.669399', 14);
INSERT INTO auditoria VALUES (561, 'yalitza', '2011-08-17 11:04:11.560812', 17);
INSERT INTO auditoria VALUES (562, 'yalitza', '2011-08-17 11:06:09.392392', 17);
INSERT INTO auditoria VALUES (563, 'yalitza', '2011-08-17 11:06:30.365051', 17);
INSERT INTO auditoria VALUES (564, 'yalitza', '2011-08-17 11:06:57.313247', 15);
INSERT INTO auditoria VALUES (565, 'yalitza', '2011-08-17 11:07:16.650991', 14);
INSERT INTO auditoria VALUES (566, 'yalitza', '2011-08-17 11:07:29.593781', 21);
INSERT INTO auditoria VALUES (567, 'yalitza', '2011-08-17 11:07:29.608038', 21);
INSERT INTO auditoria VALUES (568, 'yalitza', '2011-08-17 11:07:40.809402', 14);
INSERT INTO auditoria VALUES (569, 'robetorr', '2011-08-17 11:42:30.677599', 0);
INSERT INTO auditoria VALUES (570, 'robetorr', '2011-08-17 11:43:25.198983', 33);
INSERT INTO auditoria VALUES (571, 'robetorr', '2011-08-17 11:49:08.607213', 0);
INSERT INTO auditoria VALUES (572, 'robetorr', '2011-08-17 11:49:13.724285', 3);
INSERT INTO auditoria VALUES (573, 'robetorr', '2011-08-17 11:50:15.460336', 0);
INSERT INTO auditoria VALUES (574, 'robetorr', '2011-08-17 11:50:20.195056', 3);
INSERT INTO auditoria VALUES (575, 'robetorr', '2011-08-17 11:51:38.196891', 5);
INSERT INTO auditoria VALUES (576, 'robetorr', '2011-08-17 12:01:37.756616', 0);
INSERT INTO auditoria VALUES (577, 'robetorr', '2011-08-17 12:01:40.353692', 3);
INSERT INTO auditoria VALUES (578, 'nerio', '2011-08-19 11:20:45.550323', 0);
INSERT INTO auditoria VALUES (579, 'nerio', '2011-08-19 11:20:51.848913', 15);
INSERT INTO auditoria VALUES (580, 'nerio', '2011-08-19 11:21:04.620935', 3);
INSERT INTO auditoria VALUES (581, 'nerio', '2011-08-19 11:21:12.096329', 9);
INSERT INTO auditoria VALUES (582, 'nerio', '2011-08-19 11:21:21.174585', 33);
INSERT INTO auditoria VALUES (583, 'nerio', '2011-08-19 11:21:49.592585', 9);
INSERT INTO auditoria VALUES (584, 'nerio', '2011-08-19 11:21:59.096914', 17);
INSERT INTO auditoria VALUES (585, 'nerio', '2011-08-19 11:22:28.970802', 14);
INSERT INTO auditoria VALUES (586, 'nerio', '2011-08-19 11:22:51.586403', 11);
INSERT INTO auditoria VALUES (587, 'robetorr', '2011-08-22 12:34:59.589463', 0);
INSERT INTO auditoria VALUES (588, 'robetorr', '2011-08-22 12:35:18.109633', 11);
INSERT INTO auditoria VALUES (589, 'robetorr', '2011-08-22 12:35:24.709087', 23);
INSERT INTO auditoria VALUES (590, 'robetorr', '2011-08-22 12:41:37.136661', 0);
INSERT INTO auditoria VALUES (591, 'robetorr', '2011-08-22 12:41:41.907352', 32);
INSERT INTO auditoria VALUES (592, 'robetorr', '2011-08-22 12:41:45.194287', 41);
INSERT INTO auditoria VALUES (593, 'robetorr', '2011-08-22 12:42:11.737088', 14);
INSERT INTO auditoria VALUES (594, 'robetorr', '2011-08-22 12:42:22.482135', 15);
INSERT INTO auditoria VALUES (595, 'robetorr', '2011-08-22 12:42:30.054663', 17);
INSERT INTO auditoria VALUES (596, 'robetorr', '2011-08-22 12:42:34.834791', 21);
INSERT INTO auditoria VALUES (597, 'robetorr', '2011-08-22 12:42:34.853729', 21);
INSERT INTO auditoria VALUES (598, 'robetorr', '2011-08-22 12:43:06.437528', 3);
INSERT INTO auditoria VALUES (599, 'robetorr', '2011-08-22 12:43:54.621547', 3);
INSERT INTO auditoria VALUES (600, 'robetorr', '2011-08-22 12:44:03.59066', 41);
INSERT INTO auditoria VALUES (601, 'robetorr', '2011-08-22 12:48:46.785611', 42);
INSERT INTO auditoria VALUES (602, 'yalitza', '2011-08-26 07:20:45.515514', 0);
INSERT INTO auditoria VALUES (603, 'yalitza', '2011-08-26 07:21:11.3496', 9);
INSERT INTO auditoria VALUES (604, 'yalitza', '2011-08-26 07:35:50.261315', 0);
INSERT INTO auditoria VALUES (605, 'yalitza', '2011-08-26 07:35:57.236354', 9);
INSERT INTO auditoria VALUES (606, 'yalitza', '2011-08-26 07:48:23.576956', 9);
INSERT INTO auditoria VALUES (607, 'yalitza', '2011-08-26 07:50:02.648528', 9);
INSERT INTO auditoria VALUES (608, 'yalitza', '2011-08-26 07:52:00.634995', 9);
INSERT INTO auditoria VALUES (609, 'yalitza', '2011-08-26 07:53:30.429482', 9);
INSERT INTO auditoria VALUES (610, 'yalitza', '2011-08-26 07:53:38.032159', 9);
INSERT INTO auditoria VALUES (611, 'yalitza', '2011-08-26 07:56:06.664288', 9);
INSERT INTO auditoria VALUES (612, 'yalitza', '2011-08-26 07:57:15.444529', 9);
INSERT INTO auditoria VALUES (613, 'yalitza', '2011-08-26 11:41:05.961569', 0);
INSERT INTO auditoria VALUES (614, 'yalitza', '2011-08-26 11:41:49.990078', 9);
INSERT INTO auditoria VALUES (615, 'yalitza', '2011-08-26 11:53:14.6201', 9);
INSERT INTO auditoria VALUES (616, 'yalitza', '2011-08-26 11:54:05.149034', 3);
INSERT INTO auditoria VALUES (617, 'yalitza', '2011-08-26 11:54:11.165889', 9);
INSERT INTO auditoria VALUES (618, 'yalitza', '2011-08-26 11:55:26.868999', 15);
INSERT INTO auditoria VALUES (619, 'yalitza', '2011-08-26 11:55:34.123094', 17);
INSERT INTO auditoria VALUES (620, 'yalitza', '2011-08-26 11:55:41.061804', 21);
INSERT INTO auditoria VALUES (621, 'yalitza', '2011-08-26 11:55:41.073434', 21);
INSERT INTO auditoria VALUES (622, 'yalitza', '2011-08-26 11:55:49.157211', 15);
INSERT INTO auditoria VALUES (623, 'yalitza', '2011-08-26 11:55:52.835202', 14);
INSERT INTO auditoria VALUES (624, 'yalitza', '2011-08-26 11:56:15.079269', 17);
INSERT INTO auditoria VALUES (625, 'yalitza', '2011-08-26 11:57:50.684184', 0);
INSERT INTO auditoria VALUES (626, 'yalitza', '2011-08-26 11:57:54.717664', 9);
INSERT INTO auditoria VALUES (627, 'yalitza', '2011-08-26 12:05:06.38216', 9);
INSERT INTO auditoria VALUES (628, 'yalitza', '2011-08-26 12:07:16.636089', 9);
INSERT INTO auditoria VALUES (629, 'yalitza', '2011-08-26 12:12:02.654387', 21);
INSERT INTO auditoria VALUES (630, 'yalitza', '2011-08-26 12:12:02.672977', 21);
INSERT INTO auditoria VALUES (631, 'yalitza', '2011-08-26 12:13:07.818721', 17);
INSERT INTO auditoria VALUES (632, 'carlos', '2011-08-26 12:17:00.604437', 0);
INSERT INTO auditoria VALUES (633, 'carlos', '2011-08-26 12:17:19.374525', 40);
INSERT INTO auditoria VALUES (634, 'carlos', '2011-08-26 12:17:47.973039', 9);
INSERT INTO auditoria VALUES (635, 'carlos', '2011-08-26 12:20:30.098499', 9);
INSERT INTO auditoria VALUES (636, 'carlos', '2011-08-26 12:22:53.319588', 9);
INSERT INTO auditoria VALUES (637, 'carlos', '2011-08-26 12:24:24.908594', 9);
INSERT INTO auditoria VALUES (638, 'carlos', '2011-08-26 12:24:52.818633', 9);
INSERT INTO auditoria VALUES (639, 'carlos', '2011-08-26 12:25:46.714605', 9);
INSERT INTO auditoria VALUES (640, 'yalitza', '2011-09-20 08:39:00.222821', 0);
INSERT INTO auditoria VALUES (641, 'carlos', '2011-09-20 08:39:22.7746', 0);
INSERT INTO auditoria VALUES (642, 'yalitza', '2011-09-20 08:45:53.092332', 0);
INSERT INTO auditoria VALUES (643, 'yalitza', '2011-09-20 08:46:32.312998', 9);
INSERT INTO auditoria VALUES (644, 'yalitza', '2011-09-20 08:55:44.664046', 9);
INSERT INTO auditoria VALUES (645, 'yalitza', '2011-09-20 08:55:46.668661', 9);
INSERT INTO auditoria VALUES (646, 'yalitza', '2011-09-20 09:12:00.094404', 0);
INSERT INTO auditoria VALUES (647, 'yalitza', '2011-09-20 09:12:08.19735', 9);
INSERT INTO auditoria VALUES (648, 'nerio', '2011-09-29 08:50:14.120472', 0);
INSERT INTO auditoria VALUES (649, 'nerio', '2011-09-29 08:51:33.548401', 23);
INSERT INTO auditoria VALUES (650, 'nerio', '2011-09-29 08:53:29.307941', 11);
INSERT INTO auditoria VALUES (651, 'nerio', '2011-09-29 08:55:01.289714', 23);
INSERT INTO auditoria VALUES (652, 'nerio', '2011-09-29 08:55:19.4616', 23);
INSERT INTO auditoria VALUES (653, 'julian', '2011-09-29 08:56:29.031304', 0);
INSERT INTO auditoria VALUES (654, 'julian', '2011-09-29 08:59:47.601094', 0);
INSERT INTO auditoria VALUES (655, 'julian', '2011-09-29 08:59:55.469904', 9);
INSERT INTO auditoria VALUES (656, 'julian', '2011-09-29 09:00:14.822032', 17);
INSERT INTO auditoria VALUES (657, 'julian', '2011-09-29 09:00:36.660474', 22);
INSERT INTO auditoria VALUES (658, 'julian', '2011-09-29 09:00:54.130678', 3);
INSERT INTO auditoria VALUES (659, 'julian', '2011-09-29 09:02:17.059581', 9);
INSERT INTO auditoria VALUES (660, 'julian', '2011-09-29 09:02:32.212346', 16);
INSERT INTO auditoria VALUES (661, 'julian', '2011-09-29 09:02:36.250161', 18);
INSERT INTO auditoria VALUES (662, 'julian', '2011-09-29 09:02:41.911416', 32);
INSERT INTO auditoria VALUES (663, 'julian', '2011-09-29 09:02:46.496865', 5);
INSERT INTO auditoria VALUES (664, 'julian', '2011-09-29 09:02:49.847523', 14);
INSERT INTO auditoria VALUES (665, 'julian', '2011-09-29 09:03:02.669178', 14);
INSERT INTO auditoria VALUES (666, 'julian', '2011-09-29 09:03:04.827352', 15);
INSERT INTO auditoria VALUES (667, 'julian', '2011-09-29 09:03:11.122088', 17);
INSERT INTO auditoria VALUES (668, 'julian', '2011-09-29 09:03:22.797356', 17);
INSERT INTO auditoria VALUES (669, 'julian', '2011-09-29 09:03:36.65391', 17);
INSERT INTO auditoria VALUES (670, 'julian', '2011-09-29 09:03:40.956453', 21);
INSERT INTO auditoria VALUES (671, 'julian', '2011-09-29 09:03:40.967043', 21);
INSERT INTO auditoria VALUES (672, 'carlos', '2011-09-29 11:50:52.875697', 0);
INSERT INTO auditoria VALUES (673, 'carlos', '2011-09-29 11:50:59.888864', 40);
INSERT INTO auditoria VALUES (674, 'carlos', '2011-09-29 11:51:38.258179', 40);
INSERT INTO auditoria VALUES (675, 'carlos', '2011-09-29 11:53:04.756386', 0);
INSERT INTO auditoria VALUES (676, 'carlos', '2011-09-29 11:53:08.394448', 40);
INSERT INTO auditoria VALUES (677, 'carlos', '2011-09-29 11:53:35.667651', 17);
INSERT INTO auditoria VALUES (678, 'carlos', '2011-09-29 11:53:46.005934', 40);
INSERT INTO auditoria VALUES (679, 'carlos', '2011-09-29 11:53:56.36482', 17);
INSERT INTO auditoria VALUES (680, 'carlos', '2011-09-29 11:54:27.815034', 0);
INSERT INTO auditoria VALUES (681, 'carlos', '2011-09-29 11:54:35.211218', 17);
INSERT INTO auditoria VALUES (682, 'carlos', '2011-09-29 11:55:23.666005', 0);
INSERT INTO auditoria VALUES (683, 'carlos', '2011-09-29 11:55:28.191471', 11);
INSERT INTO auditoria VALUES (684, 'carlos', '2011-09-29 11:55:32.96441', 40);
INSERT INTO auditoria VALUES (685, 'carlos', '2011-09-29 11:57:36.46299', 0);
INSERT INTO auditoria VALUES (686, 'carlos', '2011-09-29 11:57:46.435954', 17);
INSERT INTO auditoria VALUES (687, 'carlos', '2011-09-29 11:58:10.724245', 9);
INSERT INTO auditoria VALUES (688, 'carlos', '2011-09-29 11:58:29.681089', 0);
INSERT INTO auditoria VALUES (689, 'carlos', '2011-09-29 11:58:40.917292', 3);
INSERT INTO auditoria VALUES (690, 'carlos', '2011-09-29 11:59:41.815562', 9);
INSERT INTO auditoria VALUES (691, 'carlos', '2011-09-29 12:05:24.725263', 9);
INSERT INTO auditoria VALUES (692, 'carlos', '2011-09-29 12:06:21.139258', 40);
INSERT INTO auditoria VALUES (693, '', '2011-09-29 12:07:21.460115', 11);
INSERT INTO auditoria VALUES (694, '', '2011-09-29 12:07:28.380054', 17);
INSERT INTO auditoria VALUES (695, '', '2011-09-29 12:08:47.30546', 11);
INSERT INTO auditoria VALUES (696, '', '2011-09-29 12:09:31.228955', 32);
INSERT INTO auditoria VALUES (697, '', '2011-09-29 12:09:35.943346', 17);
INSERT INTO auditoria VALUES (698, 'jfornes', '2011-09-29 12:10:00.41149', 0);
INSERT INTO auditoria VALUES (699, 'jfornes', '2011-09-29 12:10:07.651321', 17);
INSERT INTO auditoria VALUES (700, 'jfornes', '2011-09-29 12:13:38.403112', 17);
INSERT INTO auditoria VALUES (701, 'jfornes', '2011-09-29 12:15:09.104218', 40);
INSERT INTO auditoria VALUES (702, 'jfornes', '2011-09-29 12:18:34.838173', 17);
INSERT INTO auditoria VALUES (703, 'jfornes', '2011-09-29 12:19:31.342446', 40);
INSERT INTO auditoria VALUES (704, 'jfornes', '2011-09-29 12:20:08.112512', 17);
INSERT INTO auditoria VALUES (705, 'jfornes', '2011-09-29 12:20:31.979645', 33);
INSERT INTO auditoria VALUES (706, 'jfornes', '2011-09-29 12:21:06.569283', 33);
INSERT INTO auditoria VALUES (707, 'jfornes', '2011-09-29 12:22:03.342024', 40);
INSERT INTO auditoria VALUES (708, 'jfornes', '2011-09-29 12:22:11.826161', 40);
INSERT INTO auditoria VALUES (709, 'jfornes', '2011-09-29 12:22:28.880299', 40);
INSERT INTO auditoria VALUES (710, 'jfornes', '2011-09-29 12:23:02.334197', 40);
INSERT INTO auditoria VALUES (711, 'jfornes', '2011-09-29 12:29:50.085715', 0);
INSERT INTO auditoria VALUES (712, 'jfornes', '2011-09-29 12:29:57.846894', 17);
INSERT INTO auditoria VALUES (713, 'jfornes', '2011-09-29 12:31:21.574009', 17);
INSERT INTO auditoria VALUES (714, 'jfornes', '2011-09-29 12:31:43.326819', 3);
INSERT INTO auditoria VALUES (715, 'jfornes', '2011-09-29 12:35:27.695735', 41);
INSERT INTO auditoria VALUES (716, 'jfornes', '2011-09-29 12:35:31.913448', 3);
INSERT INTO auditoria VALUES (717, 'jfornes', '2011-09-29 12:38:05.610914', 3);
INSERT INTO auditoria VALUES (718, 'jfornes', '2011-09-29 12:38:13.785915', 9);
INSERT INTO auditoria VALUES (719, 'jfornes', '2011-09-29 12:38:20.971627', 16);
INSERT INTO auditoria VALUES (720, 'jfornes', '2011-09-29 12:38:55.839962', 16);
INSERT INTO auditoria VALUES (721, 'jfornes', '2011-09-29 12:39:04.150213', 18);
INSERT INTO auditoria VALUES (722, 'jfornes', '2011-09-29 12:39:24.755503', 16);
INSERT INTO auditoria VALUES (723, 'jfornes', '2011-09-29 12:39:36.511378', 18);
INSERT INTO auditoria VALUES (724, 'jfornes', '2011-09-29 12:40:10.79632', 16);
INSERT INTO auditoria VALUES (725, 'jfornes', '2011-09-29 12:40:13.015935', 3);
INSERT INTO auditoria VALUES (726, 'jfornes', '2011-09-29 12:40:19.441428', 16);
INSERT INTO auditoria VALUES (727, 'jfornes', '2011-09-29 12:40:42.372326', 18);
INSERT INTO auditoria VALUES (728, 'jfornes', '2011-09-29 12:41:46.017907', 16);
INSERT INTO auditoria VALUES (729, 'jfornes', '2011-09-29 12:42:12.117592', 16);
INSERT INTO auditoria VALUES (730, 'jfornes', '2011-09-29 12:42:15.698466', 18);
INSERT INTO auditoria VALUES (731, 'jfornes', '2011-09-29 12:42:39.183968', 18);
INSERT INTO auditoria VALUES (732, 'jfornes', '2011-09-29 12:42:43.167507', 32);
INSERT INTO auditoria VALUES (733, 'jfornes', '2011-09-29 12:45:25.8635', 3);
INSERT INTO auditoria VALUES (734, 'jfornes', '2011-09-29 12:45:34.759113', 32);
INSERT INTO auditoria VALUES (735, 'jfornes', '2011-09-29 12:46:21.172006', 18);
INSERT INTO auditoria VALUES (736, 'jfornes', '2011-09-29 12:46:28.150693', 5);
INSERT INTO auditoria VALUES (737, 'jfornes', '2011-09-29 12:47:34.958563', 32);
INSERT INTO auditoria VALUES (738, 'jfornes', '2011-09-29 12:48:04.807334', 41);
INSERT INTO auditoria VALUES (739, 'jfornes', '2011-09-29 12:48:47.448348', 42);
INSERT INTO auditoria VALUES (740, 'robetorr', '2011-10-11 07:47:20.786765', 0);
INSERT INTO auditoria VALUES (741, 'robetorr', '2011-10-11 07:47:30.894659', 9);
INSERT INTO auditoria VALUES (742, 'robetorr', '2011-10-11 07:49:59.096236', 9);
INSERT INTO auditoria VALUES (743, 'robetorr', '2011-10-11 08:13:24.433337', 0);
INSERT INTO auditoria VALUES (744, 'robetorr', '2011-10-11 08:13:32.392372', 9);
INSERT INTO auditoria VALUES (745, 'robetorr', '2011-10-11 08:18:50.692523', 9);
INSERT INTO auditoria VALUES (746, 'robetorr', '2011-10-11 08:21:05.209593', 9);
INSERT INTO auditoria VALUES (747, 'robetorr', '2011-10-11 08:57:52.972682', 9);
INSERT INTO auditoria VALUES (748, 'robetorr', '2011-10-11 09:14:58.473917', 9);
INSERT INTO auditoria VALUES (749, 'robetorr', '2011-10-11 12:15:14.889384', 0);
INSERT INTO auditoria VALUES (750, 'robetorr', '2011-10-11 12:15:41.561775', 9);
INSERT INTO auditoria VALUES (751, 'robetorr', '2011-10-11 12:18:23.984093', 9);
INSERT INTO auditoria VALUES (752, 'robetorr', '2011-10-11 12:20:06.907385', 9);
INSERT INTO auditoria VALUES (753, 'carlos', '2011-10-14 13:15:03.155341', 0);
INSERT INTO auditoria VALUES (754, 'robetorr', '2011-10-17 12:01:05.319569', 0);
INSERT INTO auditoria VALUES (755, 'robetorr', '2011-10-17 12:01:32.157125', 9);
INSERT INTO auditoria VALUES (756, 'robetorr', '2011-10-17 12:04:58.525722', 9);
INSERT INTO auditoria VALUES (757, 'robetorr', '2011-10-17 12:10:41.538023', 11);
INSERT INTO auditoria VALUES (758, 'julian', '2011-10-18 08:00:50.89603', 0);
INSERT INTO auditoria VALUES (759, 'jfornes', '2011-10-18 08:02:17.133143', 0);
INSERT INTO auditoria VALUES (760, 'jfornes', '2011-10-18 08:02:24.596417', 11);
INSERT INTO auditoria VALUES (761, 'jfornes', '2011-10-18 08:02:57.1787', 40);
INSERT INTO auditoria VALUES (762, 'jfornes', '2011-10-18 08:03:15.06391', 3);
INSERT INTO auditoria VALUES (763, 'jfornes', '2011-10-18 08:04:51.78741', 3);
INSERT INTO auditoria VALUES (764, 'robetorr', '2011-10-18 08:05:43.520069', 0);
INSERT INTO auditoria VALUES (765, 'robetorr', '2011-10-18 08:05:55.461739', 9);
INSERT INTO auditoria VALUES (766, 'jfornes', '2011-10-18 08:06:20.443877', 11);
INSERT INTO auditoria VALUES (767, 'jfornes', '2011-10-18 08:07:03.952466', 11);
INSERT INTO auditoria VALUES (768, 'Prueba', '2011-10-18 08:07:25.130745', 0);
INSERT INTO auditoria VALUES (769, 'Prueba', '2011-10-18 08:07:37.3189', 3);
INSERT INTO auditoria VALUES (770, 'Prueba', '2011-10-18 08:09:55.987023', 3);
INSERT INTO auditoria VALUES (771, 'Prueba', '2011-10-18 08:10:19.298807', 3);
INSERT INTO auditoria VALUES (772, 'Prueba', '2011-10-18 08:11:01.436598', 0);
INSERT INTO auditoria VALUES (773, 'Prueba', '2011-10-18 08:11:05.299953', 3);
INSERT INTO auditoria VALUES (774, 'Prueba', '2011-10-18 08:11:34.149251', 3);
INSERT INTO auditoria VALUES (804, 'robetorr', '2011-10-18 08:19:09.923133', 0);
INSERT INTO auditoria VALUES (805, 'robetorr', '2011-10-18 08:19:18.121361', 9);
INSERT INTO auditoria VALUES (806, 'Prueba', '2011-10-18 08:23:17.500985', 0);
INSERT INTO auditoria VALUES (807, 'Prueba', '2011-10-18 08:23:25.470196', 22);
INSERT INTO auditoria VALUES (808, 'jfornes', '2011-10-18 08:24:41.231898', 0);
INSERT INTO auditoria VALUES (809, 'jfornes', '2011-10-18 08:24:47.934997', 3);
INSERT INTO auditoria VALUES (810, 'jfornes', '2011-10-18 08:24:51.873464', 9);
INSERT INTO auditoria VALUES (811, 'jfornes', '2011-10-18 08:24:55.719346', 16);
INSERT INTO auditoria VALUES (812, 'jfornes', '2011-10-18 08:26:15.621457', 16);
INSERT INTO auditoria VALUES (813, 'jfornes', '2011-10-18 08:26:19.609904', 18);
INSERT INTO auditoria VALUES (814, 'jfornes', '2011-10-18 08:27:54.83791', 18);
INSERT INTO auditoria VALUES (815, 'jfornes', '2011-10-18 08:28:18.108096', 18);
INSERT INTO auditoria VALUES (816, 'jfornes', '2011-10-18 08:29:44.947446', 18);
INSERT INTO auditoria VALUES (817, 'jfornes', '2011-10-18 08:30:35.031784', 32);
INSERT INTO auditoria VALUES (818, 'robetorr', '2011-10-18 08:31:24.240132', 0);
INSERT INTO auditoria VALUES (819, 'jfornes', '2011-10-18 08:31:29.223259', 32);
INSERT INTO auditoria VALUES (820, 'robetorr', '2011-10-18 08:31:33.31108', 9);
INSERT INTO auditoria VALUES (821, 'jfornes', '2011-10-18 08:31:45.534655', 32);
INSERT INTO auditoria VALUES (822, 'jfornes', '2011-10-18 08:32:17.061792', 32);
INSERT INTO auditoria VALUES (823, 'jfornes', '2011-10-18 08:32:32.687571', 41);
INSERT INTO auditoria VALUES (824, 'jfornes', '2011-10-18 08:32:38.425905', 32);
INSERT INTO auditoria VALUES (825, 'jfornes', '2011-10-18 08:33:09.703669', 41);
INSERT INTO auditoria VALUES (826, 'jfornes', '2011-10-18 08:33:41.679212', 0);
INSERT INTO auditoria VALUES (827, 'jfornes', '2011-10-18 08:33:44.716049', 32);
INSERT INTO auditoria VALUES (828, 'jfornes', '2011-10-18 08:35:47.451538', 0);
INSERT INTO auditoria VALUES (829, 'jfornes', '2011-10-18 08:35:49.90802', 41);
INSERT INTO auditoria VALUES (830, 'robetorr', '2011-10-18 08:37:57.514146', 0);
INSERT INTO auditoria VALUES (831, 'robetorr', '2011-10-18 08:38:07.529737', 9);
INSERT INTO auditoria VALUES (832, 'jfornes', '2011-10-18 08:39:58.823011', 42);
INSERT INTO auditoria VALUES (833, 'jfornes', '2011-10-18 08:41:12.983563', 42);
INSERT INTO auditoria VALUES (834, 'jfornes', '2011-10-18 08:44:59.493353', 5);
INSERT INTO auditoria VALUES (835, 'robetorr', '2011-10-18 08:46:04.789344', 0);
INSERT INTO auditoria VALUES (836, 'robetorr', '2011-10-18 08:46:12.545109', 9);
INSERT INTO auditoria VALUES (837, 'jfornes', '2011-10-18 08:46:17.913453', 5);
INSERT INTO auditoria VALUES (838, 'jfornes', '2011-10-18 08:47:23.08188', 40);
INSERT INTO auditoria VALUES (839, 'jfornes', '2011-10-18 08:50:13.490511', 0);
INSERT INTO auditoria VALUES (840, 'jfornes', '2011-10-18 08:50:23.31085', 40);
INSERT INTO auditoria VALUES (841, 'jfornes', '2011-10-18 08:50:51.694368', 5);
INSERT INTO auditoria VALUES (842, 'jfornes', '2011-10-18 08:51:14.730869', 42);
INSERT INTO auditoria VALUES (843, 'jfornes', '2011-10-18 08:51:37.143479', 32);
INSERT INTO auditoria VALUES (844, 'jfornes', '2011-10-18 08:52:23.302208', 41);
INSERT INTO auditoria VALUES (845, 'jfornes', '2011-10-18 08:53:05.683537', 18);
INSERT INTO auditoria VALUES (846, 'jfornes', '2011-10-18 08:53:17.591831', 9);
INSERT INTO auditoria VALUES (847, 'jfornes', '2011-10-18 08:53:23.911056', 16);
INSERT INTO auditoria VALUES (848, 'jfornes', '2011-10-18 08:54:05.150704', 16);
INSERT INTO auditoria VALUES (849, 'jfornes', '2011-10-18 08:54:11.552702', 18);
INSERT INTO auditoria VALUES (850, 'jfornes', '2011-10-18 08:54:29.009039', 18);
INSERT INTO auditoria VALUES (851, 'jfornes', '2011-10-18 08:54:39.119414', 32);
INSERT INTO auditoria VALUES (852, 'jfornes', '2011-10-18 08:55:06.360005', 41);
INSERT INTO auditoria VALUES (853, 'jfornes', '2011-10-18 08:55:42.895942', 15);
INSERT INTO auditoria VALUES (854, 'jfornes', '2011-10-18 08:56:03.387818', 14);
INSERT INTO auditoria VALUES (855, 'robetorr', '2011-10-18 08:56:55.93381', 0);
INSERT INTO auditoria VALUES (856, 'robetorr', '2011-10-18 08:57:01.538165', 9);
INSERT INTO auditoria VALUES (857, 'jfornes', '2011-10-18 08:58:51.860266', 5);
INSERT INTO auditoria VALUES (858, 'jfornes', '2011-10-18 08:59:40.840585', 32);
INSERT INTO auditoria VALUES (859, 'robetorr', '2011-10-18 09:00:00.166251', 0);
INSERT INTO auditoria VALUES (860, 'robetorr', '2011-10-18 09:00:05.317709', 9);
INSERT INTO auditoria VALUES (861, 'robetorr', '2011-10-18 09:02:39.371844', 0);
INSERT INTO auditoria VALUES (862, 'robetorr', '2011-10-18 09:02:46.750061', 9);
INSERT INTO auditoria VALUES (863, 'robetorr', '2011-10-18 12:00:14.613402', 0);
INSERT INTO auditoria VALUES (864, 'robetorr', '2011-10-18 12:04:27.718533', 9);
INSERT INTO auditoria VALUES (865, 'robetorr', '2011-10-18 12:14:50.478153', 0);
INSERT INTO auditoria VALUES (866, 'robetorr', '2011-10-18 12:14:55.730785', 3);
INSERT INTO auditoria VALUES (867, 'robetorr', '2011-10-18 12:15:02.109699', 9);
INSERT INTO auditoria VALUES (868, 'robetorr', '2011-10-18 12:17:56.249971', 0);
INSERT INTO auditoria VALUES (869, 'robetorr', '2011-10-18 12:18:04.647063', 9);
INSERT INTO auditoria VALUES (870, 'robetorr', '2011-10-18 12:23:35.311093', 0);
INSERT INTO auditoria VALUES (871, 'robetorr', '2011-10-18 12:23:47.419373', 9);
INSERT INTO auditoria VALUES (872, 'robetorr', '2011-10-18 12:26:02.981429', 3);
INSERT INTO auditoria VALUES (873, 'robetorr', '2011-10-18 12:26:07.450913', 16);
INSERT INTO auditoria VALUES (874, 'robetorr', '2011-10-18 12:31:23.951677', 0);
INSERT INTO auditoria VALUES (875, 'robetorr', '2011-10-18 12:31:33.562053', 9);
INSERT INTO auditoria VALUES (876, 'robetorr', '2011-10-18 12:44:55.830986', 0);
INSERT INTO auditoria VALUES (877, 'robetorr', '2011-10-18 12:45:00.506123', 3);
INSERT INTO auditoria VALUES (878, 'robetorr', '2011-10-18 12:45:04.215741', 9);
INSERT INTO auditoria VALUES (879, 'robetorr', '2011-10-19 07:10:59.947011', 0);
INSERT INTO auditoria VALUES (880, 'robetorr', '2011-10-19 07:11:07.581313', 9);
INSERT INTO auditoria VALUES (881, 'robetorr', '2011-10-19 07:56:33.107953', 0);
INSERT INTO auditoria VALUES (882, 'robetorr', '2011-10-19 07:56:40.515297', 9);
INSERT INTO auditoria VALUES (883, 'robetorr', '2011-10-19 08:03:24.668487', 0);
INSERT INTO auditoria VALUES (884, 'robetorr', '2011-10-19 08:03:30.214133', 9);
INSERT INTO auditoria VALUES (885, 'robetorr', '2011-10-19 12:02:15.119202', 0);
INSERT INTO auditoria VALUES (886, 'robetorr', '2011-10-19 12:02:30.93745', 9);
INSERT INTO auditoria VALUES (887, 'robetorr', '2011-10-19 12:05:24.588608', 9);
INSERT INTO auditoria VALUES (888, 'robetorr', '2011-10-19 12:09:49.692076', 3);
INSERT INTO auditoria VALUES (889, 'robetorr', '2011-10-19 12:10:22.155438', 9);
INSERT INTO auditoria VALUES (890, 'robetorr', '2011-10-19 12:10:48.676681', 0);
INSERT INTO auditoria VALUES (891, 'robetorr', '2011-10-19 12:10:53.930009', 9);
INSERT INTO auditoria VALUES (892, 'carlos', '2011-10-28 14:26:30.402715', 0);
INSERT INTO auditoria VALUES (893, 'carlos', '2011-10-28 14:27:30.393215', 0);
INSERT INTO auditoria VALUES (894, 'carlos', '2011-10-28 14:27:40.255232', 11);
INSERT INTO auditoria VALUES (895, 'carlos', '2011-10-28 14:27:49.321401', 9);
INSERT INTO auditoria VALUES (896, 'carlos', '2011-10-28 14:27:57.752539', 40);
INSERT INTO auditoria VALUES (897, 'carlos', '2011-10-28 14:29:26.950857', 17);
INSERT INTO auditoria VALUES (898, 'carlos', '2011-10-28 14:32:56.035157', 40);
INSERT INTO auditoria VALUES (899, 'carlos', '2011-10-28 14:34:23.593811', 17);
INSERT INTO auditoria VALUES (900, 'carlos', '2011-10-28 14:34:59.025562', 40);
INSERT INTO auditoria VALUES (901, 'carlos', '2011-10-28 14:35:25.041361', 40);
INSERT INTO auditoria VALUES (902, 'carlos', '2011-10-28 14:38:28.129043', 40);
INSERT INTO auditoria VALUES (903, 'carlos', '2011-10-28 14:38:58.520351', 0);
INSERT INTO auditoria VALUES (904, 'carlos', '2011-10-28 14:39:02.845437', 17);
INSERT INTO auditoria VALUES (905, 'carlos', '2011-10-28 14:39:13.087633', 40);
INSERT INTO auditoria VALUES (906, 'carlos', '2011-10-28 14:40:29.429268', 40);
INSERT INTO auditoria VALUES (907, 'carlos', '2011-10-28 14:44:35.701014', 40);
INSERT INTO auditoria VALUES (908, 'carlos', '2011-10-28 14:44:51.841046', 9);
INSERT INTO auditoria VALUES (909, 'carlos', '2011-10-28 14:57:30.447102', 9);
INSERT INTO auditoria VALUES (910, 'carlos', '2011-10-28 14:57:36.0391', 17);
INSERT INTO auditoria VALUES (911, 'carlos', '2011-10-28 14:57:46.198289', 40);
INSERT INTO auditoria VALUES (912, 'carlos', '2011-10-28 14:58:08.595092', 40);
INSERT INTO auditoria VALUES (913, 'carlos', '2011-10-28 14:58:13.521272', 17);
INSERT INTO auditoria VALUES (914, 'carlos', '2011-10-28 14:58:23.055167', 40);
INSERT INTO auditoria VALUES (915, 'carlos', '2011-10-28 14:58:27.072098', 40);
INSERT INTO auditoria VALUES (916, 'carlos', '2011-10-28 14:58:30.519222', 40);
INSERT INTO auditoria VALUES (917, 'carlos', '2011-10-28 14:58:34.073014', 40);
INSERT INTO auditoria VALUES (918, 'carlos', '2011-10-28 14:58:39.56192', 40);
INSERT INTO auditoria VALUES (919, 'carlos', '2011-10-28 14:58:42.942264', 40);
INSERT INTO auditoria VALUES (920, 'carlos', '2011-10-28 14:58:50.592764', 40);
INSERT INTO auditoria VALUES (921, 'carlos', '2011-10-28 14:58:55.290197', 40);
INSERT INTO auditoria VALUES (922, 'carlos', '2011-10-28 14:59:02.268735', 40);
INSERT INTO auditoria VALUES (923, 'carlos', '2011-10-28 14:59:16.449388', 9);
INSERT INTO auditoria VALUES (924, 'carlos', '2011-10-28 15:01:13.543674', 9);
INSERT INTO auditoria VALUES (925, 'carlos', '2011-10-28 15:01:17.328449', 17);
INSERT INTO auditoria VALUES (926, 'carlos', '2011-10-28 15:01:28.249807', 40);
INSERT INTO auditoria VALUES (927, 'carlos', '2011-10-28 15:01:34.204446', 40);
INSERT INTO auditoria VALUES (928, 'carlos', '2011-10-28 15:01:39.770976', 40);
INSERT INTO auditoria VALUES (929, 'carlos', '2011-10-28 15:01:42.730035', 40);
INSERT INTO auditoria VALUES (930, 'carlos', '2011-10-28 15:01:53.78195', 40);
INSERT INTO auditoria VALUES (931, 'carlos', '2011-10-28 15:01:57.952623', 40);
INSERT INTO auditoria VALUES (932, 'carlos', '2011-10-28 15:02:04.094917', 40);
INSERT INTO auditoria VALUES (933, 'carlos', '2011-10-28 15:02:10.187913', 9);
INSERT INTO auditoria VALUES (934, 'carlos', '2011-10-28 15:02:53.364551', 9);
INSERT INTO auditoria VALUES (935, 'carlos', '2011-10-28 15:02:55.983123', 17);
INSERT INTO auditoria VALUES (936, 'carlos', '2011-10-28 15:03:27.940213', 9);
INSERT INTO auditoria VALUES (937, 'carlos', '2011-10-28 15:03:55.208218', 11);
INSERT INTO auditoria VALUES (938, 'carlos', '2011-10-28 15:05:01.436868', 11);
INSERT INTO auditoria VALUES (939, 'carlos', '2011-10-28 15:05:03.944645', 23);
INSERT INTO auditoria VALUES (940, 'carlos', '2011-10-28 15:05:33.207362', 23);
INSERT INTO auditoria VALUES (941, 'JOSEVAL', '2011-10-28 15:06:09.917931', 0);
INSERT INTO auditoria VALUES (942, 'JOSEVAL', '2011-10-28 15:06:13.93285', 9);
INSERT INTO auditoria VALUES (943, 'JOSEVAL', '2011-10-28 15:07:13.281134', 17);
INSERT INTO auditoria VALUES (944, 'JOSEVAL', '2011-10-28 15:08:40.133859', 9);
INSERT INTO auditoria VALUES (945, 'JOSEVAL', '2011-10-28 15:09:28.094509', 3);
INSERT INTO auditoria VALUES (946, 'carlos', '2011-10-31 06:25:07.599066', 0);
INSERT INTO auditoria VALUES (947, 'carlos', '2011-10-31 06:25:16.159738', 9);
INSERT INTO auditoria VALUES (948, 'carlos', '2011-10-31 06:25:59.136411', 17);
INSERT INTO auditoria VALUES (949, 'carlos', '2011-10-31 06:27:01.830118', 9);
INSERT INTO auditoria VALUES (950, 'carlos', '2011-10-31 06:27:08.151974', 17);
INSERT INTO auditoria VALUES (951, 'carlos', '2011-10-31 06:27:10.570217', 9);
INSERT INTO auditoria VALUES (952, 'carlos', '2011-10-31 06:27:49.444084', 0);
INSERT INTO auditoria VALUES (953, 'carlos', '2011-10-31 06:27:51.585141', 9);
INSERT INTO auditoria VALUES (954, 'carlos', '2011-10-31 06:32:20.003071', 40);
INSERT INTO auditoria VALUES (955, 'carlos', '2011-10-31 06:32:48.104398', 17);
INSERT INTO auditoria VALUES (956, 'carlos', '2011-10-31 06:33:06.120498', 40);
INSERT INTO auditoria VALUES (957, 'carlos', '2011-10-31 11:19:48.916331', 0);
INSERT INTO auditoria VALUES (958, 'carlos', '2011-10-31 11:24:13.180754', 9);
INSERT INTO auditoria VALUES (959, 'carlos', '2011-10-31 11:24:21.294437', 9);
INSERT INTO auditoria VALUES (960, 'carlos', '2011-10-31 11:50:53.329064', 40);
INSERT INTO auditoria VALUES (961, 'carlos', '2011-10-31 11:52:19.850612', 9);
INSERT INTO auditoria VALUES (962, 'carlos', '2011-10-31 11:52:50.358544', 9);
INSERT INTO auditoria VALUES (963, 'carlos', '2011-10-31 12:29:24.724799', 0);
INSERT INTO auditoria VALUES (964, 'carlos', '2011-10-31 12:29:28.140754', 9);
INSERT INTO auditoria VALUES (965, 'carlos', '2011-10-31 12:31:47.979077', 9);
INSERT INTO auditoria VALUES (966, 'carlos', '2011-10-31 12:33:27.850656', 40);
INSERT INTO auditoria VALUES (967, 'carlos', '2011-10-31 12:34:06.908213', 9);
INSERT INTO auditoria VALUES (968, 'carlos', '2011-10-31 13:28:23.991333', 9);
INSERT INTO auditoria VALUES (969, 'carlos', '2011-10-31 13:52:45.935299', 40);
INSERT INTO auditoria VALUES (970, 'carlos', '2011-10-31 13:57:55.646493', 40);
INSERT INTO auditoria VALUES (971, 'carlos', '2011-10-31 13:58:40.539526', 23);
INSERT INTO auditoria VALUES (972, 'carlos', '2011-10-31 13:58:46.291973', 33);
INSERT INTO auditoria VALUES (973, 'carlos', '2011-10-31 13:58:56.681889', 12);
INSERT INTO auditoria VALUES (974, 'carlos', '2011-11-01 08:05:50.027035', 0);
INSERT INTO auditoria VALUES (975, 'carlos', '2011-11-01 08:06:12.503188', 40);
INSERT INTO auditoria VALUES (976, 'carlos', '2011-11-01 08:07:33.470883', 0);
INSERT INTO auditoria VALUES (977, 'carlos', '2011-11-01 08:09:46.73204', 9);
INSERT INTO auditoria VALUES (978, 'carlos', '2011-11-01 08:11:35.498029', 9);
INSERT INTO auditoria VALUES (979, 'carlos', '2011-11-01 08:11:43.742631', 9);
INSERT INTO auditoria VALUES (980, 'carlos', '2011-11-01 08:17:23.304419', 9);
INSERT INTO auditoria VALUES (981, 'carlos', '2011-11-01 08:18:52.294247', 40);
INSERT INTO auditoria VALUES (982, 'carlos', '2011-11-01 08:19:16.615759', 9);
INSERT INTO auditoria VALUES (983, 'carlos', '2011-11-01 08:20:02.142296', 9);
INSERT INTO auditoria VALUES (984, 'carlos', '2011-11-01 08:23:43.73239', 9);
INSERT INTO auditoria VALUES (985, 'carlos', '2011-11-01 08:26:28.638746', 9);
INSERT INTO auditoria VALUES (986, 'carlos', '2011-11-01 08:28:46.363351', 9);
INSERT INTO auditoria VALUES (987, 'carlos', '2011-11-01 08:31:05.721982', 9);
INSERT INTO auditoria VALUES (988, 'carlos', '2011-11-01 08:36:07.841645', 9);
INSERT INTO auditoria VALUES (989, 'carlos', '2011-11-01 08:36:46.476765', 9);
INSERT INTO auditoria VALUES (990, 'carlos', '2011-11-01 08:36:55.323516', 40);
INSERT INTO auditoria VALUES (991, 'carlos', '2011-11-01 08:38:06.033846', 9);
INSERT INTO auditoria VALUES (992, 'carlos', '2011-11-01 08:39:20.528355', 9);
INSERT INTO auditoria VALUES (993, 'carlos', '2011-11-01 08:39:31.504734', 40);
INSERT INTO auditoria VALUES (994, 'carlos', '2011-11-01 08:40:07.087027', 9);
INSERT INTO auditoria VALUES (995, 'carlos', '2011-11-01 08:40:25.434371', 9);
INSERT INTO auditoria VALUES (996, 'carlos', '2011-11-01 08:42:53.54752', 9);
INSERT INTO auditoria VALUES (997, 'carlos', '2011-11-01 08:45:07.612982', 9);
INSERT INTO auditoria VALUES (998, 'carlos', '2011-11-01 08:45:36.805836', 40);
INSERT INTO auditoria VALUES (999, 'carlos', '2011-11-01 08:45:41.516367', 9);
INSERT INTO auditoria VALUES (1000, 'carlos', '2011-11-01 08:46:22.050076', 40);
INSERT INTO auditoria VALUES (1001, 'carlos', '2011-11-01 08:46:48.494313', 40);
INSERT INTO auditoria VALUES (1002, 'carlos', '2011-11-01 08:46:59.846059', 9);
INSERT INTO auditoria VALUES (1003, 'carlos', '2011-11-01 08:52:29.114508', 9);
INSERT INTO auditoria VALUES (1004, 'carlos', '2011-11-01 08:56:58.845596', 9);
INSERT INTO auditoria VALUES (1005, 'carlos', '2011-11-01 08:58:57.724887', 9);
INSERT INTO auditoria VALUES (1006, 'carlos', '2011-11-01 09:05:02.416605', 9);
INSERT INTO auditoria VALUES (1007, 'carlos', '2011-11-01 09:07:03.737196', 9);
INSERT INTO auditoria VALUES (1008, 'carlos', '2011-11-01 09:33:26.212355', 9);
INSERT INTO auditoria VALUES (1009, 'carlos', '2011-11-01 10:32:55.171439', 0);
INSERT INTO auditoria VALUES (1010, 'carlos', '2011-11-01 10:34:19.410102', 9);
INSERT INTO auditoria VALUES (1011, 'carlos', '2011-11-01 10:34:26.512145', 0);
INSERT INTO auditoria VALUES (1012, 'carlos', '2011-11-01 10:34:46.037601', 9);
INSERT INTO auditoria VALUES (1013, 'carlos', '2011-11-01 10:34:53.011713', 40);
INSERT INTO auditoria VALUES (1014, 'carlos', '2011-11-01 10:35:10.080631', 40);
INSERT INTO auditoria VALUES (1015, 'carlos', '2011-11-01 10:35:34.498821', 9);
INSERT INTO auditoria VALUES (1016, 'carlos', '2011-11-01 10:36:00.399106', 9);
INSERT INTO auditoria VALUES (1017, 'carlos', '2011-11-01 10:36:46.64348', 9);
INSERT INTO auditoria VALUES (1018, 'carlos', '2011-11-01 10:42:48.561846', 9);
INSERT INTO auditoria VALUES (1019, 'carlos', '2011-11-01 10:45:32.99618', 40);
INSERT INTO auditoria VALUES (1020, 'carlos', '2011-11-01 10:45:48.380908', 9);
INSERT INTO auditoria VALUES (1021, 'carlos', '2011-11-01 10:47:40.627836', 9);
INSERT INTO auditoria VALUES (1022, 'carlos', '2011-11-01 10:50:40.122783', 9);
INSERT INTO auditoria VALUES (1023, 'carlos', '2011-11-01 10:53:14.829221', 9);
INSERT INTO auditoria VALUES (1024, 'carlos', '2011-11-01 10:53:22.757428', 40);
INSERT INTO auditoria VALUES (1025, 'carlos', '2011-11-01 10:53:40.430865', 9);
INSERT INTO auditoria VALUES (1026, 'carlos', '2011-11-01 10:55:36.13797', 9);
INSERT INTO auditoria VALUES (1027, 'carlos', '2011-11-01 10:57:20.036462', 40);
INSERT INTO auditoria VALUES (1028, 'carlos', '2011-11-01 10:57:40.568455', 40);
INSERT INTO auditoria VALUES (1029, 'carlos', '2011-11-01 11:00:57.485361', 40);
INSERT INTO auditoria VALUES (1030, 'carlos', '2011-11-01 11:01:03.737976', 9);
INSERT INTO auditoria VALUES (1031, 'carlos', '2011-11-01 11:14:16.482567', 9);
INSERT INTO auditoria VALUES (1032, 'carlos', '2011-11-01 11:14:19.990109', 40);
INSERT INTO auditoria VALUES (1033, 'carlos', '2011-11-01 11:15:34.176952', 9);
INSERT INTO auditoria VALUES (1034, 'carlos', '2011-11-01 11:22:48.446155', 9);
INSERT INTO auditoria VALUES (1035, 'carlos', '2011-11-01 11:27:43.823675', 9);
INSERT INTO auditoria VALUES (1036, 'carlos', '2011-11-01 11:33:14.418935', 9);
INSERT INTO auditoria VALUES (1037, 'carlos', '2011-11-01 11:35:26.613037', 40);
INSERT INTO auditoria VALUES (1038, 'carlos', '2011-11-01 11:35:45.086441', 9);
INSERT INTO auditoria VALUES (1039, 'carlos', '2011-11-01 11:36:40.610051', 40);
INSERT INTO auditoria VALUES (1040, 'carlos', '2011-11-01 11:36:52.350789', 9);
INSERT INTO auditoria VALUES (1041, 'carlos', '2011-11-01 11:37:00.74667', 40);
INSERT INTO auditoria VALUES (1042, 'carlos', '2011-11-01 11:37:10.460348', 40);
INSERT INTO auditoria VALUES (1043, 'carlos', '2011-11-01 11:37:40.10839', 9);
INSERT INTO auditoria VALUES (1044, 'carlos', '2011-11-01 11:37:42.015865', 40);
INSERT INTO auditoria VALUES (1045, 'carlos', '2011-11-01 11:38:38.76828', 40);
INSERT INTO auditoria VALUES (1046, 'carlos', '2011-11-01 11:46:16.130686', 9);
INSERT INTO auditoria VALUES (1047, 'prueba', '2011-11-01 12:07:11.865361', 0);
INSERT INTO auditoria VALUES (1048, 'prueba', '2011-11-01 12:07:14.382688', 9);
INSERT INTO auditoria VALUES (1049, 'prueba', '2011-11-01 12:09:33.820831', 17);
INSERT INTO auditoria VALUES (1050, 'prueba', '2011-11-01 12:09:49.275639', 9);
INSERT INTO auditoria VALUES (1051, 'prueba', '2011-11-01 12:09:57.913666', 17);
INSERT INTO auditoria VALUES (1052, 'prueba', '2011-11-01 12:10:37.005276', 9);
INSERT INTO auditoria VALUES (1053, 'prueba', '2011-11-01 12:10:48.100411', 14);
INSERT INTO auditoria VALUES (1054, 'prueba', '2011-11-01 12:10:58.503407', 17);
INSERT INTO auditoria VALUES (1055, 'prueba', '2011-11-01 12:16:08.715043', 17);
INSERT INTO auditoria VALUES (1056, 'prueba', '2011-11-01 12:19:52.548144', 9);
INSERT INTO auditoria VALUES (1057, 'carlos', '2011-11-01 12:32:02.811347', 17);
INSERT INTO auditoria VALUES (1058, 'carlos', '2011-11-01 12:32:23.173727', 40);
INSERT INTO auditoria VALUES (1059, 'carlos', '2011-11-01 12:36:12.667357', 17);
INSERT INTO auditoria VALUES (1060, 'carlos', '2011-11-01 12:36:28.347414', 17);
INSERT INTO auditoria VALUES (1061, 'carlos', '2011-11-01 12:47:53.196006', 17);
INSERT INTO auditoria VALUES (1062, 'prueba', '2011-11-01 12:51:06.146617', 9);
INSERT INTO auditoria VALUES (1063, 'carlos', '2011-11-01 12:52:51.461878', 17);
INSERT INTO auditoria VALUES (1064, 'carlos', '2011-11-01 12:54:11.495478', 17);
INSERT INTO auditoria VALUES (1065, 'prueba', '2011-11-01 12:55:13.727115', 9);
INSERT INTO auditoria VALUES (1066, 'prueba', '2011-11-01 12:57:08.080478', 9);
INSERT INTO auditoria VALUES (1067, 'prueba', '2011-11-01 13:00:55.928771', 9);
INSERT INTO auditoria VALUES (1068, 'prueba', '2011-11-01 13:02:50.436816', 9);
INSERT INTO auditoria VALUES (1069, 'prueba', '2011-11-01 13:03:37.288987', 9);
INSERT INTO auditoria VALUES (1070, 'prueba', '2011-11-01 13:03:47.748967', 17);
INSERT INTO auditoria VALUES (1071, 'prueba', '2011-11-01 13:04:19.805594', 9);
INSERT INTO auditoria VALUES (1072, 'prueba', '2011-11-01 13:06:10.76117', 9);
INSERT INTO auditoria VALUES (1073, 'carlos', '2011-11-02 06:52:37.880039', 0);
INSERT INTO auditoria VALUES (1074, 'carlos', '2011-11-02 06:55:41.69002', 0);
INSERT INTO auditoria VALUES (1075, 'carlos', '2011-11-02 06:56:23.491095', 40);
INSERT INTO auditoria VALUES (1076, 'prueba', '2011-11-02 06:57:17.824471', 0);
INSERT INTO auditoria VALUES (1077, 'prueba', '2011-11-02 06:57:33.335111', 9);
INSERT INTO auditoria VALUES (1078, 'prueba', '2011-11-02 06:58:21.337102', 17);
INSERT INTO auditoria VALUES (1079, 'prueba', '2011-11-02 06:58:41.594413', 9);
INSERT INTO auditoria VALUES (1080, 'carlos', '2011-11-02 06:59:05.476082', 17);
INSERT INTO auditoria VALUES (1081, 'carlos', '2011-11-02 06:59:10.750378', 40);
INSERT INTO auditoria VALUES (1082, 'carlos', '2011-11-02 06:59:37.336448', 40);
INSERT INTO auditoria VALUES (1083, 'carlos', '2011-11-02 07:00:49.797469', 0);
INSERT INTO auditoria VALUES (1084, 'carlos', '2011-11-02 07:01:18.765361', 17);
INSERT INTO auditoria VALUES (1085, 'carlos', '2011-11-02 07:04:36.077295', 17);
INSERT INTO auditoria VALUES (1086, 'carlos', '2011-11-02 07:05:13.013419', 0);
INSERT INTO auditoria VALUES (1087, 'carlos', '2011-11-02 07:05:21.333333', 17);
INSERT INTO auditoria VALUES (1088, 'carlos', '2011-11-02 07:06:29.013996', 0);
INSERT INTO auditoria VALUES (1089, 'carlos', '2011-11-02 07:06:43.602154', 40);
INSERT INTO auditoria VALUES (1090, 'carlos', '2011-11-02 07:07:08.172045', 40);
INSERT INTO auditoria VALUES (1091, 'carlos', '2011-11-02 07:07:40.933776', 40);
INSERT INTO auditoria VALUES (1092, 'carlos', '2011-11-02 07:10:08.255016', 9);
INSERT INTO auditoria VALUES (1093, 'carlos', '2011-11-02 07:15:13.559294', 9);
INSERT INTO auditoria VALUES (1094, 'carlos', '2011-11-02 07:16:31.188643', 9);
INSERT INTO auditoria VALUES (1095, 'carlos', '2011-11-02 07:16:43.607448', 40);
INSERT INTO auditoria VALUES (1096, 'carlos', '2011-11-02 07:17:06.896491', 40);
INSERT INTO auditoria VALUES (1097, 'carlos', '2011-11-02 07:17:21.202323', 40);
INSERT INTO auditoria VALUES (1098, 'carlos', '2011-11-02 07:17:30.341396', 17);
INSERT INTO auditoria VALUES (1099, 'carlos', '2011-11-02 07:21:47.910218', 17);
INSERT INTO auditoria VALUES (1100, 'carlos', '2011-11-02 07:23:28.686424', 17);
INSERT INTO auditoria VALUES (1101, 'carlos', '2011-11-02 07:23:34.942194', 17);
INSERT INTO auditoria VALUES (1102, 'carlos', '2011-11-02 07:23:36.407422', 17);
INSERT INTO auditoria VALUES (1103, 'carlos', '2011-11-02 07:23:57.131217', 0);
INSERT INTO auditoria VALUES (1104, 'carlos', '2011-11-02 07:24:07.192092', 17);
INSERT INTO auditoria VALUES (1105, 'carlos', '2011-11-02 07:25:08.374438', 17);
INSERT INTO auditoria VALUES (1106, 'carlos', '2011-11-02 07:26:35.856962', 40);
INSERT INTO auditoria VALUES (1107, 'carlos', '2011-11-02 07:26:41.086543', 17);
INSERT INTO auditoria VALUES (1108, 'carlos', '2011-11-02 07:26:48.999896', 40);
INSERT INTO auditoria VALUES (1109, 'carlos', '2011-11-02 07:27:35.959517', 0);
INSERT INTO auditoria VALUES (1110, 'carlos', '2011-11-02 07:27:45.156808', 40);
INSERT INTO auditoria VALUES (1111, 'carlos', '2011-11-02 07:28:13.754483', 40);
INSERT INTO auditoria VALUES (1112, 'carlos', '2011-11-02 07:28:44.100037', 40);
INSERT INTO auditoria VALUES (1113, 'carlos', '2011-11-02 07:29:05.708752', 40);
INSERT INTO auditoria VALUES (1114, 'carlos', '2011-11-02 07:30:02.421787', 40);
INSERT INTO auditoria VALUES (1115, 'carlos', '2011-11-02 07:31:16.642519', 40);
INSERT INTO auditoria VALUES (1116, 'carlos', '2011-11-02 07:32:41.803882', 17);
INSERT INTO auditoria VALUES (1117, 'carlos', '2011-11-02 07:34:11.329', 17);
INSERT INTO auditoria VALUES (1118, 'carlos', '2011-11-02 07:35:02.769575', 17);
INSERT INTO auditoria VALUES (1119, 'carlos', '2011-11-02 07:35:05.692896', 17);
INSERT INTO auditoria VALUES (1120, 'carlos', '2011-11-02 07:35:30.461109', 0);
INSERT INTO auditoria VALUES (1121, 'carlos', '2011-11-02 07:35:38.02874', 17);
INSERT INTO auditoria VALUES (1122, 'carlos', '2011-11-02 07:36:50.253174', 40);
INSERT INTO auditoria VALUES (1123, 'carlos', '2011-11-02 07:36:53.064546', 17);
INSERT INTO auditoria VALUES (1124, 'carlos', '2011-11-02 07:37:01.411966', 40);
INSERT INTO auditoria VALUES (1125, 'prueba', '2011-11-02 07:39:20.793311', 9);
INSERT INTO auditoria VALUES (1126, 'carlos', '2011-11-02 07:39:54.790108', 0);
INSERT INTO auditoria VALUES (1127, 'carlos', '2011-11-02 07:40:06.121902', 17);
INSERT INTO auditoria VALUES (1128, 'prueba', '2011-11-02 07:41:41.565537', 9);
INSERT INTO auditoria VALUES (1129, 'carlos', '2011-11-02 07:42:40.581779', 17);
INSERT INTO auditoria VALUES (1130, 'prueba', '2011-11-02 07:44:43.302614', 9);
INSERT INTO auditoria VALUES (1131, 'prueba', '2011-11-02 07:46:02.634172', 9);
INSERT INTO auditoria VALUES (1132, 'prueba', '2011-11-02 07:48:19.354442', 9);
INSERT INTO auditoria VALUES (1133, 'prueba', '2011-11-02 07:50:08.352117', 9);
INSERT INTO auditoria VALUES (1134, 'carlos', '2011-11-02 07:50:15.913178', 9);
INSERT INTO auditoria VALUES (1135, 'prueba', '2011-11-02 07:50:17.790173', 17);
INSERT INTO auditoria VALUES (1136, 'carlos', '2011-11-02 07:50:33.752719', 17);
INSERT INTO auditoria VALUES (1137, 'carlos', '2011-11-02 07:57:59.819964', 0);
INSERT INTO auditoria VALUES (1138, 'carlos', '2011-11-02 07:58:03.747181', 9);
INSERT INTO auditoria VALUES (1139, 'carlos', '2011-11-02 08:32:10.742234', 9);
INSERT INTO auditoria VALUES (1140, 'carlos', '2011-11-02 08:35:07.553178', 9);
INSERT INTO auditoria VALUES (1141, 'carlos', '2011-11-02 08:36:52.852386', 9);
INSERT INTO auditoria VALUES (1142, 'carlos', '2011-11-02 08:38:04.688653', 9);
INSERT INTO auditoria VALUES (1143, 'carlos', '2011-11-02 08:41:07.419788', 9);
INSERT INTO auditoria VALUES (1144, 'carlos', '2011-11-02 08:42:15.133366', 9);
INSERT INTO auditoria VALUES (1145, 'carlos', '2011-11-02 08:42:25.204574', 17);
INSERT INTO auditoria VALUES (1146, 'carlos', '2011-11-02 08:46:49.918541', 40);
INSERT INTO auditoria VALUES (1147, 'carlos', '2011-11-02 08:50:37.394561', 17);
INSERT INTO auditoria VALUES (1148, 'carlos', '2011-11-02 08:52:54.871056', 17);
INSERT INTO auditoria VALUES (1149, 'carlos', '2011-11-02 08:53:38.251696', 40);
INSERT INTO auditoria VALUES (1150, 'carlos', '2011-11-02 08:54:04.478219', 9);
INSERT INTO auditoria VALUES (1151, 'carlos', '2011-11-02 09:02:56.104289', 9);
INSERT INTO auditoria VALUES (1152, 'carlos', '2011-11-02 09:07:22.861314', 9);
INSERT INTO auditoria VALUES (1153, 'carlos', '2011-11-02 09:08:31.532463', 9);
INSERT INTO auditoria VALUES (1154, 'carlos', '2011-11-02 09:09:36.098132', 9);
INSERT INTO auditoria VALUES (1155, 'carlos', '2011-11-02 09:10:26.67128', 9);
INSERT INTO auditoria VALUES (1156, 'carlos', '2011-11-02 09:11:18.556065', 9);
INSERT INTO auditoria VALUES (1157, 'carlos', '2011-11-02 09:11:26.315439', 17);
INSERT INTO auditoria VALUES (1158, 'carlos', '2011-11-02 09:12:03.463531', 40);
INSERT INTO auditoria VALUES (1159, 'carlos', '2011-11-02 09:12:29.200307', 40);
INSERT INTO auditoria VALUES (1160, 'carlos', '2011-11-02 09:12:39.636733', 40);
INSERT INTO auditoria VALUES (1161, 'carlos', '2011-11-02 09:12:53.109128', 40);
INSERT INTO auditoria VALUES (1162, 'carlos', '2011-11-02 09:13:05.290093', 40);
INSERT INTO auditoria VALUES (1163, 'carlos', '2011-11-02 09:13:15.117267', 40);
INSERT INTO auditoria VALUES (1164, 'carlos', '2011-11-02 09:14:49.522269', 17);
INSERT INTO auditoria VALUES (1165, 'carlos', '2011-11-02 09:15:01.035754', 40);
INSERT INTO auditoria VALUES (1166, 'carlos', '2011-11-02 09:15:36.836605', 40);
INSERT INTO auditoria VALUES (1167, 'carlos', '2011-11-02 09:15:59.386806', 40);
INSERT INTO auditoria VALUES (1168, 'carlos', '2011-11-02 09:16:16.799094', 40);
INSERT INTO auditoria VALUES (1169, 'carlos', '2011-11-02 09:16:28.326631', 40);
INSERT INTO auditoria VALUES (1170, 'carlos', '2011-11-02 09:16:41.60068', 40);
INSERT INTO auditoria VALUES (1171, 'carlos', '2011-11-02 09:17:24.441177', 17);
INSERT INTO auditoria VALUES (1172, 'carlos', '2011-11-02 09:26:23.654449', 0);
INSERT INTO auditoria VALUES (1173, 'carlos', '2011-11-02 09:26:28.718063', 40);
INSERT INTO auditoria VALUES (1174, 'carlos', '2011-11-02 09:26:52.097013', 40);
INSERT INTO auditoria VALUES (1175, 'carlos', '2011-11-02 09:27:26.960644', 40);
INSERT INTO auditoria VALUES (1176, 'carlos', '2011-11-02 09:27:50.714213', 40);
INSERT INTO auditoria VALUES (1177, 'carlos', '2011-11-02 09:28:36.652744', 40);
INSERT INTO auditoria VALUES (1178, 'carlos', '2011-11-02 09:28:55.924819', 40);
INSERT INTO auditoria VALUES (1179, 'carlos', '2011-11-02 09:29:14.302092', 17);
INSERT INTO auditoria VALUES (1180, 'carlos', '2011-11-02 09:29:31.545581', 40);
INSERT INTO auditoria VALUES (1181, 'carlos', '2011-11-02 09:29:50.124914', 17);
INSERT INTO auditoria VALUES (1182, 'carlos', '2011-11-02 09:35:33.527631', 3);
INSERT INTO auditoria VALUES (1183, 'carlos', '2011-11-02 09:35:42.127186', 40);
INSERT INTO auditoria VALUES (1184, 'carlos', '2011-11-02 09:35:57.017209', 40);
INSERT INTO auditoria VALUES (1185, 'carlos', '2011-11-02 09:36:52.321143', 17);
INSERT INTO auditoria VALUES (1186, 'robetorr', '2011-11-02 11:19:35.658917', 0);
INSERT INTO auditoria VALUES (1187, 'robetorr', '2011-11-02 11:20:14.564048', 40);
INSERT INTO auditoria VALUES (1188, 'robetorr', '2011-11-02 11:20:43.428974', 40);
INSERT INTO auditoria VALUES (1189, 'carlos', '2011-11-02 11:21:02.505362', 0);
INSERT INTO auditoria VALUES (1190, 'carlos', '2011-11-02 11:21:08.912491', 17);
INSERT INTO auditoria VALUES (1191, 'carlos', '2011-11-02 11:21:26.703104', 40);
INSERT INTO auditoria VALUES (1192, 'carlos', '2011-11-02 11:22:27.902753', 40);
INSERT INTO auditoria VALUES (1193, 'robetorr', '2011-11-02 11:22:36.224365', 40);
INSERT INTO auditoria VALUES (1194, 'carlos', '2011-11-02 11:22:41.597419', 40);
INSERT INTO auditoria VALUES (1195, 'carlos', '2011-11-02 11:22:56.991837', 40);
INSERT INTO auditoria VALUES (1196, 'robetorr', '2011-11-02 11:23:07.993352', 17);
INSERT INTO auditoria VALUES (1197, 'carlos', '2011-11-02 11:23:12.682012', 40);
INSERT INTO auditoria VALUES (1198, 'carlos', '2011-11-02 11:23:25.897949', 40);
INSERT INTO auditoria VALUES (1199, 'carlos', '2011-11-02 11:24:28.646398', 40);
INSERT INTO auditoria VALUES (1200, 'carlos', '2011-11-02 11:24:41.943574', 9);
INSERT INTO auditoria VALUES (1201, 'robetorr', '2011-11-02 11:27:12.161868', 21);
INSERT INTO auditoria VALUES (1202, 'robetorr', '2011-11-02 11:27:12.175826', 21);
INSERT INTO auditoria VALUES (1203, 'robetorr', '2011-11-02 11:27:33.695427', 17);
INSERT INTO auditoria VALUES (1204, 'robetorr', '2011-11-02 11:27:45.723311', 40);
INSERT INTO auditoria VALUES (1205, 'robetorr', '2011-11-02 11:28:30.807428', 40);
INSERT INTO auditoria VALUES (1206, 'robetorr', '2011-11-02 11:28:45.60146', 40);
INSERT INTO auditoria VALUES (1207, 'robetorr', '2011-11-02 11:29:01.27609', 40);
INSERT INTO auditoria VALUES (1208, 'robetorr', '2011-11-02 11:29:19.996831', 40);
INSERT INTO auditoria VALUES (1209, 'robetorr', '2011-11-02 11:29:48.714953', 40);
INSERT INTO auditoria VALUES (1210, 'robetorr', '2011-11-02 11:30:02.720335', 17);
INSERT INTO auditoria VALUES (1211, 'robetorr', '2011-11-02 11:38:06.07277', 0);
INSERT INTO auditoria VALUES (1212, 'robetorr', '2011-11-02 11:55:12.76244', 17);
INSERT INTO auditoria VALUES (1213, 'carlos', '2011-11-02 12:01:20.90473', 17);
INSERT INTO auditoria VALUES (1214, 'carlos', '2011-11-02 12:02:06.763086', 40);
INSERT INTO auditoria VALUES (1215, 'robetorr', '2011-11-02 12:03:29.328313', 17);
INSERT INTO auditoria VALUES (1216, 'carlos', '2011-11-02 12:04:53.673368', 17);
INSERT INTO auditoria VALUES (1217, 'carlos', '2011-11-02 12:05:00.829904', 17);
INSERT INTO auditoria VALUES (1218, 'carlos', '2011-11-02 12:08:02.1696', 17);
INSERT INTO auditoria VALUES (1219, 'carlos', '2011-11-02 12:10:59.957407', 40);
INSERT INTO auditoria VALUES (1220, 'carlos', '2011-11-02 12:11:53.342301', 17);
INSERT INTO auditoria VALUES (1221, 'robetorr', '2011-11-02 12:22:20.019195', 0);
INSERT INTO auditoria VALUES (1222, 'robetorr', '2011-11-02 12:23:05.51091', 9);
INSERT INTO auditoria VALUES (1223, 'robetorr', '2011-11-02 12:25:25.270001', 9);
INSERT INTO auditoria VALUES (1224, 'carlos', '2011-11-03 05:30:35.06641', 0);
INSERT INTO auditoria VALUES (1225, 'carlos', '2011-11-03 05:31:11.034956', 17);
INSERT INTO auditoria VALUES (1226, 'carlos', '2011-11-03 05:32:32.852222', 40);
INSERT INTO auditoria VALUES (1227, 'carlos', '2011-11-03 05:32:48.447666', 40);
INSERT INTO auditoria VALUES (1228, 'carlos', '2011-11-03 05:32:58.645108', 40);
INSERT INTO auditoria VALUES (1229, 'carlos', '2011-11-03 05:34:16.222918', 40);
INSERT INTO auditoria VALUES (1230, 'carlos', '2011-11-03 05:42:26.767287', 40);
INSERT INTO auditoria VALUES (1231, 'carlos', '2011-11-03 05:42:47.967882', 9);
INSERT INTO auditoria VALUES (1232, 'carlos', '2011-11-03 06:06:18.655278', 9);
INSERT INTO auditoria VALUES (1233, 'carlos', '2011-11-03 06:15:39.494152', 9);
INSERT INTO auditoria VALUES (1234, 'carlos', '2011-11-03 06:19:37.724177', 9);
INSERT INTO auditoria VALUES (1235, 'carlos', '2011-11-03 06:21:50.349615', 9);
INSERT INTO auditoria VALUES (1236, 'carlos', '2011-11-03 06:25:27.388081', 9);
INSERT INTO auditoria VALUES (1237, 'carlos', '2011-11-03 06:27:27.846029', 9);
INSERT INTO auditoria VALUES (1238, 'carlos', '2011-11-03 06:27:30.971915', 17);
INSERT INTO auditoria VALUES (1239, 'carlos', '2011-11-03 06:31:55.147712', 17);
INSERT INTO auditoria VALUES (1240, 'carlos', '2011-11-03 06:33:17.027486', 17);
INSERT INTO auditoria VALUES (1241, 'carlos', '2011-11-03 06:34:49.036631', 9);
INSERT INTO auditoria VALUES (1242, 'carlos', '2011-11-03 06:36:10.382679', 17);
INSERT INTO auditoria VALUES (1243, 'carlos', '2011-11-03 06:36:23.465383', 9);
INSERT INTO auditoria VALUES (1244, 'carlos', '2011-11-03 06:36:32.590948', 40);
INSERT INTO auditoria VALUES (1245, 'carlos', '2011-11-03 06:37:49.451274', 40);
INSERT INTO auditoria VALUES (1246, 'carlos', '2011-11-03 06:38:08.345371', 40);
INSERT INTO auditoria VALUES (1247, 'carlos', '2011-11-03 06:38:16.963477', 40);
INSERT INTO auditoria VALUES (1248, 'carlos', '2011-11-03 06:38:28.83595', 40);
INSERT INTO auditoria VALUES (1249, 'carlos', '2011-11-03 06:38:38.90203', 40);
INSERT INTO auditoria VALUES (1250, 'carlos', '2011-11-03 06:38:51.66843', 9);
INSERT INTO auditoria VALUES (1251, 'carlos', '2011-11-03 08:08:12.463688', 9);
INSERT INTO auditoria VALUES (1252, 'carlos', '2011-11-03 08:08:16.581893', 17);
INSERT INTO auditoria VALUES (1253, 'carlos', '2011-11-03 08:10:48.902315', 40);
INSERT INTO auditoria VALUES (1254, 'carlos', '2011-11-03 08:11:23.290641', 9);
INSERT INTO auditoria VALUES (1255, 'carlos', '2011-11-03 08:15:44.857387', 9);
INSERT INTO auditoria VALUES (1256, 'carlos', '2011-11-03 08:16:31.284093', 9);
INSERT INTO auditoria VALUES (1257, 'carlos', '2011-11-03 08:19:46.184534', 9);
INSERT INTO auditoria VALUES (1258, 'carlos', '2011-11-03 08:21:25.35733', 9);
INSERT INTO auditoria VALUES (1259, 'carlos', '2011-11-03 08:26:45.727378', 9);
INSERT INTO auditoria VALUES (1260, 'carlos', '2011-11-03 08:28:13.429397', 9);
INSERT INTO auditoria VALUES (1261, 'carlos', '2011-11-03 08:28:16.518208', 17);
INSERT INTO auditoria VALUES (1262, 'carlos', '2011-11-03 08:28:49.005322', 9);
INSERT INTO auditoria VALUES (1263, 'carlos', '2011-11-03 09:21:16.627996', 9);
INSERT INTO auditoria VALUES (1264, 'carlos', '2011-11-03 09:22:59.052627', 9);
INSERT INTO auditoria VALUES (1265, 'carlos', '2011-11-03 09:26:01.235528', 9);
INSERT INTO auditoria VALUES (1266, 'carlos', '2011-11-03 09:27:40.729181', 9);
INSERT INTO auditoria VALUES (1267, 'carlos', '2011-11-03 09:29:44.936793', 9);
INSERT INTO auditoria VALUES (1268, 'carlos', '2011-11-03 09:32:03.194348', 9);
INSERT INTO auditoria VALUES (1269, 'carlos', '2011-11-03 09:33:50.999258', 17);
INSERT INTO auditoria VALUES (1270, 'carlos', '2011-11-03 09:34:42.327866', 40);
INSERT INTO auditoria VALUES (1271, 'carlos', '2011-11-03 09:35:14.87395', 40);
INSERT INTO auditoria VALUES (1272, 'carlos', '2011-11-03 09:35:27.150258', 40);
INSERT INTO auditoria VALUES (1273, 'carlos', '2011-11-03 09:35:40.313972', 40);
INSERT INTO auditoria VALUES (1274, 'carlos', '2011-11-03 09:35:50.816921', 40);
INSERT INTO auditoria VALUES (1275, 'carlos', '2011-11-03 09:36:00.486245', 40);
INSERT INTO auditoria VALUES (1276, 'carlos', '2011-11-03 09:36:12.599058', 40);
INSERT INTO auditoria VALUES (1277, 'carlos', '2011-11-03 09:37:01.49623', 17);
INSERT INTO auditoria VALUES (1278, 'carlos', '2011-11-03 09:37:30.054178', 40);
INSERT INTO auditoria VALUES (1279, 'carlos', '2011-11-03 09:37:49.650416', 9);
INSERT INTO auditoria VALUES (1280, 'carlos', '2011-11-03 09:38:18.804511', 40);
INSERT INTO auditoria VALUES (1281, 'carlos', '2011-11-03 09:38:47.547597', 9);
INSERT INTO auditoria VALUES (1282, 'carlos', '2011-11-03 10:06:00.981866', 0);
INSERT INTO auditoria VALUES (1283, 'carlos', '2011-11-03 10:06:08.011936', 17);
INSERT INTO auditoria VALUES (1284, 'carlos', '2011-11-03 10:06:43.660357', 40);
INSERT INTO auditoria VALUES (1285, 'carlos', '2011-11-03 10:07:08.12753', 9);
INSERT INTO auditoria VALUES (1286, 'carlos', '2011-11-03 10:07:43.662507', 40);
INSERT INTO auditoria VALUES (1287, 'carlos', '2011-11-03 10:07:58.202223', 17);
INSERT INTO auditoria VALUES (1288, 'carlos', '2011-11-03 10:08:08.453406', 9);
INSERT INTO auditoria VALUES (1289, 'carlos', '2011-11-03 10:33:48.798441', 9);
INSERT INTO auditoria VALUES (1290, 'carlos', '2011-11-03 10:33:52.620636', 17);
INSERT INTO auditoria VALUES (1291, 'carlos', '2011-11-03 10:34:49.884594', 9);
INSERT INTO auditoria VALUES (1292, 'carlos', '2011-11-03 10:57:05.891206', 9);
INSERT INTO auditoria VALUES (1293, 'carlos', '2011-11-03 10:57:09.533388', 17);
INSERT INTO auditoria VALUES (1294, 'carlos', '2011-11-03 10:57:52.687662', 9);
INSERT INTO auditoria VALUES (1295, 'carlos', '2011-11-03 10:58:09.520867', 40);
INSERT INTO auditoria VALUES (1296, 'carlos', '2011-11-03 10:58:22.150453', 40);
INSERT INTO auditoria VALUES (1297, 'carlos', '2011-11-03 11:01:40.353143', 17);
INSERT INTO auditoria VALUES (1298, 'carlos', '2011-11-03 11:04:08.004441', 40);
INSERT INTO auditoria VALUES (1299, 'carlos', '2011-11-03 11:05:39.052276', 9);
INSERT INTO auditoria VALUES (1300, 'carlos', '2011-11-03 11:07:59.632853', 40);
INSERT INTO auditoria VALUES (1301, 'carlos', '2011-11-03 11:08:16.790592', 40);
INSERT INTO auditoria VALUES (1302, 'carlos', '2011-11-03 11:08:21.918722', 40);
INSERT INTO auditoria VALUES (1303, 'carlos', '2011-11-03 11:08:29.38371', 40);
INSERT INTO auditoria VALUES (1304, 'carlos', '2011-11-03 11:08:39.587728', 40);
INSERT INTO auditoria VALUES (1305, 'carlos', '2011-11-03 11:08:50.25953', 40);
INSERT INTO auditoria VALUES (1306, 'carlos', '2011-11-03 11:09:04.032943', 40);
INSERT INTO auditoria VALUES (1307, 'carlos', '2011-11-03 11:09:32.503787', 17);
INSERT INTO auditoria VALUES (1308, 'carlos', '2011-11-03 11:10:01.77157', 40);
INSERT INTO auditoria VALUES (1309, 'carlos', '2011-11-03 11:10:20.114928', 40);
INSERT INTO auditoria VALUES (1310, 'carlos', '2011-11-03 11:10:32.08996', 40);
INSERT INTO auditoria VALUES (1311, 'carlos', '2011-11-03 11:10:52.339571', 9);
INSERT INTO auditoria VALUES (1312, 'carlos', '2011-11-03 12:01:12.817114', 9);
INSERT INTO auditoria VALUES (1313, 'carlos', '2011-11-03 12:01:15.943683', 40);
INSERT INTO auditoria VALUES (1314, 'carlos', '2011-11-03 12:01:29.707312', 9);
INSERT INTO auditoria VALUES (1315, 'carlos', '2011-11-03 12:04:48.221899', 9);
INSERT INTO auditoria VALUES (1316, 'nerio', '2011-11-03 12:06:41.582114', 0);
INSERT INTO auditoria VALUES (1317, 'nerio', '2011-11-03 12:06:51.123605', 18);
INSERT INTO auditoria VALUES (1318, 'nerio', '2011-11-03 12:07:25.450532', 9);
INSERT INTO auditoria VALUES (1319, 'nerio', '2011-11-03 12:07:33.890338', 40);
INSERT INTO auditoria VALUES (1320, 'nerio', '2011-11-03 12:08:44.094114', 14);
INSERT INTO auditoria VALUES (1321, 'carlos', '2011-11-03 12:08:52.153009', 9);
INSERT INTO auditoria VALUES (1322, 'nerio', '2011-11-03 12:09:27.911912', 32);
INSERT INTO auditoria VALUES (1323, 'nerio', '2011-11-03 12:09:50.646787', 32);
INSERT INTO auditoria VALUES (1324, 'carlos', '2011-11-03 12:12:29.770384', 9);
INSERT INTO auditoria VALUES (1325, 'carlos', '2011-11-03 12:20:25.426337', 9);
INSERT INTO auditoria VALUES (1326, 'carlos', '2011-11-03 12:21:46.130766', 9);
INSERT INTO auditoria VALUES (1327, 'carlos', '2011-11-03 12:21:51.551906', 17);
INSERT INTO auditoria VALUES (1328, 'carlos', '2011-11-04 06:06:28.318364', 0);
INSERT INTO auditoria VALUES (1329, 'carlos', '2011-11-04 06:06:40.306118', 17);
INSERT INTO auditoria VALUES (1330, 'carlos', '2011-11-04 06:07:59.143098', 40);
INSERT INTO auditoria VALUES (1331, 'carlos', '2011-11-04 06:08:20.732582', 17);
INSERT INTO auditoria VALUES (1332, 'carlos', '2011-11-04 06:09:15.74411', 40);
INSERT INTO auditoria VALUES (1333, 'carlos', '2011-11-04 06:09:46.573751', 40);
INSERT INTO auditoria VALUES (1334, 'carlos', '2011-11-04 06:10:08.78293', 40);
INSERT INTO auditoria VALUES (1335, 'carlos', '2011-11-04 06:10:35.662337', 40);
INSERT INTO auditoria VALUES (1336, 'carlos', '2011-11-04 06:11:42.342494', 40);
INSERT INTO auditoria VALUES (1337, 'carlos', '2011-11-04 06:11:54.937819', 40);
INSERT INTO auditoria VALUES (1338, 'carlos', '2011-11-04 06:12:19.581028', 40);
INSERT INTO auditoria VALUES (1339, 'carlos', '2011-11-04 06:14:57.086816', 17);
INSERT INTO auditoria VALUES (1340, 'carlos', '2011-11-04 06:15:39.625993', 12);
INSERT INTO auditoria VALUES (1341, 'carlos', '2011-11-04 06:19:52.193806', 40);
INSERT INTO auditoria VALUES (1342, 'carlos', '2011-11-04 06:24:32.323277', 9);
INSERT INTO auditoria VALUES (1343, 'carlos', '2011-11-04 06:37:38.252655', 9);
INSERT INTO auditoria VALUES (1344, 'carlos', '2011-11-04 06:37:43.999836', 17);
INSERT INTO auditoria VALUES (1345, 'carlos', '2011-11-04 06:37:53.26697', 17);
INSERT INTO auditoria VALUES (1346, 'carlos', '2011-11-04 06:39:53.474689', 40);
INSERT INTO auditoria VALUES (1347, 'carlos', '2011-11-04 06:40:09.303382', 9);
INSERT INTO auditoria VALUES (1348, 'carlos', '2011-11-04 06:56:32.487094', 0);
INSERT INTO auditoria VALUES (1349, 'carlos', '2011-11-04 06:57:18.235637', 40);
INSERT INTO auditoria VALUES (1350, 'carlos', '2011-11-04 06:57:23.65865', 9);
INSERT INTO auditoria VALUES (1351, 'carlos', '2011-11-04 10:25:46.935275', 0);
INSERT INTO auditoria VALUES (1352, 'carlos', '2011-11-04 10:25:54.740569', 40);
INSERT INTO auditoria VALUES (1353, 'carlos', '2011-11-04 10:26:02.20951', 17);
INSERT INTO auditoria VALUES (1354, 'carlos', '2011-11-04 10:27:06.201514', 40);
INSERT INTO auditoria VALUES (1355, 'carlos', '2011-11-04 10:27:18.178778', 9);
INSERT INTO auditoria VALUES (1356, 'carlos', '2011-11-04 10:43:55.206844', 9);
INSERT INTO auditoria VALUES (1357, 'carlos', '2011-11-04 10:49:38.035773', 9);
INSERT INTO auditoria VALUES (1358, 'carlos', '2011-11-04 10:51:37.830039', 9);
INSERT INTO auditoria VALUES (1359, 'carlos', '2011-11-04 10:53:20.162875', 9);
INSERT INTO auditoria VALUES (1360, 'carlos', '2011-11-04 10:55:18.243154', 9);
INSERT INTO auditoria VALUES (1361, 'carlos', '2011-11-04 10:56:40.817565', 9);
INSERT INTO auditoria VALUES (1362, 'carlos', '2011-11-04 10:56:51.382978', 17);
INSERT INTO auditoria VALUES (1363, 'carlos', '2011-11-04 10:57:55.594052', 40);
INSERT INTO auditoria VALUES (1364, 'carlos', '2011-11-04 10:58:13.049199', 9);
INSERT INTO auditoria VALUES (1365, 'carlos', '2011-11-04 11:21:07.803073', 9);
INSERT INTO auditoria VALUES (1366, 'carlos', '2011-11-04 11:23:16.682382', 9);
INSERT INTO auditoria VALUES (1367, 'carlos', '2011-11-04 11:26:00.258581', 9);
INSERT INTO auditoria VALUES (1368, 'carlos', '2011-11-04 11:27:41.013815', 9);
INSERT INTO auditoria VALUES (1369, 'carlos', '2011-11-04 11:30:19.789618', 9);
INSERT INTO auditoria VALUES (1370, 'carlos', '2011-11-04 11:31:26.050715', 9);
INSERT INTO auditoria VALUES (1371, 'carlos', '2011-11-04 11:31:32.123521', 17);
INSERT INTO auditoria VALUES (1372, 'carlos', '2011-11-04 11:31:44.764158', 9);
INSERT INTO auditoria VALUES (1373, 'carlos', '2011-11-04 11:32:15.53896', 17);
INSERT INTO auditoria VALUES (1374, 'carlos', '2011-11-04 11:41:46.835791', 9);
INSERT INTO auditoria VALUES (1375, 'robetorr', '2011-11-04 11:48:09.179144', 0);
INSERT INTO auditoria VALUES (1376, 'carlos', '2011-11-04 12:08:55.610167', 9);
INSERT INTO auditoria VALUES (1377, 'carlos', '2011-11-04 12:10:23.870605', 9);
INSERT INTO auditoria VALUES (1378, 'carlos', '2011-11-04 12:11:33.550039', 9);
INSERT INTO auditoria VALUES (1379, 'carlos', '2011-11-04 12:12:32.711617', 9);
INSERT INTO auditoria VALUES (1380, 'carlos', '2011-11-04 12:13:31.523478', 9);
INSERT INTO auditoria VALUES (1381, 'carlos', '2011-11-04 12:14:14.641665', 9);
INSERT INTO auditoria VALUES (1382, 'carlos', '2011-11-04 12:14:21.433181', 17);
INSERT INTO auditoria VALUES (1383, 'robetorr', '2011-11-07 06:48:13.612935', 0);
INSERT INTO auditoria VALUES (1384, 'carlos', '2011-11-07 10:59:41.004197', 0);
INSERT INTO auditoria VALUES (1385, 'carlos', '2011-11-07 11:00:00.373098', 17);
INSERT INTO auditoria VALUES (1386, 'carlos', '2011-11-07 11:09:34.549182', 40);
INSERT INTO auditoria VALUES (1387, 'carlos', '2011-11-07 11:10:14.956172', 9);
INSERT INTO auditoria VALUES (1388, 'prueba', '2011-11-07 11:35:42.088009', 0);
INSERT INTO auditoria VALUES (1389, 'prueba', '2011-11-07 11:40:09.727794', 17);
INSERT INTO auditoria VALUES (1390, 'prueba', '2011-11-07 11:40:26.60911', 9);
INSERT INTO auditoria VALUES (1391, 'carlos', '2011-11-07 12:56:09.609836', 0);
INSERT INTO auditoria VALUES (1392, 'carlos', '2011-11-07 12:56:16.624538', 17);
INSERT INTO auditoria VALUES (1393, 'carlos', '2011-11-07 12:56:31.281341', 17);
INSERT INTO auditoria VALUES (1394, 'carlos', '2011-11-07 12:56:36.61745', 17);
INSERT INTO auditoria VALUES (1395, 'carlos', '2011-11-07 12:57:27.453402', 40);
INSERT INTO auditoria VALUES (1396, 'carlos', '2011-11-07 12:58:06.628863', 40);
INSERT INTO auditoria VALUES (1397, 'carlos', '2011-11-07 12:59:48.239197', 9);
INSERT INTO auditoria VALUES (1398, 'carlos', '2011-11-07 13:00:05.821415', 40);
INSERT INTO auditoria VALUES (1399, 'carlos', '2011-11-07 13:02:03.34694', 40);
INSERT INTO auditoria VALUES (1400, 'carlos', '2011-11-07 13:02:37.698622', 41);
INSERT INTO auditoria VALUES (1401, 'carlos', '2011-11-07 13:05:14.971559', 0);
INSERT INTO auditoria VALUES (1402, 'carlos', '2011-11-07 13:05:20.985641', 3);
INSERT INTO auditoria VALUES (1403, 'carlos', '2011-11-08 06:22:17.770723', 0);
INSERT INTO auditoria VALUES (1404, 'carlos', '2011-11-08 06:22:25.288546', 17);
INSERT INTO auditoria VALUES (1405, 'carlos', '2011-11-08 06:23:43.822438', 40);
INSERT INTO auditoria VALUES (1406, 'prueba', '2011-11-08 06:33:35.090877', 0);
INSERT INTO auditoria VALUES (1407, 'prueba', '2011-11-08 06:34:02.286625', 9);
INSERT INTO auditoria VALUES (1408, 'carlos', '2011-11-08 06:37:44.787679', 17);
INSERT INTO auditoria VALUES (1409, 'carlos', '2011-11-08 06:38:15.56222', 40);
INSERT INTO auditoria VALUES (1410, 'carlos', '2011-11-08 06:44:21.169121', 40);
INSERT INTO auditoria VALUES (1411, 'carlos', '2011-11-08 06:45:00.264291', 40);
INSERT INTO auditoria VALUES (1412, 'carlos', '2011-11-08 06:46:31.334388', 9);
INSERT INTO auditoria VALUES (1413, 'prueba', '2011-11-08 06:55:41.322961', 0);
INSERT INTO auditoria VALUES (1414, 'carlos', '2011-11-08 06:55:46.275504', 0);
INSERT INTO auditoria VALUES (1415, 'prueba', '2011-11-08 06:55:54.186283', 9);
INSERT INTO auditoria VALUES (1416, 'prueba', '2011-11-08 06:56:19.847141', 17);
INSERT INTO auditoria VALUES (1417, 'carlos', '2011-11-08 06:56:41.23746', 9);
INSERT INTO auditoria VALUES (1418, 'prueba', '2011-11-08 06:56:57.878719', 9);
INSERT INTO auditoria VALUES (1419, 'carlos', '2011-11-08 07:19:57.828751', 9);
INSERT INTO auditoria VALUES (1420, 'carlos', '2011-11-08 07:20:51.228303', 40);
INSERT INTO auditoria VALUES (1421, 'prueba', '2011-11-08 07:20:52.215214', 9);
INSERT INTO auditoria VALUES (1422, 'carlos', '2011-11-08 07:22:26.124858', 17);
INSERT INTO auditoria VALUES (1423, 'prueba', '2011-11-08 07:23:26.440665', 9);
INSERT INTO auditoria VALUES (1424, 'carlos', '2011-11-08 07:23:45.019238', 9);
INSERT INTO auditoria VALUES (1425, 'prueba', '2011-11-08 07:25:22.823606', 9);
INSERT INTO auditoria VALUES (1426, 'carlos', '2011-11-08 07:30:11.552883', 9);
INSERT INTO auditoria VALUES (1427, 'prueba', '2011-11-08 07:30:45.059223', 9);
INSERT INTO auditoria VALUES (1428, 'carlos', '2011-11-08 07:31:51.481639', 17);
INSERT INTO auditoria VALUES (1429, 'carlos', '2011-11-08 07:32:01.172618', 40);
INSERT INTO auditoria VALUES (1430, 'carlos', '2011-11-08 07:32:32.028175', 40);
INSERT INTO auditoria VALUES (1431, 'carlos', '2011-11-08 07:32:45.716465', 9);
INSERT INTO auditoria VALUES (1432, 'prueba', '2011-11-08 07:32:48.33899', 9);
INSERT INTO auditoria VALUES (1433, 'prueba', '2011-11-08 07:34:24.213934', 9);
INSERT INTO auditoria VALUES (1434, 'prueba', '2011-11-08 07:34:32.741767', 17);
INSERT INTO auditoria VALUES (1435, 'prueba', '2011-11-08 07:34:40.592889', 9);
INSERT INTO auditoria VALUES (1436, 'carlos', '2011-11-08 07:43:55.833561', 9);
INSERT INTO auditoria VALUES (1437, 'carlos', '2011-11-08 07:43:58.973552', 40);
INSERT INTO auditoria VALUES (1438, 'carlos', '2011-11-08 07:44:45.752613', 17);
INSERT INTO auditoria VALUES (1439, 'carlos', '2011-11-08 07:45:17.655039', 40);
INSERT INTO auditoria VALUES (1440, 'carlos', '2011-11-08 07:45:29.332296', 40);
INSERT INTO auditoria VALUES (1441, 'carlos', '2011-11-08 07:45:44.440791', 40);
INSERT INTO auditoria VALUES (1442, 'carlos', '2011-11-08 07:45:55.969785', 40);
INSERT INTO auditoria VALUES (1443, 'carlos', '2011-11-08 07:46:06.074906', 40);
INSERT INTO auditoria VALUES (1444, 'prueba', '2011-11-08 07:48:01.38573', 9);
INSERT INTO auditoria VALUES (1445, 'carlos', '2011-11-08 07:48:03.972117', 17);
INSERT INTO auditoria VALUES (1446, 'prueba', '2011-11-08 07:48:05.920963', 17);
INSERT INTO auditoria VALUES (1447, 'carlos', '2011-11-08 07:49:38.442602', 9);
INSERT INTO auditoria VALUES (1448, 'prueba', '2011-11-08 07:49:43.202064', 9);
INSERT INTO auditoria VALUES (1449, 'carlos', '2011-11-08 07:51:43.168491', 9);
INSERT INTO auditoria VALUES (1450, 'carlos', '2011-11-08 07:53:58.800092', 9);
INSERT INTO auditoria VALUES (1451, 'carlos', '2011-11-08 07:54:44.564179', 9);
INSERT INTO auditoria VALUES (1452, 'carlos', '2011-11-08 07:55:35.471758', 9);
INSERT INTO auditoria VALUES (1453, 'carlos', '2011-11-08 07:55:36.424588', 9);
INSERT INTO auditoria VALUES (1454, 'carlos', '2011-11-08 07:55:39.233035', 17);
INSERT INTO auditoria VALUES (1455, 'carlos', '2011-11-08 07:57:51.66362', 9);
INSERT INTO auditoria VALUES (1456, 'carlos', '2011-11-08 08:17:05.962912', 9);
INSERT INTO auditoria VALUES (1457, 'carlos', '2011-11-08 08:19:35.488335', 9);
INSERT INTO auditoria VALUES (1458, 'carlos', '2011-11-08 08:21:21.697412', 9);
INSERT INTO auditoria VALUES (1459, 'carlos', '2011-11-08 08:21:56.80998', 9);
INSERT INTO auditoria VALUES (1460, 'carlos', '2011-11-08 08:22:40.926255', 9);
INSERT INTO auditoria VALUES (1461, 'carlos', '2011-11-08 08:24:19.311232', 9);
INSERT INTO auditoria VALUES (1462, 'carlos', '2011-11-08 08:24:22.542073', 17);
INSERT INTO auditoria VALUES (1463, 'carlos', '2011-11-08 08:24:47.896475', 17);
INSERT INTO auditoria VALUES (1464, 'carlos', '2011-11-08 08:27:02.190436', 17);
INSERT INTO auditoria VALUES (1465, 'carlos', '2011-11-08 08:29:35.379059', 9);
INSERT INTO auditoria VALUES (1466, 'prueba', '2011-11-08 08:36:15.850034', 9);
INSERT INTO auditoria VALUES (1467, 'prueba', '2011-11-08 08:43:26.037134', 9);
INSERT INTO auditoria VALUES (1468, 'prueba', '2011-11-08 08:45:52.522952', 9);
INSERT INTO auditoria VALUES (1469, 'prueba', '2011-11-08 08:47:27.50499', 9);
INSERT INTO auditoria VALUES (1470, 'prueba', '2011-11-08 08:48:54.345137', 9);
INSERT INTO auditoria VALUES (1471, 'prueba', '2011-11-08 08:49:44.158842', 9);
INSERT INTO auditoria VALUES (1472, 'prueba', '2011-11-08 08:49:46.644949', 17);
INSERT INTO auditoria VALUES (1473, 'carlos', '2011-11-08 08:55:01.064191', 9);
INSERT INTO auditoria VALUES (1474, 'carlos', '2011-11-08 09:02:58.120957', 9);
INSERT INTO auditoria VALUES (1475, 'carlos', '2011-11-08 09:04:59.677348', 9);
INSERT INTO auditoria VALUES (1476, 'carlos', '2011-11-08 09:06:49.602227', 9);
INSERT INTO auditoria VALUES (1477, 'carlos', '2011-11-08 09:07:48.477965', 9);
INSERT INTO auditoria VALUES (1478, 'carlos', '2011-11-08 09:09:09.215186', 9);
INSERT INTO auditoria VALUES (1479, 'carlos', '2011-11-08 09:09:13.410824', 17);
INSERT INTO auditoria VALUES (1480, 'carlos', '2011-11-08 10:26:01.289212', 0);
INSERT INTO auditoria VALUES (1481, 'carlos', '2011-11-08 10:26:05.908173', 9);
INSERT INTO auditoria VALUES (1482, 'prueba', '2011-11-08 10:41:48.365376', 0);
INSERT INTO auditoria VALUES (1483, 'prueba', '2011-11-08 10:42:07.082944', 9);
INSERT INTO auditoria VALUES (1484, 'prueba', '2011-11-08 10:42:13.032142', 17);
INSERT INTO auditoria VALUES (1485, 'prueba', '2011-11-08 10:45:18.729039', 9);
INSERT INTO auditoria VALUES (1486, 'carlos', '2011-11-08 10:46:22.274417', 9);
INSERT INTO auditoria VALUES (1487, 'carlos', '2011-11-08 10:50:30.264787', 9);
INSERT INTO auditoria VALUES (1488, 'carlos', '2011-11-08 10:52:24.816296', 9);
INSERT INTO auditoria VALUES (1489, 'carlos', '2011-11-08 10:53:41.85565', 9);
INSERT INTO auditoria VALUES (1490, 'carlos', '2011-11-08 10:55:28.347307', 9);
INSERT INTO auditoria VALUES (1491, 'carlos', '2011-11-08 10:57:28.98973', 9);
INSERT INTO auditoria VALUES (1492, 'carlos', '2011-11-08 10:57:34.442775', 17);
INSERT INTO auditoria VALUES (1493, 'carlos', '2011-11-08 10:58:13.04067', 9);
INSERT INTO auditoria VALUES (1494, 'carlos', '2011-11-08 11:21:15.432037', 9);
INSERT INTO auditoria VALUES (1495, 'carlos', '2011-11-08 11:22:51.969203', 9);
INSERT INTO auditoria VALUES (1496, 'carlos', '2011-11-08 11:24:18.873405', 9);
INSERT INTO auditoria VALUES (1497, 'carlos', '2011-11-08 11:25:35.832728', 9);
INSERT INTO auditoria VALUES (1498, 'carlos', '2011-11-08 11:27:10.98915', 9);
INSERT INTO auditoria VALUES (1499, 'carlos', '2011-11-08 11:28:38.039964', 9);
INSERT INTO auditoria VALUES (1500, 'carlos', '2011-11-08 11:28:42.396502', 17);
INSERT INTO auditoria VALUES (1501, 'carlos', '2011-11-08 11:29:28.019374', 17);
INSERT INTO auditoria VALUES (1502, 'carlos', '2011-11-08 11:30:29.330956', 9);
INSERT INTO auditoria VALUES (1503, 'carlos', '2011-11-08 11:40:14.90463', 17);
INSERT INTO auditoria VALUES (1504, 'carlos', '2011-11-08 11:40:23.663896', 9);
INSERT INTO auditoria VALUES (1505, 'carlos', '2011-11-08 11:58:10.232053', 9);
INSERT INTO auditoria VALUES (1506, 'prueba', '2011-11-08 11:59:11.700404', 9);
INSERT INTO auditoria VALUES (1507, 'prueba', '2011-11-08 11:59:25.230144', 9);
INSERT INTO auditoria VALUES (1508, 'carlos', '2011-11-08 12:00:43.388247', 9);
INSERT INTO auditoria VALUES (1509, 'carlos', '2011-11-08 12:02:05.842803', 9);
INSERT INTO auditoria VALUES (1510, 'prueba', '2011-11-08 12:03:51.530248', 9);
INSERT INTO auditoria VALUES (1511, 'carlos', '2011-11-08 12:03:56.285226', 9);
INSERT INTO auditoria VALUES (1512, 'carlos', '2011-11-08 12:04:47.166341', 9);
INSERT INTO auditoria VALUES (1513, 'carlos', '2011-11-08 12:05:43.985603', 9);
INSERT INTO auditoria VALUES (1514, 'carlos', '2011-11-08 12:05:49.300048', 17);
INSERT INTO auditoria VALUES (1515, 'carlos', '2011-11-08 12:06:02.571624', 9);
INSERT INTO auditoria VALUES (1516, 'prueba', '2011-11-08 12:06:46.386701', 9);
INSERT INTO auditoria VALUES (1517, 'prueba', '2011-11-08 12:08:38.103439', 9);
INSERT INTO auditoria VALUES (1518, 'prueba', '2011-11-08 12:09:47.503456', 9);
INSERT INTO auditoria VALUES (1519, 'prueba', '2011-11-08 12:11:09.35691', 9);
INSERT INTO auditoria VALUES (1520, 'prueba', '2011-11-08 12:11:12.809812', 17);
INSERT INTO auditoria VALUES (1521, 'prueba', '2011-11-09 05:48:54.108517', 0);
INSERT INTO auditoria VALUES (1522, 'carlos', '2011-11-09 05:50:04.060908', 0);
INSERT INTO auditoria VALUES (1523, 'carlos', '2011-11-09 05:50:55.968945', 17);
INSERT INTO auditoria VALUES (1524, 'carlos', '2011-11-09 05:51:40.849011', 40);
INSERT INTO auditoria VALUES (1525, 'prueba', '2011-11-09 05:51:42.704199', 9);
INSERT INTO auditoria VALUES (1526, 'carlos', '2011-11-09 05:52:00.632013', 40);
INSERT INTO auditoria VALUES (1527, 'carlos', '2011-11-09 05:52:13.113402', 9);
INSERT INTO auditoria VALUES (1528, 'carlos', '2011-11-09 05:56:29.866597', 9);
INSERT INTO auditoria VALUES (1529, 'carlos', '2011-11-09 06:19:48.311315', 9);
INSERT INTO auditoria VALUES (1530, 'carlos', '2011-11-09 06:23:03.225903', 9);
INSERT INTO auditoria VALUES (1531, 'carlos', '2011-11-09 06:25:00.787669', 9);
INSERT INTO auditoria VALUES (1532, 'carlos', '2011-11-09 06:25:59.894817', 9);
INSERT INTO auditoria VALUES (1533, 'carlos', '2011-11-09 06:27:13.853659', 9);
INSERT INTO auditoria VALUES (1534, 'carlos', '2011-11-09 06:28:05.552178', 9);
INSERT INTO auditoria VALUES (1535, 'carlos', '2011-11-09 06:28:07.978964', 17);
INSERT INTO auditoria VALUES (1536, 'carlos', '2011-11-09 06:28:45.536374', 40);
INSERT INTO auditoria VALUES (1537, 'carlos', '2011-11-09 06:28:55.746871', 40);
INSERT INTO auditoria VALUES (1538, 'carlos', '2011-11-09 06:29:02.943774', 40);
INSERT INTO auditoria VALUES (1539, 'carlos', '2011-11-09 06:29:09.757254', 40);
INSERT INTO auditoria VALUES (1540, 'carlos', '2011-11-09 06:29:21.845649', 40);
INSERT INTO auditoria VALUES (1541, 'carlos', '2011-11-09 06:29:32.173607', 40);
INSERT INTO auditoria VALUES (1542, 'carlos', '2011-11-09 06:29:49.358237', 9);
INSERT INTO auditoria VALUES (1543, 'carlos', '2011-11-09 06:30:50.285513', 9);
INSERT INTO auditoria VALUES (1544, 'carlos', '2011-11-09 06:30:53.406294', 17);
INSERT INTO auditoria VALUES (1545, 'carlos', '2011-11-09 06:31:08.43282', 40);
INSERT INTO auditoria VALUES (1546, 'carlos', '2011-11-09 06:31:20.556047', 40);
INSERT INTO auditoria VALUES (1547, 'prueba', '2011-11-09 06:48:29.774364', 9);
INSERT INTO auditoria VALUES (1548, 'prueba', '2011-11-09 06:50:51.015751', 9);
INSERT INTO auditoria VALUES (1549, 'prueba', '2011-11-09 06:53:29.988371', 9);
INSERT INTO auditoria VALUES (1550, 'prueba', '2011-11-09 06:55:33.020322', 9);
INSERT INTO auditoria VALUES (1551, 'prueba', '2011-11-09 06:57:08.268737', 9);
INSERT INTO auditoria VALUES (1552, 'prueba', '2011-11-09 06:58:15.979334', 9);
INSERT INTO auditoria VALUES (1553, 'prueba', '2011-11-09 06:58:21.719237', 17);
INSERT INTO auditoria VALUES (1554, 'carlos', '2011-11-09 07:00:04.781637', 0);
INSERT INTO auditoria VALUES (1555, 'carlos', '2011-11-09 07:00:39.892737', 40);
INSERT INTO auditoria VALUES (1556, 'carlos', '2011-11-09 07:00:54.852167', 40);
INSERT INTO auditoria VALUES (1557, 'carlos', '2011-11-09 07:01:07.210858', 40);
INSERT INTO auditoria VALUES (1558, 'carlos', '2011-11-09 07:01:38.533504', 40);
INSERT INTO auditoria VALUES (1559, 'carlos', '2011-11-09 07:01:49.363623', 40);
INSERT INTO auditoria VALUES (1560, 'carlos', '2011-11-09 07:02:02.443042', 40);
INSERT INTO auditoria VALUES (1561, 'carlos', '2011-11-09 07:02:21.684758', 17);
INSERT INTO auditoria VALUES (1562, 'carlos', '2011-11-09 07:04:20.66114', 9);
INSERT INTO auditoria VALUES (1563, 'prueba', '2011-11-09 07:36:11.608959', 0);
INSERT INTO auditoria VALUES (1564, 'prueba', '2011-11-09 07:36:16.176005', 17);
INSERT INTO auditoria VALUES (1565, 'prueba', '2011-11-09 07:37:33.408188', 9);
INSERT INTO auditoria VALUES (1566, 'carlos', '2011-11-09 07:38:15.223697', 9);
INSERT INTO auditoria VALUES (1567, 'carlos', '2011-11-09 07:38:26.227603', 40);
INSERT INTO auditoria VALUES (1568, 'carlos', '2011-11-09 07:38:40.873533', 40);
INSERT INTO auditoria VALUES (1569, 'carlos', '2011-11-09 07:38:49.671119', 40);
INSERT INTO auditoria VALUES (1570, 'carlos', '2011-11-09 07:39:27.084158', 40);
INSERT INTO auditoria VALUES (1571, 'carlos', '2011-11-09 07:39:38.091387', 40);
INSERT INTO auditoria VALUES (1572, 'carlos', '2011-11-09 07:39:57.003892', 40);
INSERT INTO auditoria VALUES (1573, 'carlos', '2011-11-09 07:40:21.448234', 17);
INSERT INTO auditoria VALUES (1574, 'carlos', '2011-11-09 07:41:18.949104', 40);
INSERT INTO auditoria VALUES (1575, 'carlos', '2011-11-09 07:41:29.180798', 40);
INSERT INTO auditoria VALUES (1576, 'carlos', '2011-11-09 07:41:41.809432', 40);
INSERT INTO auditoria VALUES (1577, 'carlos', '2011-11-09 07:41:55.903327', 40);
INSERT INTO auditoria VALUES (1578, 'carlos', '2011-11-09 07:42:06.807193', 40);
INSERT INTO auditoria VALUES (1579, 'carlos', '2011-11-09 07:42:18.877017', 40);
INSERT INTO auditoria VALUES (1580, 'carlos', '2011-11-09 07:42:36.390609', 40);
INSERT INTO auditoria VALUES (1581, 'carlos', '2011-11-09 07:44:10.167872', 17);
INSERT INTO auditoria VALUES (1582, 'carlos', '2011-11-09 07:45:13.382176', 9);
INSERT INTO auditoria VALUES (1583, 'carlos', '2011-11-09 07:48:30.82286', 9);
INSERT INTO auditoria VALUES (1584, 'carlos', '2011-11-09 07:51:35.705103', 9);
INSERT INTO auditoria VALUES (1585, 'carlos', '2011-11-09 07:53:53.656675', 9);
INSERT INTO auditoria VALUES (1586, 'carlos', '2011-11-09 07:56:59.709614', 9);
INSERT INTO auditoria VALUES (1587, 'carlos', '2011-11-09 07:58:44.693251', 9);
INSERT INTO auditoria VALUES (1588, 'carlos', '2011-11-09 07:59:54.567572', 17);
INSERT INTO auditoria VALUES (1589, 'carlos', '2011-11-09 07:59:59.714778', 9);
INSERT INTO auditoria VALUES (1590, 'prueba', '2011-11-09 08:02:40.814496', 9);
INSERT INTO auditoria VALUES (1591, 'carlos', '2011-11-09 08:04:35.568697', 17);
INSERT INTO auditoria VALUES (1592, 'carlos', '2011-11-09 08:04:46.040702', 40);
INSERT INTO auditoria VALUES (1593, 'carlos', '2011-11-09 08:06:30.004841', 9);
INSERT INTO auditoria VALUES (1594, 'prueba', '2011-11-09 08:12:21.736521', 9);
INSERT INTO auditoria VALUES (1595, 'prueba', '2011-11-09 08:14:59.663604', 9);
INSERT INTO auditoria VALUES (1596, 'prueba', '2011-11-09 08:16:20.427242', 9);
INSERT INTO auditoria VALUES (1597, 'prueba', '2011-11-09 08:17:50.023645', 9);
INSERT INTO auditoria VALUES (1598, 'prueba', '2011-11-09 08:20:05.026236', 9);
INSERT INTO auditoria VALUES (1599, 'prueba', '2011-11-09 08:21:24.973022', 9);
INSERT INTO auditoria VALUES (1600, 'prueba', '2011-11-09 08:21:30.984444', 17);
INSERT INTO auditoria VALUES (1601, 'prueba', '2011-11-09 08:23:48.076016', 17);
INSERT INTO auditoria VALUES (1602, 'prueba', '2011-11-09 08:29:31.550929', 17);
INSERT INTO auditoria VALUES (1603, 'carlos', '2011-11-09 08:34:18.343655', 9);
INSERT INTO auditoria VALUES (1604, 'carlos', '2011-11-09 08:34:22.92564', 17);
INSERT INTO auditoria VALUES (1605, 'carlos', '2011-11-09 08:40:38.892189', 9);
INSERT INTO auditoria VALUES (1606, 'carlos', '2011-11-09 08:42:28.062627', 9);
INSERT INTO auditoria VALUES (1607, 'carlos', '2011-11-09 08:42:30.79491', 17);
INSERT INTO auditoria VALUES (1608, 'carlos', '2011-11-09 08:42:45.826238', 9);
INSERT INTO auditoria VALUES (1609, 'prueba', '2011-11-09 09:01:13.666725', 9);
INSERT INTO auditoria VALUES (1610, 'carlos', '2011-11-09 09:17:58.039849', 9);
INSERT INTO auditoria VALUES (1611, 'carlos', '2011-11-09 09:22:09.212336', 9);
INSERT INTO auditoria VALUES (1612, 'carlos', '2011-11-09 09:23:21.735626', 9);
INSERT INTO auditoria VALUES (1613, 'prueba', '2011-11-09 09:23:49.02613', 9);
INSERT INTO auditoria VALUES (1614, 'carlos', '2011-11-09 09:24:22.633919', 9);
INSERT INTO auditoria VALUES (1615, 'prueba', '2011-11-09 09:25:05.527552', 9);
INSERT INTO auditoria VALUES (1616, 'carlos', '2011-11-09 09:28:22.560778', 9);
INSERT INTO auditoria VALUES (1617, 'prueba', '2011-11-09 09:28:42.987865', 9);
INSERT INTO auditoria VALUES (1618, 'carlos', '2011-11-09 09:29:23.694452', 9);
INSERT INTO auditoria VALUES (1619, 'carlos', '2011-11-09 09:29:26.246501', 17);
INSERT INTO auditoria VALUES (1620, 'prueba', '2011-11-09 09:30:02.096353', 9);
INSERT INTO auditoria VALUES (1621, 'prueba', '2011-11-09 09:30:44.845945', 9);
INSERT INTO auditoria VALUES (1622, 'prueba', '2011-11-09 09:33:17.916676', 9);
INSERT INTO auditoria VALUES (1623, 'prueba', '2011-11-09 09:33:25.134364', 17);
INSERT INTO auditoria VALUES (1624, 'carlos', '2011-11-09 09:35:56.154441', 0);
INSERT INTO auditoria VALUES (1625, 'carlos', '2011-11-09 09:36:02.356527', 40);
INSERT INTO auditoria VALUES (1626, 'carlos', '2011-11-09 09:36:44.315514', 17);
INSERT INTO auditoria VALUES (1627, 'carlos', '2011-11-09 09:37:01.642702', 40);
INSERT INTO auditoria VALUES (1628, 'carlos', '2011-11-09 09:37:43.484099', 17);
INSERT INTO auditoria VALUES (1629, 'prueba', '2011-11-09 09:39:05.153714', 9);
INSERT INTO auditoria VALUES (1630, 'prueba', '2011-11-09 09:43:26.286507', 9);
INSERT INTO auditoria VALUES (1631, 'prueba', '2011-11-09 09:43:42.578289', 17);
INSERT INTO auditoria VALUES (1632, 'prueba', '2011-11-09 11:07:54.854214', 0);
INSERT INTO auditoria VALUES (1633, 'prueba', '2011-11-09 11:07:59.524064', 9);
INSERT INTO auditoria VALUES (1634, 'carlos', '2011-11-09 11:08:12.935771', 0);
INSERT INTO auditoria VALUES (1635, 'carlos', '2011-11-09 11:09:00.594813', 17);
INSERT INTO auditoria VALUES (1636, 'carlos', '2011-11-09 11:11:07.184946', 9);
INSERT INTO auditoria VALUES (1637, 'robetorr', '2011-11-09 11:11:40.230384', 0);
INSERT INTO auditoria VALUES (1638, 'robetorr', '2011-11-09 11:11:45.590636', 11);
INSERT INTO auditoria VALUES (1639, 'robetorr', '2011-11-09 11:16:02.333304', 11);
INSERT INTO auditoria VALUES (1640, 'robetorr', '2011-11-09 11:16:33.663311', 11);
INSERT INTO auditoria VALUES (1641, 'robetorr', '2011-11-09 11:16:58.00925', 11);
INSERT INTO auditoria VALUES (1642, 'pasante1', '2011-11-09 11:17:22.89383', 0);
INSERT INTO auditoria VALUES (1643, 'robetorr', '2011-11-09 11:17:56.954878', 0);
INSERT INTO auditoria VALUES (1644, 'robetorr', '2011-11-09 11:18:00.505223', 11);
INSERT INTO auditoria VALUES (1645, 'robetorr', '2011-11-09 11:18:33.299314', 11);
INSERT INTO auditoria VALUES (1646, 'jorman', '2011-11-09 11:21:09.9626', 0);
INSERT INTO auditoria VALUES (1647, 'prueba', '2011-11-09 11:39:53.897433', 9);
INSERT INTO auditoria VALUES (1648, 'prueba', '2011-11-09 11:44:39.340847', 9);
INSERT INTO auditoria VALUES (1649, 'prueba', '2011-11-09 11:49:33.997378', 9);
INSERT INTO auditoria VALUES (1650, 'prueba', '2011-11-09 11:51:15.42321', 9);
INSERT INTO auditoria VALUES (1651, 'prueba', '2011-11-09 11:54:08.339811', 9);
INSERT INTO auditoria VALUES (1652, 'prueba', '2011-11-09 11:55:14.405779', 9);
INSERT INTO auditoria VALUES (1653, 'prueba', '2011-11-09 11:55:17.004023', 17);
INSERT INTO auditoria VALUES (1654, 'prueba', '2011-11-09 11:57:49.804988', 9);
INSERT INTO auditoria VALUES (1655, 'carlos', '2011-11-09 11:58:26.790867', 9);
INSERT INTO auditoria VALUES (1656, 'carlos', '2011-11-09 12:00:11.319782', 40);
INSERT INTO auditoria VALUES (1657, 'pasante1', '2011-11-09 12:02:39.79226', 0);
INSERT INTO auditoria VALUES (1658, 'pasante1', '2011-11-09 12:02:52.768512', 9);
INSERT INTO auditoria VALUES (1659, 'pasante1', '2011-11-09 12:03:35.368919', 9);
INSERT INTO auditoria VALUES (1660, 'pasante1', '2011-11-09 12:04:13.880087', 17);
INSERT INTO auditoria VALUES (1661, 'pasante1', '2011-11-09 12:07:19.627787', 17);
INSERT INTO auditoria VALUES (1662, 'carlos', '2011-11-09 12:08:36.263728', 0);
INSERT INTO auditoria VALUES (1663, 'carlos', '2011-11-09 12:08:54.543215', 40);
INSERT INTO auditoria VALUES (1664, 'carlos', '2011-11-09 12:09:12.406246', 9);
INSERT INTO auditoria VALUES (1665, 'carlos', '2011-11-09 12:12:11.368673', 9);
INSERT INTO auditoria VALUES (1666, 'carlos', '2011-11-09 12:14:09.2927', 9);
INSERT INTO auditoria VALUES (1667, 'carlos', '2011-11-09 12:17:00.454329', 9);
INSERT INTO auditoria VALUES (1668, 'carlos', '2011-11-09 12:18:32.709448', 9);
INSERT INTO auditoria VALUES (1669, 'carlos', '2011-11-09 12:20:11.411274', 9);
INSERT INTO auditoria VALUES (1670, 'carlos', '2011-11-09 12:20:12.430976', 9);
INSERT INTO auditoria VALUES (1671, 'carlos', '2011-11-09 12:20:16.625214', 9);
INSERT INTO auditoria VALUES (1672, 'carlos', '2011-11-09 12:20:17.678468', 17);
INSERT INTO auditoria VALUES (1673, 'carlos', '2011-11-09 12:20:20.326404', 17);
INSERT INTO auditoria VALUES (1674, 'carlos', '2011-11-09 12:27:55.5182', 17);
INSERT INTO auditoria VALUES (1675, 'carlos', '2011-11-09 12:28:59.353713', 17);
INSERT INTO auditoria VALUES (1676, 'carlos', '2011-11-09 12:29:23.559412', 40);
INSERT INTO auditoria VALUES (1677, 'prueba', '2011-11-09 12:30:01.223398', 9);
INSERT INTO auditoria VALUES (1678, 'carlos', '2011-11-09 12:30:15.222829', 40);
INSERT INTO auditoria VALUES (1679, 'carlos', '2011-11-09 12:30:28.774393', 40);
INSERT INTO auditoria VALUES (1680, 'carlos', '2011-11-09 12:30:47.193031', 40);
INSERT INTO auditoria VALUES (1681, 'carlos', '2011-11-09 12:31:05.151819', 40);
INSERT INTO auditoria VALUES (1682, 'carlos', '2011-11-09 12:31:25.461477', 40);
INSERT INTO auditoria VALUES (1683, 'carlos', '2011-11-09 12:31:42.676394', 9);
INSERT INTO auditoria VALUES (1684, 'prueba', '2011-11-09 12:32:10.831575', 9);
INSERT INTO auditoria VALUES (1685, 'robetorr', '2011-11-09 12:32:56.239924', 0);
INSERT INTO auditoria VALUES (1686, 'robetorr', '2011-11-09 12:33:04.479175', 11);
INSERT INTO auditoria VALUES (1687, 'robetorr', '2011-11-09 12:34:57.359693', 0);
INSERT INTO auditoria VALUES (1688, 'robetorr', '2011-11-09 12:35:02.978584', 11);
INSERT INTO auditoria VALUES (1689, 'prueba', '2011-11-09 12:35:44.066453', 9);
INSERT INTO auditoria VALUES (1690, 'robetorr', '2011-11-09 12:36:45.120596', 0);
INSERT INTO auditoria VALUES (1691, 'robetorr', '2011-11-09 12:36:50.05091', 11);
INSERT INTO auditoria VALUES (1692, 'prueba', '2011-11-09 12:37:41.967254', 9);
INSERT INTO auditoria VALUES (1693, 'prueba', '2011-11-09 12:38:49.198482', 9);
INSERT INTO auditoria VALUES (1694, 'prueba', '2011-11-09 12:39:37.116392', 9);
INSERT INTO auditoria VALUES (1695, 'prueba', '2011-11-09 12:39:42.69305', 17);
INSERT INTO auditoria VALUES (1696, 'carlos', '2011-11-09 12:49:40.664711', 9);
INSERT INTO auditoria VALUES (1697, 'carlos', '2011-11-09 12:49:43.850943', 17);
INSERT INTO auditoria VALUES (1698, 'carlos', '2011-11-09 12:50:05.610245', 17);
INSERT INTO auditoria VALUES (1699, 'carlos', '2011-11-09 12:50:37.26715', 40);
INSERT INTO auditoria VALUES (1700, 'carlos', '2011-11-10 05:46:19.733783', 0);
INSERT INTO auditoria VALUES (1701, 'carlos', '2011-11-10 05:47:39.827773', 17);
INSERT INTO auditoria VALUES (1702, 'carlos', '2011-11-10 05:49:06.959053', 40);
INSERT INTO auditoria VALUES (1703, 'carlos', '2011-11-10 05:49:39.329449', 40);
INSERT INTO auditoria VALUES (1704, 'carlos', '2011-11-10 05:49:51.902034', 40);
INSERT INTO auditoria VALUES (1705, 'carlos', '2011-11-10 05:50:26.463872', 40);
INSERT INTO auditoria VALUES (1706, 'pasante1', '2011-11-10 05:52:24.678121', 0);
INSERT INTO auditoria VALUES (1707, 'carlos', '2011-11-10 05:53:10.645778', 40);
INSERT INTO auditoria VALUES (1708, 'carlos', '2011-11-10 05:57:15.803466', 40);
INSERT INTO auditoria VALUES (1709, 'carlos', '2011-11-10 05:58:06.417796', 40);
INSERT INTO auditoria VALUES (1710, 'carlos', '2011-11-10 05:58:21.294591', 40);
INSERT INTO auditoria VALUES (1711, 'carlos', '2011-11-10 05:58:30.039199', 17);
INSERT INTO auditoria VALUES (1712, 'pasante2', '2011-11-10 05:59:34.998119', 0);
INSERT INTO auditoria VALUES (1713, 'pasante2', '2011-11-10 06:00:00.108962', 9);
INSERT INTO auditoria VALUES (1714, 'carlos', '2011-11-10 06:02:29.48203', 17);
INSERT INTO auditoria VALUES (1715, 'carlos', '2011-11-10 06:04:24.159675', 9);
INSERT INTO auditoria VALUES (1716, 'carlos', '2011-11-10 06:06:20.247722', 9);
INSERT INTO auditoria VALUES (1717, 'carlos', '2011-11-10 06:09:00.076457', 9);
INSERT INTO auditoria VALUES (1718, 'carlos', '2011-11-10 06:10:09.6369', 9);
INSERT INTO auditoria VALUES (1719, 'carlos', '2011-11-10 06:10:49.54833', 9);
INSERT INTO auditoria VALUES (1720, 'carlos', '2011-11-10 06:11:48.25295', 9);
INSERT INTO auditoria VALUES (1721, 'carlos', '2011-11-10 06:11:51.538861', 17);
INSERT INTO auditoria VALUES (1722, 'carlos', '2011-11-10 06:15:19.006248', 40);
INSERT INTO auditoria VALUES (1723, 'carlos', '2011-11-10 06:15:41.03838', 40);
INSERT INTO auditoria VALUES (1724, 'robetorr', '2011-11-10 06:18:44.912475', 0);
INSERT INTO auditoria VALUES (1725, 'robetorr', '2011-11-10 06:22:21.95526', 9);
INSERT INTO auditoria VALUES (1726, 'robetorr', '2011-11-10 06:23:05.449599', 11);
INSERT INTO auditoria VALUES (1727, 'robetorr', '2011-11-10 06:25:29.686667', 11);
INSERT INTO auditoria VALUES (1728, 'robetorr', '2011-11-10 06:27:30.185658', 0);
INSERT INTO auditoria VALUES (1729, 'robetorr', '2011-11-10 06:27:35.484469', 11);
INSERT INTO auditoria VALUES (1730, 'robetorr', '2011-11-10 06:28:31.091403', 0);
INSERT INTO auditoria VALUES (1731, 'robetorr', '2011-11-10 06:28:43.634879', 11);
INSERT INTO auditoria VALUES (1732, 'robetorr', '2011-11-10 06:29:56.435966', 0);
INSERT INTO auditoria VALUES (1733, 'robetorr', '2011-11-10 06:30:01.981553', 11);
INSERT INTO auditoria VALUES (1734, 'robetorr', '2011-11-10 06:37:11.774142', 0);
INSERT INTO auditoria VALUES (1735, 'robetorr', '2011-11-10 06:37:30.705091', 11);
INSERT INTO auditoria VALUES (1736, 'robetorr', '2011-11-10 06:40:41.88654', 0);
INSERT INTO auditoria VALUES (1737, 'robetorr', '2011-11-10 06:40:52.094447', 11);
INSERT INTO auditoria VALUES (1738, 'robetorr', '2011-11-10 06:48:45.611647', 0);
INSERT INTO auditoria VALUES (1739, 'robetorr', '2011-11-10 06:48:50.566991', 11);
INSERT INTO auditoria VALUES (1740, 'robetorr', '2011-11-10 06:49:39.448304', 0);
INSERT INTO auditoria VALUES (1741, 'robetorr', '2011-11-10 06:49:44.555281', 11);
INSERT INTO auditoria VALUES (1742, 'robetorr', '2011-11-10 06:51:36.247777', 0);
INSERT INTO auditoria VALUES (1743, 'robetorr', '2011-11-10 06:51:49.988277', 11);
INSERT INTO auditoria VALUES (1744, 'robetorr', '2011-11-10 06:54:07.432831', 0);
INSERT INTO auditoria VALUES (1745, 'robetorr', '2011-11-10 06:54:11.788686', 11);
INSERT INTO auditoria VALUES (1746, 'robetorr', '2011-11-10 06:55:42.541031', 0);
INSERT INTO auditoria VALUES (1747, 'robetorr', '2011-11-10 06:55:46.957594', 11);
INSERT INTO auditoria VALUES (1748, 'robetorr', '2011-11-10 06:58:09.385329', 0);
INSERT INTO auditoria VALUES (1749, 'robetorr', '2011-11-10 06:58:15.394846', 11);
INSERT INTO auditoria VALUES (1750, 'robetorr', '2011-11-10 06:59:52.12663', 0);
INSERT INTO auditoria VALUES (1751, 'robetorr', '2011-11-10 07:00:02.801384', 11);
INSERT INTO auditoria VALUES (1752, 'robetorr', '2011-11-10 07:04:26.315398', 0);
INSERT INTO auditoria VALUES (1753, 'carlos', '2011-11-10 07:09:19.438508', 0);
INSERT INTO auditoria VALUES (1754, 'pasante1', '2011-11-10 07:09:19.452834', 0);
INSERT INTO auditoria VALUES (1755, 'carlos', '2011-11-10 07:09:32.108479', 0);
INSERT INTO auditoria VALUES (1756, 'pasante1', '2011-11-10 07:09:33.813982', 0);
INSERT INTO auditoria VALUES (1757, 'pasante1', '2011-11-10 07:09:41.595207', 9);
INSERT INTO auditoria VALUES (1758, 'carlos', '2011-11-10 07:10:16.491995', 40);
INSERT INTO auditoria VALUES (1759, 'carlos', '2011-11-10 07:10:59.46163', 17);
INSERT INTO auditoria VALUES (1760, 'carlos', '2011-11-10 07:11:31.952567', 9);
INSERT INTO auditoria VALUES (1761, 'pasante1', '2011-11-10 07:20:35.847601', 9);
INSERT INTO auditoria VALUES (1762, 'pasante1', '2011-11-10 07:22:31.435752', 9);
INSERT INTO auditoria VALUES (1763, 'pasante1', '2011-11-10 07:23:57.18494', 9);
INSERT INTO auditoria VALUES (1764, 'carlos', '2011-11-10 07:24:16.175585', 9);
INSERT INTO auditoria VALUES (1765, 'pasante1', '2011-11-10 07:24:48.986176', 9);
INSERT INTO auditoria VALUES (1766, 'carlos', '2011-11-10 07:25:54.913205', 9);
INSERT INTO auditoria VALUES (1767, 'pasante1', '2011-11-10 07:26:19.294656', 9);
INSERT INTO auditoria VALUES (1768, 'pasante1', '2011-11-10 07:27:52.13221', 9);
INSERT INTO auditoria VALUES (1769, 'pasante1', '2011-11-10 07:27:58.718539', 17);
INSERT INTO auditoria VALUES (1770, 'carlos', '2011-11-10 07:28:35.358135', 9);
INSERT INTO auditoria VALUES (1771, 'carlos', '2011-11-10 07:30:35.124461', 9);
INSERT INTO auditoria VALUES (1772, 'carlos', '2011-11-10 07:31:18.998334', 9);
INSERT INTO auditoria VALUES (1773, 'carlos', '2011-11-10 07:32:11.252767', 9);
INSERT INTO auditoria VALUES (1774, 'carlos', '2011-11-10 07:32:15.338978', 17);
INSERT INTO auditoria VALUES (1775, 'carlos', '2011-11-10 07:32:38.394274', 40);
INSERT INTO auditoria VALUES (1776, 'carlos', '2011-11-10 07:32:57.113145', 40);
INSERT INTO auditoria VALUES (1777, 'carlos', '2011-11-10 07:33:13.506927', 40);
INSERT INTO auditoria VALUES (1778, 'carlos', '2011-11-10 07:33:36.172944', 40);
INSERT INTO auditoria VALUES (1779, 'carlos', '2011-11-10 07:33:49.30309', 40);
INSERT INTO auditoria VALUES (1780, 'carlos', '2011-11-10 07:33:59.859012', 40);
INSERT INTO auditoria VALUES (1781, 'carlos', '2011-11-10 07:38:30.514357', 40);
INSERT INTO auditoria VALUES (1782, 'carlos', '2011-11-10 07:40:05.406631', 40);
INSERT INTO auditoria VALUES (1783, 'carlos', '2011-11-10 07:40:15.628628', 40);
INSERT INTO auditoria VALUES (1784, 'pasante1', '2011-11-10 07:40:21.635187', 9);
INSERT INTO auditoria VALUES (1785, 'carlos', '2011-11-10 07:40:28.921116', 17);
INSERT INTO auditoria VALUES (1786, 'carlos', '2011-11-10 07:46:30.161626', 9);
INSERT INTO auditoria VALUES (1787, 'pasante1', '2011-11-10 07:48:10.657067', 9);
INSERT INTO auditoria VALUES (1788, 'pasante1', '2011-11-10 07:48:13.309518', 17);
INSERT INTO auditoria VALUES (1789, 'pasante1', '2011-11-10 07:48:50.190376', 9);
INSERT INTO auditoria VALUES (1790, 'carlos', '2011-11-10 07:50:45.304984', 0);
INSERT INTO auditoria VALUES (1791, 'carlos', '2011-11-10 07:50:53.993354', 11);
INSERT INTO auditoria VALUES (1792, 'carlos', '2011-11-10 07:52:11.77997', 40);
INSERT INTO auditoria VALUES (1793, 'carlos', '2011-11-10 07:52:52.911537', 11);
INSERT INTO auditoria VALUES (1794, 'carlos', '2011-11-10 08:11:15.644521', 9);
INSERT INTO auditoria VALUES (1795, 'carlos', '2011-11-10 08:14:15.822616', 9);
INSERT INTO auditoria VALUES (1796, 'carlos', '2011-11-10 08:15:14.884896', 9);
INSERT INTO auditoria VALUES (1797, 'carlos', '2011-11-10 08:16:15.824125', 9);
INSERT INTO auditoria VALUES (1798, 'carlos', '2011-11-10 08:17:27.610267', 9);
INSERT INTO auditoria VALUES (1799, 'carlos', '2011-11-10 08:18:21.645564', 17);
INSERT INTO auditoria VALUES (1800, 'carlos', '2011-11-11 06:18:49.265406', 0);
INSERT INTO auditoria VALUES (1801, 'carlos', '2011-11-11 06:19:04.867282', 23);
INSERT INTO auditoria VALUES (1802, 'carlos', '2011-11-11 06:19:28.891806', 11);
INSERT INTO auditoria VALUES (1803, 'carlos', '2011-11-11 06:20:01.958224', 11);
INSERT INTO auditoria VALUES (1804, 'richard', '2011-11-11 06:20:12.957573', 0);
INSERT INTO auditoria VALUES (1805, 'richard', '2011-11-11 06:20:34.438596', 3);
INSERT INTO auditoria VALUES (1806, 'richard', '2011-11-11 06:20:56.089656', 9);
INSERT INTO auditoria VALUES (1807, 'richard', '2011-11-11 06:21:05.558512', 16);
INSERT INTO auditoria VALUES (1808, 'richard', '2011-11-11 06:21:17.291656', 18);
INSERT INTO auditoria VALUES (1809, 'richard', '2011-11-11 06:21:27.583198', 32);
INSERT INTO auditoria VALUES (1810, 'richard', '2011-11-11 06:21:46.813015', 41);
INSERT INTO auditoria VALUES (1811, 'richard', '2011-11-11 06:21:59.143649', 5);
INSERT INTO auditoria VALUES (1812, 'pasante1', '2011-11-11 06:22:18.516017', 0);
INSERT INTO auditoria VALUES (1813, 'pasante1', '2011-11-11 06:22:30.824207', 9);
INSERT INTO auditoria VALUES (1814, 'richard', '2011-11-11 06:22:34.996687', 3);
INSERT INTO auditoria VALUES (1815, 'richard', '2011-11-11 06:22:53.894327', 0);
INSERT INTO auditoria VALUES (1816, 'carlos', '2011-11-11 08:09:38.875089', 0);
INSERT INTO auditoria VALUES (1817, 'carlos', '2011-11-11 08:09:48.605078', 9);
INSERT INTO auditoria VALUES (1818, 'carlos', '2011-11-11 08:10:05.452283', 17);
INSERT INTO auditoria VALUES (1819, 'carlos', '2011-11-11 08:10:28.981004', 40);
INSERT INTO auditoria VALUES (1820, 'carlos', '2011-11-11 08:10:41.100337', 40);
INSERT INTO auditoria VALUES (1821, 'carlos', '2011-11-11 08:11:04.86723', 40);
INSERT INTO auditoria VALUES (1822, 'carlos', '2011-11-11 08:11:21.277952', 9);
INSERT INTO auditoria VALUES (1823, 'carlos', '2011-11-11 08:41:18.830933', 9);
INSERT INTO auditoria VALUES (1824, 'carlos', '2011-11-11 08:43:47.683646', 9);
INSERT INTO auditoria VALUES (1825, 'carlos', '2011-11-11 08:45:01.500891', 9);
INSERT INTO auditoria VALUES (1826, 'pasante1', '2011-11-11 08:46:23.236578', 0);
INSERT INTO auditoria VALUES (1827, 'carlos', '2011-11-11 08:46:23.318973', 9);
INSERT INTO auditoria VALUES (1828, 'carlos', '2011-11-11 08:48:18.652744', 9);
INSERT INTO auditoria VALUES (1829, 'carlos', '2011-11-11 08:49:16.204898', 9);
INSERT INTO auditoria VALUES (1830, 'carlos', '2011-11-11 08:49:19.286332', 17);
INSERT INTO auditoria VALUES (1831, 'carlos', '2011-11-11 08:49:35.563888', 9);
INSERT INTO auditoria VALUES (1832, 'carlos', '2011-11-11 09:10:48.335788', 9);
INSERT INTO auditoria VALUES (1833, 'carlos', '2011-11-11 09:13:18.491933', 9);
INSERT INTO auditoria VALUES (1834, 'carlos', '2011-11-11 09:15:01.36496', 9);
INSERT INTO auditoria VALUES (1835, 'carlos', '2011-11-11 09:16:17.586073', 9);
INSERT INTO auditoria VALUES (1836, 'carlos', '2011-11-11 09:17:45.718103', 9);
INSERT INTO auditoria VALUES (1837, 'carlos', '2011-11-11 09:19:04.327967', 9);
INSERT INTO auditoria VALUES (1838, 'carlos', '2011-11-11 09:19:08.465046', 17);
INSERT INTO auditoria VALUES (1839, 'carlos', '2011-11-11 09:20:08.044159', 17);
INSERT INTO auditoria VALUES (1840, 'carlos', '2011-11-11 09:20:44.01859', 40);
INSERT INTO auditoria VALUES (1841, 'carlos', '2011-11-11 09:21:40.095051', 40);
INSERT INTO auditoria VALUES (1842, 'carlos', '2011-11-11 09:27:04.878972', 17);
INSERT INTO auditoria VALUES (1843, 'carlos', '2011-11-11 09:28:30.182152', 9);
INSERT INTO auditoria VALUES (1844, 'carlos', '2011-11-11 09:29:17.754145', 9);
INSERT INTO auditoria VALUES (1845, 'carlos', '2011-11-11 09:29:19.73905', 17);
INSERT INTO auditoria VALUES (1846, 'carlos', '2011-11-14 06:04:16.365724', 0);
INSERT INTO auditoria VALUES (1847, 'carlos', '2011-11-14 06:10:51.943118', 0);
INSERT INTO auditoria VALUES (1848, 'carlos', '2011-11-14 06:11:09.513817', 9);
INSERT INTO auditoria VALUES (1849, 'carlos', '2011-11-14 06:16:19.177847', 17);
INSERT INTO auditoria VALUES (1850, 'carlos', '2011-11-14 06:18:18.766439', 40);
INSERT INTO auditoria VALUES (1851, 'carlos', '2011-11-14 06:18:38.000892', 40);
INSERT INTO auditoria VALUES (1852, 'carlos', '2011-11-14 06:18:59.174681', 40);
INSERT INTO auditoria VALUES (1853, 'carlos', '2011-11-14 06:19:09.725274', 9);
INSERT INTO auditoria VALUES (1854, 'carlos', '2011-11-14 06:32:39.650811', 9);
INSERT INTO auditoria VALUES (1855, 'pasante1', '2011-11-14 06:33:49.516243', 0);
INSERT INTO auditoria VALUES (1856, 'pasante1', '2011-11-14 06:33:57.369344', 9);
INSERT INTO auditoria VALUES (1857, 'pasante2', '2011-11-14 06:33:58.174919', 0);
INSERT INTO auditoria VALUES (1858, 'pasante2', '2011-11-14 06:34:21.138796', 3);
INSERT INTO auditoria VALUES (1859, 'pasante2', '2011-11-14 06:34:27.913422', 9);
INSERT INTO auditoria VALUES (1860, 'pasante2', '2011-11-14 06:34:30.945321', 3);
INSERT INTO auditoria VALUES (1861, 'pasante2', '2011-11-14 06:34:44.646627', 9);
INSERT INTO auditoria VALUES (1862, 'carlos', '2011-11-14 06:37:36.108517', 9);
INSERT INTO auditoria VALUES (1863, 'carlos', '2011-11-14 06:39:39.815963', 9);
INSERT INTO auditoria VALUES (1864, 'carlos', '2011-11-14 06:41:35.883945', 9);
INSERT INTO auditoria VALUES (1865, 'carlos', '2011-11-14 06:42:11.510567', 9);
INSERT INTO auditoria VALUES (1866, 'carlos', '2011-11-14 06:43:33.351623', 9);
INSERT INTO auditoria VALUES (1867, 'carlos', '2011-11-14 06:43:35.677818', 17);
INSERT INTO auditoria VALUES (1868, 'carlos', '2011-11-14 06:43:58.241947', 9);
INSERT INTO auditoria VALUES (1869, 'carlos', '2011-11-14 07:02:00.211937', 9);
INSERT INTO auditoria VALUES (1870, 'pasante2', '2011-11-14 07:02:37.19203', 9);
INSERT INTO auditoria VALUES (1871, 'carlos', '2011-11-14 07:03:39.473967', 9);
INSERT INTO auditoria VALUES (1872, 'pasante1', '2011-11-14 07:03:49.188611', 9);
INSERT INTO auditoria VALUES (1873, 'carlos', '2011-11-14 07:04:34.268627', 9);
INSERT INTO auditoria VALUES (1874, 'pasante2', '2011-11-14 07:04:44.63912', 9);
INSERT INTO auditoria VALUES (1875, 'pasante1', '2011-11-14 07:05:00.922703', 9);
INSERT INTO auditoria VALUES (1876, 'carlos', '2011-11-14 07:05:30.464367', 9);
INSERT INTO auditoria VALUES (1877, 'pasante1', '2011-11-14 07:06:04.27676', 9);
INSERT INTO auditoria VALUES (1878, 'pasante2', '2011-11-14 07:06:39.449028', 9);
INSERT INTO auditoria VALUES (1879, 'carlos', '2011-11-14 07:06:44.503579', 9);
INSERT INTO auditoria VALUES (1880, 'pasante1', '2011-11-14 07:06:53.739165', 9);
INSERT INTO auditoria VALUES (1881, 'carlos', '2011-11-14 07:07:28.133653', 9);
INSERT INTO auditoria VALUES (1882, 'carlos', '2011-11-14 07:07:31.569397', 17);
INSERT INTO auditoria VALUES (1883, 'carlos', '2011-11-14 07:08:00.400758', 9);
INSERT INTO auditoria VALUES (1884, 'pasante2', '2011-11-14 07:09:54.028832', 9);
INSERT INTO auditoria VALUES (1885, 'pasante1', '2011-11-14 07:10:09.570336', 9);
INSERT INTO auditoria VALUES (1886, 'pasante1', '2011-11-14 07:11:54.293908', 9);
INSERT INTO auditoria VALUES (1887, 'pasante1', '2011-11-14 07:11:57.80239', 17);
INSERT INTO auditoria VALUES (1888, 'pasante1', '2011-11-14 07:12:04.7817', 9);
INSERT INTO auditoria VALUES (1889, 'pasante2', '2011-11-14 07:12:24.513921', 9);
INSERT INTO auditoria VALUES (1890, 'pasante2', '2011-11-14 07:14:14.221732', 9);
INSERT INTO auditoria VALUES (1891, 'pasante2', '2011-11-14 07:14:19.281222', 17);
INSERT INTO auditoria VALUES (1892, 'carlos', '2011-11-14 07:29:40.837673', 9);
INSERT INTO auditoria VALUES (1893, 'carlos', '2011-11-14 07:29:50.010506', 17);
INSERT INTO auditoria VALUES (1894, 'carlos', '2011-11-14 07:30:40.396221', 40);
INSERT INTO auditoria VALUES (1895, 'carlos', '2011-11-14 07:30:56.330807', 40);
INSERT INTO auditoria VALUES (1896, 'carlos', '2011-11-14 07:31:05.993888', 40);
INSERT INTO auditoria VALUES (1897, 'carlos', '2011-11-14 07:31:16.43859', 40);
INSERT INTO auditoria VALUES (1898, 'carlos', '2011-11-14 07:31:30.411626', 40);
INSERT INTO auditoria VALUES (1899, 'carlos', '2011-11-14 07:32:49.286404', 17);
INSERT INTO auditoria VALUES (1900, 'pasante2', '2011-11-14 07:33:13.178231', 9);
INSERT INTO auditoria VALUES (1901, 'carlos', '2011-11-14 07:33:51.88078', 9);
INSERT INTO auditoria VALUES (1902, 'carlos', '2011-11-14 07:38:02.07078', 9);
INSERT INTO auditoria VALUES (1903, 'carlos', '2011-11-14 07:38:13.11711', 40);
INSERT INTO auditoria VALUES (1904, 'carlos', '2011-11-14 07:38:34.944591', 9);
INSERT INTO auditoria VALUES (1905, 'carlos', '2011-11-14 07:40:05.902124', 9);
INSERT INTO auditoria VALUES (1906, 'carlos', '2011-11-14 07:40:09.384765', 40);
INSERT INTO auditoria VALUES (1907, 'carlos', '2011-11-14 07:40:24.337314', 9);
INSERT INTO auditoria VALUES (1908, 'carlos', '2011-11-14 07:41:21.762228', 9);
INSERT INTO auditoria VALUES (1909, 'carlos', '2011-11-14 07:41:25.255749', 9);
INSERT INTO auditoria VALUES (1910, 'carlos', '2011-11-14 07:42:06.330732', 9);
INSERT INTO auditoria VALUES (1911, 'carlos', '2011-11-14 07:43:01.624568', 9);
INSERT INTO auditoria VALUES (1912, 'carlos', '2011-11-14 07:43:04.401827', 17);
INSERT INTO auditoria VALUES (1913, 'carlos', '2011-11-14 07:44:53.707623', 17);
INSERT INTO auditoria VALUES (1914, 'pasante2', '2011-11-14 07:48:38.303579', 9);
INSERT INTO auditoria VALUES (1915, 'pasante2', '2011-11-14 07:50:23.454391', 9);
INSERT INTO auditoria VALUES (1916, 'pasante2', '2011-11-14 07:51:41.096862', 9);
INSERT INTO auditoria VALUES (1917, 'pasante1', '2011-11-14 07:52:03.237225', 9);
INSERT INTO auditoria VALUES (1918, 'pasante2', '2011-11-14 07:52:37.333676', 9);
INSERT INTO auditoria VALUES (1919, 'pasante1', '2011-11-14 07:54:10.060858', 9);
INSERT INTO auditoria VALUES (1920, 'pasante2', '2011-11-14 07:54:10.116799', 9);
INSERT INTO auditoria VALUES (1921, 'pasante2', '2011-11-14 07:54:49.407636', 9);
INSERT INTO auditoria VALUES (1922, 'pasante2', '2011-11-14 07:54:56.758127', 17);
INSERT INTO auditoria VALUES (1923, 'pasante1', '2011-11-14 07:55:13.039256', 9);
INSERT INTO auditoria VALUES (1924, 'pasante1', '2011-11-14 07:56:02.110759', 9);
INSERT INTO auditoria VALUES (1925, 'pasante1', '2011-11-14 07:57:04.21261', 9);
INSERT INTO auditoria VALUES (1926, 'pasante1', '2011-11-14 07:58:27.025513', 9);
INSERT INTO auditoria VALUES (1927, 'pasante1', '2011-11-14 07:58:33.473417', 17);
INSERT INTO auditoria VALUES (1928, 'carlos', '2011-11-14 10:39:43.423463', 0);
INSERT INTO auditoria VALUES (1929, 'carlos', '2011-11-14 10:40:16.911738', 9);
INSERT INTO auditoria VALUES (1930, 'carlos', '2011-11-14 10:54:16.160563', 9);
INSERT INTO auditoria VALUES (1931, 'carlos', '2011-11-14 10:54:37.007668', 40);
INSERT INTO auditoria VALUES (1932, 'carlos', '2011-11-14 10:55:48.234629', 9);
INSERT INTO auditoria VALUES (1933, 'carlos', '2011-11-14 10:57:57.292879', 9);
INSERT INTO auditoria VALUES (1934, 'carlos', '2011-11-14 11:00:22.459633', 9);
INSERT INTO auditoria VALUES (1935, 'carlos', '2011-11-14 11:01:27.617651', 9);
INSERT INTO auditoria VALUES (1936, 'carlos', '2011-11-14 11:04:28.412954', 9);
INSERT INTO auditoria VALUES (1937, 'carlos', '2011-11-14 11:05:54.111534', 9);
INSERT INTO auditoria VALUES (1938, 'carlos', '2011-11-14 11:05:59.983519', 17);
INSERT INTO auditoria VALUES (1939, 'carlos', '2011-11-14 11:07:00.457671', 9);
INSERT INTO auditoria VALUES (1940, 'carlos', '2011-11-14 11:25:04.912118', 9);
INSERT INTO auditoria VALUES (1941, 'carlos', '2011-11-14 11:26:59.861898', 9);
INSERT INTO auditoria VALUES (1942, 'carlos', '2011-11-14 11:28:05.905343', 9);
INSERT INTO auditoria VALUES (1943, 'carlos', '2011-11-14 11:29:06.051656', 9);
INSERT INTO auditoria VALUES (1944, 'carlos', '2011-11-14 11:30:48.340038', 9);
INSERT INTO auditoria VALUES (1945, 'carlos', '2011-11-14 11:33:26.120722', 9);
INSERT INTO auditoria VALUES (1946, 'carlos', '2011-11-14 11:33:30.480425', 17);
INSERT INTO auditoria VALUES (1947, 'carlos', '2011-11-14 11:34:13.287198', 9);
INSERT INTO auditoria VALUES (1948, 'carlos', '2011-11-14 11:54:03.334111', 17);
INSERT INTO auditoria VALUES (1949, 'carlos', '2011-11-14 12:01:21.016946', 16);
INSERT INTO auditoria VALUES (1950, 'carlos', '2011-11-14 12:01:29.613369', 16);
INSERT INTO auditoria VALUES (1951, 'carlos', '2011-11-14 12:01:34.574238', 9);
INSERT INTO auditoria VALUES (1952, 'carlos', '2011-11-14 12:17:53.629426', 9);
INSERT INTO auditoria VALUES (1953, 'carlos', '2011-11-14 12:19:45.36447', 9);
INSERT INTO auditoria VALUES (1954, 'carlos', '2011-11-14 12:21:07.084413', 9);
INSERT INTO auditoria VALUES (1955, 'carlos', '2011-11-14 12:23:53.325585', 9);
INSERT INTO auditoria VALUES (1956, 'carlos', '2011-11-14 12:25:33.613914', 9);
INSERT INTO auditoria VALUES (1957, 'carlos', '2011-11-14 12:27:01.218761', 9);
INSERT INTO auditoria VALUES (1958, 'carlos', '2011-11-14 12:27:17.029381', 17);
INSERT INTO auditoria VALUES (1959, 'pasante1', '2011-11-15 05:46:19.801362', 0);
INSERT INTO auditoria VALUES (1960, 'pasante1', '2011-11-15 05:46:26.156601', 17);
INSERT INTO auditoria VALUES (1961, 'pasante1', '2011-11-15 05:49:09.397014', 9);
INSERT INTO auditoria VALUES (1962, 'pasante1', '2011-11-15 05:50:45.90396', 0);
INSERT INTO auditoria VALUES (1963, 'pasante1', '2011-11-15 05:50:50.704785', 17);
INSERT INTO auditoria VALUES (1964, 'pasante1', '2011-11-15 05:58:03.972252', 21);
INSERT INTO auditoria VALUES (1965, 'pasante1', '2011-11-15 05:58:03.985868', 21);
INSERT INTO auditoria VALUES (1966, 'pasante1', '2011-11-15 06:09:04.731685', 9);
INSERT INTO auditoria VALUES (1967, 'pasante1', '2011-11-15 06:10:29.271289', 9);
INSERT INTO auditoria VALUES (1968, 'pasante1', '2011-11-15 06:11:37.403471', 9);
INSERT INTO auditoria VALUES (1969, 'pasante1', '2011-11-15 06:12:32.63705', 9);
INSERT INTO auditoria VALUES (1970, 'pasante1', '2011-11-15 06:14:37.237542', 9);
INSERT INTO auditoria VALUES (1971, 'pasante1', '2011-11-15 06:15:28.739589', 9);
INSERT INTO auditoria VALUES (1972, 'pasante1', '2011-11-15 06:15:33.46277', 17);
INSERT INTO auditoria VALUES (1973, 'carlos', '2011-11-17 05:50:02.09248', 0);
INSERT INTO auditoria VALUES (1974, 'carlos', '2011-11-17 05:50:16.290403', 9);
INSERT INTO auditoria VALUES (1975, 'carlos', '2011-11-17 06:22:28.597952', 9);
INSERT INTO auditoria VALUES (1976, 'carlos', '2011-11-17 06:23:47.669132', 9);
INSERT INTO auditoria VALUES (1977, 'carlos', '2011-11-17 06:26:32.594243', 9);
INSERT INTO auditoria VALUES (1978, 'carlos', '2011-11-17 06:28:25.034994', 9);
INSERT INTO auditoria VALUES (1979, 'carlos', '2011-11-17 06:28:53.075558', 40);
INSERT INTO auditoria VALUES (1980, 'carlos', '2011-11-17 06:30:43.192629', 9);
INSERT INTO auditoria VALUES (1981, 'carlos', '2011-11-17 06:32:11.087435', 9);
INSERT INTO auditoria VALUES (1982, 'carlos', '2011-11-17 06:34:35.084762', 9);
INSERT INTO auditoria VALUES (1983, 'carlos', '2011-11-17 06:34:40.888557', 17);
INSERT INTO auditoria VALUES (1984, 'carlos', '2011-11-17 06:42:38.730276', 40);
INSERT INTO auditoria VALUES (1985, 'carlos', '2011-11-17 06:44:28.162195', 0);
INSERT INTO auditoria VALUES (1986, 'carlos', '2011-11-17 06:45:08.85328', 9);
INSERT INTO auditoria VALUES (1987, 'carlos', '2011-11-17 06:55:08.257818', 9);
INSERT INTO auditoria VALUES (1988, 'carlos', '2011-11-17 06:55:10.707131', 17);
INSERT INTO auditoria VALUES (1989, 'carlos', '2011-11-17 06:55:56.997256', 40);
INSERT INTO auditoria VALUES (1990, 'carlos', '2011-11-17 06:56:13.624761', 40);
INSERT INTO auditoria VALUES (1991, 'carlos', '2011-11-17 06:56:36.781496', 40);
INSERT INTO auditoria VALUES (1992, 'carlos', '2011-11-17 06:57:22.020426', 9);
INSERT INTO auditoria VALUES (1993, 'carlos', '2011-11-17 07:02:53.635687', 9);
INSERT INTO auditoria VALUES (1994, 'carlos', '2011-11-17 07:03:01.324768', 40);
INSERT INTO auditoria VALUES (1995, 'carlos', '2011-11-17 07:03:11.868495', 17);
INSERT INTO auditoria VALUES (1996, 'carlos', '2011-11-18 12:45:29.019287', 0);
INSERT INTO auditoria VALUES (1997, 'carlos', '2011-11-18 12:45:48.02105', 17);
INSERT INTO auditoria VALUES (1998, 'carlos', '2011-11-21 06:08:15.700039', 0);
INSERT INTO auditoria VALUES (1999, 'carlos', '2011-11-21 06:10:16.545076', 9);
INSERT INTO auditoria VALUES (2000, 'carlos', '2011-11-21 06:57:43.02546', 0);
INSERT INTO auditoria VALUES (2001, 'carlos', '2011-11-21 07:00:15.612528', 17);
INSERT INTO auditoria VALUES (2002, 'carlos', '2011-11-21 07:02:31.342225', 40);
INSERT INTO auditoria VALUES (2003, 'carlos', '2011-11-21 07:02:40.300561', 9);
INSERT INTO auditoria VALUES (2004, 'carlos', '2011-11-21 07:16:42.764316', 9);
INSERT INTO auditoria VALUES (2005, 'carlos', '2011-11-21 07:17:05.010093', 40);
INSERT INTO auditoria VALUES (2006, 'carlos', '2011-11-21 07:17:22.40322', 9);
INSERT INTO auditoria VALUES (2007, 'carlos', '2011-12-27 09:24:39.876726', 0);
INSERT INTO auditoria VALUES (2008, 'carlos', '2011-12-27 09:25:04.083647', 0);
INSERT INTO auditoria VALUES (2009, 'carlos', '2011-12-27 09:25:13.669971', 40);
INSERT INTO auditoria VALUES (2010, 'carlos', '2011-12-27 09:39:41.817088', 17);
INSERT INTO auditoria VALUES (2011, 'carlos', '2012-01-09 07:07:53.613237', 0);
INSERT INTO auditoria VALUES (2012, 'carlos', '2012-01-09 07:13:16.592417', 40);
INSERT INTO auditoria VALUES (2013, 'jorman', '2012-01-10 06:00:47.044432', 0);
INSERT INTO auditoria VALUES (2014, 'jorman', '2012-01-10 06:01:34.272497', 11);
INSERT INTO auditoria VALUES (2015, 'jorman', '2012-01-10 06:02:32.555921', 11);
INSERT INTO auditoria VALUES (2016, 'jorman', '2012-01-10 06:03:19.36368', 11);
INSERT INTO auditoria VALUES (2017, 'jorman', '2012-01-10 06:06:14.573488', 11);
INSERT INTO auditoria VALUES (2018, 'luis', '2012-01-10 06:09:26.067289', 0);
INSERT INTO auditoria VALUES (2019, 'luis', '2012-01-10 06:09:44.642321', 3);
INSERT INTO auditoria VALUES (2020, 'jorman', '2012-01-10 06:11:30.307258', 0);
INSERT INTO auditoria VALUES (2021, 'jorman', '2012-01-10 06:11:37.975674', 11);
INSERT INTO auditoria VALUES (2022, 'jorman', '2012-01-10 06:14:39.41117', 11);
INSERT INTO auditoria VALUES (2023, 'jorman', '2012-01-10 06:15:12.897718', 11);
INSERT INTO auditoria VALUES (2024, 'jorman', '2012-01-10 06:15:47.984041', 11);
INSERT INTO auditoria VALUES (2025, 'luis', '2012-01-10 06:15:58.163731', 0);
INSERT INTO auditoria VALUES (2026, 'luis', '2012-01-10 06:16:01.765703', 3);
INSERT INTO auditoria VALUES (2027, 'jorman', '2012-01-11 12:25:25.725441', 0);
INSERT INTO auditoria VALUES (2028, 'jorman', '2012-01-11 12:25:33.24261', 11);
INSERT INTO auditoria VALUES (2029, 'jorman', '2012-01-11 12:27:11.116321', 11);
INSERT INTO auditoria VALUES (2030, 'jorman', '2012-01-11 12:27:34.738372', 11);
INSERT INTO auditoria VALUES (2031, 'jorman', '2012-01-11 12:27:58.580101', 11);
INSERT INTO auditoria VALUES (2032, '', '2012-01-11 12:31:45.5863', 11);
INSERT INTO auditoria VALUES (2033, '', '2012-01-11 12:31:50.658687', 11);
INSERT INTO auditoria VALUES (2034, '', '2012-01-11 12:33:00.223429', 11);
INSERT INTO auditoria VALUES (2035, 'jose', '2012-01-11 12:33:26.348498', 0);
INSERT INTO auditoria VALUES (2036, 'jose', '2012-01-11 12:34:01.853419', 3);
INSERT INTO auditoria VALUES (2037, 'jose', '2012-01-11 12:38:58.948602', 16);
INSERT INTO auditoria VALUES (2038, 'jorman', '2012-01-11 12:40:14.305371', 0);
INSERT INTO auditoria VALUES (2039, 'jorman', '2012-01-11 12:40:29.490048', 15);
INSERT INTO auditoria VALUES (2040, 'jorman', '2012-01-11 12:41:42.005242', 21);
INSERT INTO auditoria VALUES (2041, 'jorman', '2012-01-11 12:41:42.021687', 21);
INSERT INTO auditoria VALUES (2042, 'jorman', '2012-01-11 12:41:47.45408', 22);
INSERT INTO auditoria VALUES (2043, 'mariela', '2012-01-12 08:48:30.426073', 0);
INSERT INTO auditoria VALUES (2044, 'mariela', '2012-01-12 08:50:55.457458', 3);
INSERT INTO auditoria VALUES (2045, 'mariela', '2012-01-12 08:54:14.238054', 3);
INSERT INTO auditoria VALUES (2046, 'mariela', '2012-01-13 07:38:42.733497', 0);
INSERT INTO auditoria VALUES (2047, 'mariela', '2012-01-13 07:39:16.8095', 17);
INSERT INTO auditoria VALUES (2048, 'mariela', '2012-01-13 07:43:30.399274', 9);
INSERT INTO auditoria VALUES (2049, 'mariela', '2012-01-13 09:09:43.265668', 9);
INSERT INTO auditoria VALUES (2050, 'mariela', '2012-01-13 09:16:04.345926', 9);
INSERT INTO auditoria VALUES (2051, 'mariela', '2012-01-13 09:20:30.092162', 9);
INSERT INTO auditoria VALUES (2052, 'mariela', '2012-01-13 09:22:24.426371', 9);
INSERT INTO auditoria VALUES (2053, 'mariela', '2012-01-13 09:25:01.773664', 9);
INSERT INTO auditoria VALUES (2054, 'mariela', '2012-01-13 09:26:05.773626', 9);
INSERT INTO auditoria VALUES (2055, 'mariela', '2012-01-13 09:26:17.596411', 17);
INSERT INTO auditoria VALUES (2056, 'mariela', '2012-01-19 11:13:00.646954', 0);
INSERT INTO auditoria VALUES (2057, 'mariela', '2012-01-19 11:19:30.335732', 3);
INSERT INTO auditoria VALUES (2058, 'mariela', '2012-01-19 11:19:42.903298', 9);
INSERT INTO auditoria VALUES (2059, 'mariela', '2012-01-19 12:16:06.526141', 0);
INSERT INTO auditoria VALUES (2060, 'mariela', '2012-01-19 12:16:12.395373', 9);
INSERT INTO auditoria VALUES (2061, 'mariela', '2012-01-20 06:04:08.235365', 0);
INSERT INTO auditoria VALUES (2062, 'mariela', '2012-01-20 06:04:31.325103', 9);
INSERT INTO auditoria VALUES (2063, 'mariela', '2012-01-20 06:04:39.357359', 17);
INSERT INTO auditoria VALUES (2064, 'mariela', '2012-01-20 06:06:08.278778', 9);
INSERT INTO auditoria VALUES (2065, 'mariela', '2012-01-20 06:07:19.353143', 17);
INSERT INTO auditoria VALUES (2066, 'mariela', '2012-01-20 06:08:12.47472', 9);
INSERT INTO auditoria VALUES (2067, 'mariela', '2012-01-20 06:42:28.853475', 9);
INSERT INTO auditoria VALUES (2068, 'mariela', '2012-01-20 06:42:44.780934', 17);
INSERT INTO auditoria VALUES (2069, 'mariela', '2012-01-20 06:43:43.026941', 40);
INSERT INTO auditoria VALUES (2070, 'mariela', '2012-01-20 06:44:31.791117', 40);
INSERT INTO auditoria VALUES (2071, 'mariela', '2012-01-20 06:45:13.369375', 9);
INSERT INTO auditoria VALUES (2072, 'mariela', '2012-01-20 06:45:53.417909', 40);
INSERT INTO auditoria VALUES (2073, 'pasante1', '2012-01-20 07:30:33.626128', 0);
INSERT INTO auditoria VALUES (2074, 'pasante1', '2012-01-20 07:30:51.904137', 9);
INSERT INTO auditoria VALUES (2075, 'mariela', '2012-01-20 07:45:50.682876', 0);
INSERT INTO auditoria VALUES (2076, 'mariela', '2012-01-20 07:45:57.75028', 40);
INSERT INTO auditoria VALUES (2077, 'mariela', '2012-01-20 07:46:19.830316', 9);
INSERT INTO auditoria VALUES (2078, 'mariela', '2012-01-20 07:48:44.269643', 9);
INSERT INTO auditoria VALUES (2079, 'mariela', '2012-01-20 07:50:57.753342', 9);
INSERT INTO auditoria VALUES (2080, 'mariela', '2012-01-20 07:52:42.686598', 9);
INSERT INTO auditoria VALUES (2081, 'mariela', '2012-01-20 07:55:24.457874', 9);
INSERT INTO auditoria VALUES (2082, 'mariela', '2012-01-20 07:57:54.944394', 9);
INSERT INTO auditoria VALUES (2083, 'mariela', '2012-01-20 07:58:06.86637', 17);
INSERT INTO auditoria VALUES (2084, 'pasante1', '2012-01-20 08:09:15.861275', 9);
INSERT INTO auditoria VALUES (2085, 'pasante1', '2012-01-20 08:11:55.074609', 9);
INSERT INTO auditoria VALUES (2086, 'pasante1', '2012-01-20 08:14:17.381732', 9);
INSERT INTO auditoria VALUES (2087, 'pasante1', '2012-01-20 08:17:36.591374', 9);
INSERT INTO auditoria VALUES (2088, 'pasante1', '2012-01-20 08:19:06.419957', 9);
INSERT INTO auditoria VALUES (2089, 'pasante1', '2012-01-20 08:19:16.85446', 17);
INSERT INTO auditoria VALUES (2090, 'pasante1', '2012-01-20 08:20:20.447504', 9);
INSERT INTO auditoria VALUES (2091, 'pasante1', '2012-01-20 08:21:33.546015', 9);
INSERT INTO auditoria VALUES (2092, 'pasante1', '2012-01-20 08:21:37.781308', 17);
INSERT INTO auditoria VALUES (2093, 'pasante1', '2012-01-20 08:22:21.688957', 9);
INSERT INTO auditoria VALUES (2094, 'pasante1', '2012-01-20 08:24:47.054733', 9);
INSERT INTO auditoria VALUES (2095, 'pasante1', '2012-01-20 08:27:01.729111', 9);
INSERT INTO auditoria VALUES (2096, 'pasante1', '2012-01-20 08:28:46.084246', 9);
INSERT INTO auditoria VALUES (2097, 'pasante1', '2012-01-20 08:30:33.310208', 9);
INSERT INTO auditoria VALUES (2098, 'pasante1', '2012-01-20 08:31:48.168678', 9);
INSERT INTO auditoria VALUES (2099, 'pasante1', '2012-01-20 08:32:54.39626', 9);
INSERT INTO auditoria VALUES (2100, 'pasante1', '2012-01-20 08:49:32.490258', 9);
INSERT INTO auditoria VALUES (2101, 'alexis', '2012-01-23 11:01:19.659288', 0);
INSERT INTO auditoria VALUES (2102, 'alexis', '2012-01-23 11:01:47.373964', 40);
INSERT INTO auditoria VALUES (2103, 'alexis', '2012-01-23 11:03:19.792146', 40);
INSERT INTO auditoria VALUES (2104, 'alexis', '2012-01-23 11:03:43.279311', 40);
INSERT INTO auditoria VALUES (2105, 'alexis', '2012-01-23 11:05:44.667101', 40);
INSERT INTO auditoria VALUES (2106, 'abrahan', '2012-01-25 06:36:56.664745', 0);
INSERT INTO auditoria VALUES (2107, 'abrahan', '2012-01-25 06:37:16.889787', 9);
INSERT INTO auditoria VALUES (2108, 'carlos', '2012-02-10 13:36:01.97833', 0);
INSERT INTO auditoria VALUES (2109, 'carlos', '2012-02-10 13:36:11.083268', 40);
INSERT INTO auditoria VALUES (2110, 'carlos', '2012-02-10 13:36:56.667457', 40);
INSERT INTO auditoria VALUES (2111, 'carlos', '2012-02-10 13:37:04.192071', 17);
INSERT INTO auditoria VALUES (2112, 'carlos', '2012-02-14 07:25:09.358863', 0);
INSERT INTO auditoria VALUES (2113, 'carlos', '2012-02-14 07:25:13.118037', 11);
INSERT INTO auditoria VALUES (2114, 'carlos', '2012-02-14 07:27:42.788572', 11);
INSERT INTO auditoria VALUES (2115, 'carlos', '2012-02-14 07:27:54.965608', 9);
INSERT INTO auditoria VALUES (2116, 'yormary', '2012-02-14 07:32:53.967992', 0);
INSERT INTO auditoria VALUES (2117, 'yormary', '2012-02-14 07:32:59.118393', 9);
INSERT INTO auditoria VALUES (2118, 'robetorr', '2012-02-14 07:58:08.21123', 0);
INSERT INTO auditoria VALUES (2119, 'yormary', '2012-02-14 08:42:01.326798', 9);
INSERT INTO auditoria VALUES (2120, 'yormary', '2012-02-14 08:45:19.608277', 9);
INSERT INTO auditoria VALUES (2121, 'yormary', '2012-02-14 08:51:31.984198', 40);
INSERT INTO auditoria VALUES (2122, 'yormary', '2012-02-14 08:52:00.565771', 9);
INSERT INTO auditoria VALUES (2123, 'yormary', '2012-02-14 09:02:20.522061', 0);
INSERT INTO auditoria VALUES (2124, 'yormary', '2012-02-14 09:02:25.969183', 9);
INSERT INTO auditoria VALUES (2125, 'yormary', '2012-02-14 09:03:42.479589', 9);
INSERT INTO auditoria VALUES (2126, 'yormary', '2012-02-14 10:42:38.165818', 0);
INSERT INTO auditoria VALUES (2127, 'yormary', '2012-02-14 10:42:42.540556', 9);
INSERT INTO auditoria VALUES (2128, 'carlos', '2012-02-15 07:04:35.579261', 0);
INSERT INTO auditoria VALUES (2129, 'carlos', '2012-02-15 07:04:45.097365', 17);
INSERT INTO auditoria VALUES (2130, 'yormary', '2012-02-22 07:44:45.983465', 0);
INSERT INTO auditoria VALUES (2131, 'yormary', '2012-02-22 07:44:53.952176', 9);
INSERT INTO auditoria VALUES (2132, 'yormary', '2012-02-22 07:54:19.654551', 9);
INSERT INTO auditoria VALUES (2133, 'yormary', '2012-02-22 08:06:43.403335', 9);
INSERT INTO auditoria VALUES (2134, 'yormary', '2012-02-22 08:08:00.420177', 9);
INSERT INTO auditoria VALUES (2135, 'yormary', '2012-02-22 08:10:23.606102', 9);
INSERT INTO auditoria VALUES (2136, 'yormary', '2012-02-22 08:11:26.760279', 9);
INSERT INTO auditoria VALUES (2137, 'yormary', '2012-02-22 08:43:17.8159', 9);
INSERT INTO auditoria VALUES (2138, 'yormary', '2012-02-22 08:46:44.792592', 9);
INSERT INTO auditoria VALUES (2139, 'yormary', '2012-02-22 08:48:47.655833', 9);
INSERT INTO auditoria VALUES (2140, 'yormary', '2012-02-22 08:50:13.423368', 9);
INSERT INTO auditoria VALUES (2141, 'yormary', '2012-02-22 08:51:09.821619', 9);
INSERT INTO auditoria VALUES (2142, 'yormary', '2012-02-22 11:06:24.709616', 0);
INSERT INTO auditoria VALUES (2143, 'yormary', '2012-02-22 11:07:20.316594', 0);
INSERT INTO auditoria VALUES (2144, 'yormary', '2012-02-22 11:07:24.644919', 9);
INSERT INTO auditoria VALUES (2145, 'yormary', '2012-02-22 11:07:37.486107', 17);
INSERT INTO auditoria VALUES (2146, 'yormary', '2012-02-22 11:09:03.422687', 9);
INSERT INTO auditoria VALUES (2147, 'yormary', '2012-02-22 11:26:20.213362', 9);
INSERT INTO auditoria VALUES (2148, 'yormary', '2012-02-22 11:26:58.665467', 17);
INSERT INTO auditoria VALUES (2149, 'yormary', '2012-02-22 11:27:37.838452', 9);
INSERT INTO auditoria VALUES (2150, 'yormary', '2012-02-22 11:29:57.126973', 9);
INSERT INTO auditoria VALUES (2151, 'yormary', '2012-02-22 11:32:26.229465', 9);
INSERT INTO auditoria VALUES (2152, 'yormary', '2012-02-22 11:33:44.588771', 9);
INSERT INTO auditoria VALUES (2153, 'yormary', '2012-02-22 11:34:49.225602', 9);
INSERT INTO auditoria VALUES (2154, 'yormary', '2012-02-22 12:03:43.157304', 9);
INSERT INTO auditoria VALUES (2155, 'robetorr', '2012-02-22 12:48:25.96398', 0);
INSERT INTO auditoria VALUES (2156, 'robetorr', '2012-02-22 12:48:34.952857', 43);
INSERT INTO auditoria VALUES (2157, 'robetorr', '2012-02-22 12:51:27.560362', 0);
INSERT INTO auditoria VALUES (2158, 'robetorr', '2012-02-22 12:51:32.759245', 43);
INSERT INTO auditoria VALUES (2159, 'yormary', '2012-02-23 08:27:06.226073', 0);
INSERT INTO auditoria VALUES (2160, 'yormary', '2012-02-23 08:32:52.956353', 3);
INSERT INTO auditoria VALUES (2161, 'yormary', '2012-02-23 08:33:03.235228', 9);
INSERT INTO auditoria VALUES (2162, 'yormary', '2012-02-23 08:36:11.877399', 9);
INSERT INTO auditoria VALUES (2163, 'robetorr', '2012-02-23 08:48:27.326351', 0);
INSERT INTO auditoria VALUES (2164, 'robetorr', '2012-02-23 08:48:38.136139', 44);
INSERT INTO auditoria VALUES (2165, 'yormary', '2012-02-23 08:49:09.33758', 0);
INSERT INTO auditoria VALUES (2166, 'yormary', '2012-02-23 08:49:17.210029', 3);
INSERT INTO auditoria VALUES (2167, 'yormary', '2012-02-23 08:52:35.157653', 9);
INSERT INTO auditoria VALUES (2168, 'yormary', '2012-02-23 08:57:45.767264', 9);
INSERT INTO auditoria VALUES (2169, 'robetorr', '2012-02-23 08:57:57.599021', 0);
INSERT INTO auditoria VALUES (2170, 'robetorr', '2012-02-23 08:58:05.218598', 44);
INSERT INTO auditoria VALUES (2171, 'yormary', '2012-02-23 08:59:50.036572', 9);
INSERT INTO auditoria VALUES (2172, 'yormary', '2012-02-23 09:01:41.495542', 9);
INSERT INTO auditoria VALUES (2173, 'robetorr', '2012-02-23 11:43:41.176293', 0);
INSERT INTO auditoria VALUES (2174, 'robetorr', '2012-02-23 11:43:48.52779', 44);


--
-- TOC entry 2266 (class 0 OID 33262)
-- Dependencies: 1796
-- Data for Name: cambios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cambios VALUES (1, 11656, 117201114243122, 'fdhgfhgfh', '2011-08-01 08:04:33.977654-04:30', 9, 11656919);


--
-- TOC entry 2267 (class 0 OID 59366)
-- Dependencies: 1811
-- Data for Name: capacidaddd; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO capacidaddd VALUES (10, '10 GB');
INSERT INTO capacidaddd VALUES (20, '20 GB');
INSERT INTO capacidaddd VALUES (30, '30 GB');
INSERT INTO capacidaddd VALUES (40, '40 GB');
INSERT INTO capacidaddd VALUES (50, '50 GB');
INSERT INTO capacidaddd VALUES (60, '60 GB');
INSERT INTO capacidaddd VALUES (80, '80 GB');
INSERT INTO capacidaddd VALUES (100, '100 GB');
INSERT INTO capacidaddd VALUES (250, '250 GB');
INSERT INTO capacidaddd VALUES (465, '465 GB');
INSERT INTO capacidaddd VALUES (500, '500 GB');
INSERT INTO capacidaddd VALUES (1000, '1 TB');


--
-- TOC entry 2268 (class 0 OID 59371)
-- Dependencies: 1812
-- Data for Name: capacidadram; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO capacidadram VALUES (32, '32 MB');
INSERT INTO capacidadram VALUES (64, '64 MB');
INSERT INTO capacidadram VALUES (128, '128 MB');
INSERT INTO capacidadram VALUES (256, '256 MB');
INSERT INTO capacidadram VALUES (512, '512 MB');
INSERT INTO capacidadram VALUES (1000, '1 GB');
INSERT INTO capacidadram VALUES (2000, '2 GB');


--
-- TOC entry 2269 (class 0 OID 59378)
-- Dependencies: 1814
-- Data for Name: cartuchos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2231 (class 0 OID 16396)
-- Dependencies: 1715
-- Data for Name: cdrom; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cdrom VALUES (11720111424312261, 'cd-rom 52x max', 'n/a', '', 117201114243122, 25, NULL);
INSERT INTO cdrom VALUES (2272011104123812368, 'HL CD ROM GCK 8525B', 'N/A', '', 22720111041238123, 25, NULL);
INSERT INTO cdrom VALUES (2762011101550703040, 'No tiene', 'No tiene', '', 27620111015507030, 25, NULL);
INSERT INTO cdrom VALUES (2772011112408284101, 'CD-ROM F563E', 'N/A', '', 2772011112408284, 25, NULL);
INSERT INTO cdrom VALUES (656421716, 'N/A', 'SH-S223F', '', 656421, 28, 'TOSHIBA-SAMSUNG');
INSERT INTO cdrom VALUES (658468716, 'N/A', 'SH-S223F', '', 658468, 28, 'TOSHIBA-SAMSUNG');
INSERT INTO cdrom VALUES (13187816, 'CD-RW', 'N/A', 'null', 13187, 25, 'SAMSUNG');
INSERT INTO cdrom VALUES (217501816, 'DVD-RW', 'N/A', 'null', 21750, 28, 'AUSE');
INSERT INTO cdrom VALUES (255002616, 'CD ', 'N/A', 'null', 25500, 25, 'N/A');
INSERT INTO cdrom VALUES (282183416, 'GCR - 8525B', 'N/A', 'null', 28218, 25, 'LG');
INSERT INTO cdrom VALUES (367814216, 'N/A', 'N/A', 'NULL', 36781, 25, 'N/A');
INSERT INTO cdrom VALUES (489065116, 'CD-ROM', 'N/A', 'NULL', 48906, 25, 'N/A');
INSERT INTO cdrom VALUES (677346116, 'DVD-RW', 'N/A', 'NULL', 67734, 26, 'AUSE');
INSERT INTO cdrom VALUES (68627116, 'N/A', 'N/A', 'NULL', 6862, 25, 'N/A');
INSERT INTO cdrom VALUES (873128916, 'N/A', 'N/A', 'NULL', 87312, 28, 'SUPER WRITE MASTER');
INSERT INTO cdrom VALUES (936879816, 'N/A', 'N/A', 'NULL', 93687, 25, 'N/A');
INSERT INTO cdrom VALUES (94343716, 'N/A', 'N/A', 'NULL', 94343, 25, 'N/A');
INSERT INTO cdrom VALUES (992811516, 'N/A', 'N/A', 'NULL', 99281, 25, 'N/A');
INSERT INTO cdrom VALUES (1014842416, 'N/A', 'N/A', 'NULL', 101484, 25, 'IBM');
INSERT INTO cdrom VALUES (1034063216, 'N/A', 'N/A', 'NULL', 103406, 40, 'N/A');
INSERT INTO cdrom VALUES (1085934916, 'N/A', 'N/A', 'NULL', 108593, 28, 'AUSE');
INSERT INTO cdrom VALUES (1164375716, 'N/A', 'N/A', 'NULL', 116437, 40, 'N/A');
INSERT INTO cdrom VALUES (1281406516, 'N/A', 'N/A', 'NULL', 128140, 28, 'N/A');
INSERT INTO cdrom VALUES (3062011142146515148, 'DUAL CORE', 'N/A', '2.2 GHZ', 30620111421465151, 25, 'INTEL');
INSERT INTO cdrom VALUES (174906516, 'TSSTCORPCDDVDW', 'SH-S223F ', '', 174906, 28, 'LG');
INSERT INTO cdrom VALUES (1932651416, 'N/A', 'N/A', '', 193265, 40, 'N/A');
INSERT INTO cdrom VALUES (190313316, 'LTN486S', 'N/A', '', 19031, 25, 'LITEON');
INSERT INTO cdrom VALUES (21901716, 'LTN486S', 'N/A', '', 2190, 25, 'LITE-ON');
INSERT INTO cdrom VALUES (2279371116, 'DH52N2P', 'N/A', '', 227937, 25, 'ATAPI');
INSERT INTO cdrom VALUES (2464064216, 'DH52N2P', 'N/A', '', 246406, 25, 'ATAPI');
INSERT INTO cdrom VALUES (254265816, 'HL-DT-ST', 'N/A', '', 254265, 28, 'HITACHI-LG');
INSERT INTO cdrom VALUES (2659842616, 'OEM CD-ROM F563E', 'N/A', '', 265984, 25, ' BRAND');
INSERT INTO cdrom VALUES (2723123516, 'OEM CD-ROM F563E', 'N/A', '', 272312, 25, 'BRAND');
INSERT INTO cdrom VALUES (282640716, 'LTN486S', 'N/A', '', 282640, 25, 'LITEON');
INSERT INTO cdrom VALUES (291921716, 'LTN486S ', 'N/A', '', 291921, 25, 'LITE-ON');
INSERT INTO cdrom VALUES (300453816, 'SHC-48S7K', 'N/A', '', 300453, 25, 'LITE-ON');
INSERT INTO cdrom VALUES (310187816, 'SHC-48S7K', '2002011900043491', '', 310187, 26, 'LITE-ON');
INSERT INTO cdrom VALUES (312421716, 'LTN486S', 'N/A', '', 312421, 25, 'LITEON');
INSERT INTO cdrom VALUES (316593616, 'GCR-8525B', 'N/A', '', 316593, 25, ' HITACHI-LG');
INSERT INTO cdrom VALUES (1949533416, 'N/A', 'N/A', 'N/A', 194953, 25, 'N/A');
INSERT INTO cdrom VALUES (325131716, 'N/A', 'SH-S202J', '', 325131, 28, 'TSSTCORP');
INSERT INTO cdrom VALUES (329156816, 'N/A', 'N/A', '', 329156, 40, 'N/A');
INSERT INTO cdrom VALUES (33662816, 'CD3230E', 'PC102', '', 33662, 25, 'CREATIVE');
INSERT INTO cdrom VALUES (344937916, 'N/A', 'N/A', '', 344937, 40, 'N/A');
INSERT INTO cdrom VALUES (357375716, 'LH52N1P', 'N/A', '', 357375, 25, 'LITEON');
INSERT INTO cdrom VALUES (35831716, 'LTN-5291S', 'N/A', '', 35831, 25, 'LITEON');
INSERT INTO cdrom VALUES (366531716, 'LH52N1P', 'N/A', '', 366531, 25, 'LITEON');
INSERT INTO cdrom VALUES (379265716, 'LTN486S', 'N/A', '', 379265, 25, 'LITEON');
INSERT INTO cdrom VALUES (373875816, 'N/A', 'N/A', '', 373875, 28, 'HITACHI-LG');
INSERT INTO cdrom VALUES (386687916, 'N/A', 'N/A', '', 386687, 40, 'N/A');
INSERT INTO cdrom VALUES (399156716, 'LTN-529S', 'N/A', '', 399156, 25, 'LITEON');
INSERT INTO cdrom VALUES (4080716, 'N/A', 'LTN486S', '', 4080, 25, 'LITEON');
INSERT INTO cdrom VALUES (416234716, 'N/A', 'DH16A6L', '', 416234, 26, 'ATAPI');
INSERT INTO cdrom VALUES (401796816, 'CDDVDW ', 'TS-H653T', '', 401796, 26, 'HP');
INSERT INTO cdrom VALUES (431484716, 'N/A', 'GCR-8525B ', '', 431484, 25, 'HITACHI-LG');
INSERT INTO cdrom VALUES (448765716, ' GH15L', 'K5E8C4M0141', '', 448765, 28, 'HITACHI-LG');
INSERT INTO cdrom VALUES (433593716, 'N/A', 'GCR-8525B', 'N/A', 433593, 25, 'HITACHI-LG');
INSERT INTO cdrom VALUES (449218716, 'N/A', 'GCR-8525B', '', 449218, 25, 'CLONE');
INSERT INTO cdrom VALUES (458390716, 'N/A', 'GCR-8525B', '', 458390, 25, 'CLONE');
INSERT INTO cdrom VALUES (459546716, 'GCR-8525B', 'N/A', '', 459546, 25, 'HITACHI-LG');
INSERT INTO cdrom VALUES (46946816, 'N/A', 'GH22NS40', '', 46946, 28, ' HITACHI-LG');
INSERT INTO cdrom VALUES (470703616, 'N/A', 'N/A', '', 470703, 28, 'HITACHI-LG');
INSERT INTO cdrom VALUES (485421816, 'SC-148E', 'N/A', '', 485421, 25, ' COMPAQ');
INSERT INTO cdrom VALUES (48646816, 'CD-ROM-52X', 'LTN-5291S', '', 48646, 25, 'LITEON');
INSERT INTO cdrom VALUES (493234716, 'N/A', 'GCR-8482B', '', 493234, 25, 'HITACHI-LG');
INSERT INTO cdrom VALUES (506796716, 'N/A', 'LTN-5291S', '', 506796, 25, 'LITEON');
INSERT INTO cdrom VALUES (521656716, 'N/A', '9P59', '', 521656, 28, 'PHILIPS-BENQ');
INSERT INTO cdrom VALUES (5220716, ' LTN-5291S', 'N/A', '', 5220, 25, 'LITEON');
INSERT INTO cdrom VALUES (535406716, 'N/A', '9P59', '', 535406, 28, 'PHILIPS-BENQ');
INSERT INTO cdrom VALUES (536875716, 'DH52N2P', 'N/A', '', 536875, 25, 'CLONE');
INSERT INTO cdrom VALUES (547640816, 'LTN-5291S', 'N/A', '', 547640, 25, 'LITE-ON');
INSERT INTO cdrom VALUES (554562816, 'N/A', 'N/A', '', 554562, 40, 'N/A');
INSERT INTO cdrom VALUES (564140716, 'LTN-5291S', 'N/A', '', 564140, 25, 'LITEON');
INSERT INTO cdrom VALUES (574437716, 'N/A', 'GH22NS40', '', 574437, 28, 'HITACHI-LG');
INSERT INTO cdrom VALUES (568921716, 'LH52N1P', 'KL14', '', 568921, 25, 'LITE-ON');
INSERT INTO cdrom VALUES (566656716, 'SH-S223F', 'N/A', '', 566656, 28, 'TOSHIBA-SAMSUNG');
INSERT INTO cdrom VALUES (588375816, 'N/A', 'GH22NS50', '', 588375, 25, 'LG');
INSERT INTO cdrom VALUES (596921816, 'N/A', 'N/A', '', 596921, 40, 'N/A');
INSERT INTO cdrom VALUES (592718716, 'N/A', 'N/A', '', 592718, 25, 'N/A');
INSERT INTO cdrom VALUES (618953716, 'N/A', 'GCR-8525B', '', 618953, 25, 'HITACHI-LG');
INSERT INTO cdrom VALUES (626250816, 'N/A', 'N/A', '', 626250, 40, 'N/A');
INSERT INTO cdrom VALUES (634859716, 'N/A', 'DH20A4P', '', 634859, 28, 'PHILIPS-BENQ');
INSERT INTO cdrom VALUES (641796716, 'N/A', ' LH52N1P', '', 641796, 25, 'LITEON');
INSERT INTO cdrom VALUES (648343716, 'N/A', 'SH-S223F', '', 648343, 28, 'TOSHIBA-SAMSUNG');
INSERT INTO cdrom VALUES (661109716, 'N/A', 'DH20A4P', '', 661109, 28, 'PHILIPS-BENQ');
INSERT INTO cdrom VALUES (664390616, 'N/A', 'GCR-8482B', '', 664390, 25, 'HITACHI-LG');
INSERT INTO cdrom VALUES (675406716, 'N/A', 'LH52N1P', '', 675406, 25, 'LITE-ON');
INSERT INTO cdrom VALUES (678937716, 'DH20A4P', 'N/A', '', 678937, 26, 'ATAPI');
INSERT INTO cdrom VALUES (698515716, 'AD-7200S', 'N/A', '', 698515, 26, ' SONY ');
INSERT INTO cdrom VALUES (702187916, 'CDDVDW SH-222AB ATA DEVICE', 'N/A', '', 702187, 28, 'SAMSUNG');
INSERT INTO cdrom VALUES (714375716, 'SH-222AB', 'N/A', '', 714375, 28, 'TOSHIBA SAMSUNG');
INSERT INTO cdrom VALUES (72193716, 'SH-222AB', 'ST31000524AS', '', 72193, 28, 'TOSHIBA SAMSUNG');
INSERT INTO cdrom VALUES (72793716, 'SH-S223F', 'N/A', '', 72793, 28, 'TOSHIBA-SAMSUNG');


--
-- TOC entry 2232 (class 0 OID 16399)
-- Dependencies: 1716
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO departamento VALUES (21, 'Direccion de Epidemiologia', 'Dr. Angel Melchor', '0243-2411673', 'Dirección de Epidemiologia', '0020', 1);
INSERT INTO departamento VALUES (14, 'Tesoreria', '', '0243-2421225', '', '0013', 1);
INSERT INTO departamento VALUES (15, 'Bienes Nacionales', '', '', '', '0014', 1);
INSERT INTO departamento VALUES (16, 'Contabilidad', '', '', '', '0015', 1);
INSERT INTO departamento VALUES (17, 'Compras', '', '0243-2146788', '', '0016', 1);
INSERT INTO departamento VALUES (20, 'Prensa', '', '0243-2421080', '', '0019', 1);
INSERT INTO departamento VALUES (22, 'Consultoria Juridica', '', '0243-2422804', '', '0021', 1);
INSERT INTO departamento VALUES (23, 'Presidencia', 'Dr. Carlos Mendoza', '0243-2419745', 'Despacho del Presidente de Corposalud Aragua', '0022', 1);
INSERT INTO departamento VALUES (9, 'Almacen', '', '0243-2422232', '', '0008', 1);
INSERT INTO departamento VALUES (11, 'Desarrollo Social', '', '0243-2423042', '', '0010', 1);
INSERT INTO departamento VALUES (8, 'Sala Situacional', '', 'No Tiene', '', '0007', 1);
INSERT INTO departamento VALUES (1, 'Direccion de Informatica', 'Guillermo Montilla', '(0414)5895413', 'Dirección de Informática', '0001', 1);
INSERT INTO departamento VALUES (3, 'Direccion de Administracion', 'Lic. Monica Cosme', '0243-2422263', 'Dirección de Administración', '0003', 1);
INSERT INTO departamento VALUES (2, 'Direccion de Recursos Humanos', 'Lic Jackeline Parra', '0243-2425153', 'Dirección de Recursos Humanos Corposalud', '0002', 1);
INSERT INTO departamento VALUES (4, 'Direccion de Planificacion y Presupuesto', '', '0243-2424270', 'Dirección de Planificación y Presupuesto', '0004', 1);
INSERT INTO departamento VALUES (5, 'Direccion de Infraestructura', 'Ing. Yariadneth Liendo', '0243-2425505', 'Dirección de Infraestructura', '0005', 1);
INSERT INTO departamento VALUES (7, 'Direccion de Emergencias y Desastres', 'TSU. Antonio Amaro', '0243-2411332', 'Dirección de Emergencias y Desastres', '0006', 1);
INSERT INTO departamento VALUES (10, 'Coordinacion de Transporte', '', 'No Tiene', '', '0009', 1);
INSERT INTO departamento VALUES (12, 'Direccion de Contraloria Sanitaria', 'Ing. Adi Contreras', '0243-2425023', 'Dirección de Contraloria Sanitaria', '0011', 1);
INSERT INTO departamento VALUES (13, 'Direccion de Contraloria Interna', '', '0243-2425272', 'Dirección de Contraloria Interna', '0012', 1);
INSERT INTO departamento VALUES (18, 'Direccion General de Salud', 'Ing. Karelis Lugo', '0243-2424876', 'Dirección General de Salud', '0017', 1);
INSERT INTO departamento VALUES (19, 'Direccion de Enfermeria', '', '', '', '0018', 1);


--
-- TOC entry 2264 (class 0 OID 33234)
-- Dependencies: 1789
-- Data for Name: desincorporados; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2233 (class 0 OID 16405)
-- Dependencies: 1717
-- Data for Name: discoduro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO discoduro VALUES (277201111240828493, '62412VDC', 'MAXTOR', 'N/A', 1, '10 GB', 2772011112408284, 10);
INSERT INTO discoduro VALUES (2762011101550703034, 'No tiene', 'Seagate', 'No tiene', 1, '80 GB', 27620111015507030, 80);
INSERT INTO discoduro VALUES (6862657, 'ST340015A', 'HITACHI', '1', 1, '40 GB', 6862, 40);
INSERT INTO discoduro VALUES (408017, 'WD800BB-22HEA0', 'WDC', 'N/A', 1, '80 GB', 4080, 80);
INSERT INTO discoduro VALUES (522017, 'TM3802110A', 'MAXTOR', 'N/A', 1, '80 GB', 5220, 80);
INSERT INTO discoduro VALUES (1318737, 'N/A', 'GENERICA', 'N/A', 1, '80 GB', 13187, 80);
INSERT INTO discoduro VALUES (3366227, 'WD-WMAMC5040522', 'WESTERN', 'N/A', 1, '40 GB', 33662, 40);
INSERT INTO discoduro VALUES (3583117, '3802110A', 'MAXTOR', 'N/A', 1, '80 GB', 35831, 80);
INSERT INTO discoduro VALUES (4864617, 'STM3802110A', 'MAXTOR', 'N/A', 1, '80 GB', 48646, 80);
INSERT INTO discoduro VALUES (7219317, 'N/A', 'SEAGATE', 'N/A', 2, '1 TB', 72193, 1000);
INSERT INTO discoduro VALUES (21750127, 'N/A', 'SAMSUNG', 'N/A', 2, '160 GB', 21750, 160);
INSERT INTO discoduro VALUES (19031197, 'WD-WMAD1D767756', 'WDC', 'N/A', 2, '40 GB', 19031, 40);
INSERT INTO discoduro VALUES (9434317, 'N/A', 'MAXTOR', '01', 2, '500 GB', 94343, 500);
INSERT INTO discoduro VALUES (9928197, 'N/A', 'SEAGATE', '01', 1, '40 GB', 99281, 40);
INSERT INTO discoduro VALUES (28218287, 'ST340014A', 'SEAGATE', '1', 1, '40 GB', 28218, 40);
INSERT INTO discoduro VALUES (19326547, 'WD-WMAJA1141200', 'ULTRA ATA INTEL(R) 82801DB', 'WDC WD400BB-00FJA0', 1, '40 GB', 193265, 40);
INSERT INTO discoduro VALUES (31659317, 'WD800BB-22JHC0 ', 'WDC', 'N/A', 1, '74 GB', 316593, 74);
INSERT INTO discoduro VALUES (25500207, 'N/A', 'N/A', '1', 1, '80 GB', 25500, 80);
INSERT INTO discoduro VALUES (67893717, 'HD161H', 'SAMSUNG', 'N/A', 2, '160 GB', 678937, 160);
INSERT INTO discoduro VALUES (28264017, 'WD400BB-23DEA0', 'WDC', 'N/A', 1, '34 GB', 282640, 34);
INSERT INTO discoduro VALUES (29192127, 'IC35L060AVV207', 'IBM', 'N/A', 1, '60 GB', 291921, 60);
INSERT INTO discoduro VALUES (30045327, 'ST3808110AS', 'SEAGATE', 'N/A', 2, '80 GB', 300453, 80);
INSERT INTO discoduro VALUES (31018727, 'ST3808110AS', 'SEAGATE', 'N/A', 2, '80 GB', 310187, 80);
INSERT INTO discoduro VALUES (67734547, 'N/A', 'SAMSUNG', '1', 1, '160 GB', 67734, 160);
INSERT INTO discoduro VALUES (32513117, 'HDS728080PLA380', 'INTEL', 'N/A', 2, '80 GB', 325131, 80);
INSERT INTO discoduro VALUES (32915627, '5400.1 40015', 'SEAGATE', 'N/A', 1, '40 GB', 329156, 40);
INSERT INTO discoduro VALUES (34493737, '3JV2BYK8', 'SEAGATE', 'N/A', 1, '60 GB', 344937, 60);
INSERT INTO discoduro VALUES (35737517, 'WD800BB-00JKC0', 'WDC', 'N/A', 1, '80 GB', 357375, 80);
INSERT INTO discoduro VALUES (36653117, 'WD800BB-00JKC0', 'WDC', 'N/A', 1, '80 GB', 366531, 80);
INSERT INTO discoduro VALUES (36781367, 'N/A', 'N/A', '1', 1, '80 GB', 36781, 80);
INSERT INTO discoduro VALUES (37926517, 'WD400BB-23DEA0', 'WDC', 'N/A', 1, '34 GB', 379265, 34);
INSERT INTO discoduro VALUES (38668727, 'MPA3026AT', 'FUJITSU', 'N/A', 1, '2 GB', 386687, 2);
INSERT INTO discoduro VALUES (38668737, 'ST34321A', 'N/A', 'N/A', 1, '4 GB', 386687, 4);
INSERT INTO discoduro VALUES (39915617, 'WD-WMAM97116125', 'WDC', 'N/A', 1, '80 GB', 399156, 80);
INSERT INTO discoduro VALUES (40179627, 'HD502HJ', 'SAMSUNG', 'N/A', 1, '465 GB', 401796, 465);
INSERT INTO discoduro VALUES (41623417, 'ST3250310AS', 'SEAGATE', 'N/A', 2, '250 GB', 416234, 250);
INSERT INTO discoduro VALUES (43359317, 'WD800BB-22JHC0', 'WDC', 'N/A', 1, '74 GB', 433593, 74);
INSERT INTO discoduro VALUES (44876517, 'ST3250310AS', 'SEAGATE', 'N/A', 2, '250 GB', 448765, 250);
INSERT INTO discoduro VALUES (44921817, 'WD800BB-223HC0', 'WDC', 'N/A', 1, '80 GB', 449218, 80);
INSERT INTO discoduro VALUES (45839017, 'WD800BB-223HC0', 'WDC', 'N/A', 1, '80 GB', 458390, 80);
INSERT INTO discoduro VALUES (45954617, 'WD800BB', 'WDC', 'N/A', 1, '74 GB', 459546, 74);
INSERT INTO discoduro VALUES (47070317, 'ST3250310AS', 'N/A', 'N/A', 2, '250 GB', 470703, 250);
INSERT INTO discoduro VALUES (48542127, 'WD400BB-60DGA0', 'WDC', 'N/A', 1, '37 GB', 485421, 37);
INSERT INTO discoduro VALUES (48906457, 'N/A', 'SAMSUNG', '1', 1, '10 GB', 48906, 10);
INSERT INTO discoduro VALUES (50679617, 'STM3802110A', 'MAXTOR', 'N/A', 1, '80 GB', 506796, 80);
INSERT INTO discoduro VALUES (52165617, '80021', 'SEAGATE', 'N/A', 1, '80 GB', 521656, 80);
INSERT INTO discoduro VALUES (53540617, '80021', 'SEAGATE', 'N/A', 1, '80 GB', 535406, 80);
INSERT INTO discoduro VALUES (53687517, 'HDS721616PLA380  ', 'HITACHI', 'N/A', 2, '160 GB', 536875, 160);
INSERT INTO discoduro VALUES (54764027, 'WD800BB-22JHC0', 'WDC', 'N/A', 1, '74 GB', 547640, 74);
INSERT INTO discoduro VALUES (55456227, 'WD400BB-60DGA0', 'WDC', 'N/A', 1, '37 GB', 554562, 37);
INSERT INTO discoduro VALUES (56665617, 'STM3250310AS', 'MAXTOR ', 'N/A', 2, '250 GB', 566656, 250);
INSERT INTO discoduro VALUES (56892117, 'WD-WCAMD8552509', 'WDC', 'N/A', 1, '80 GB', 568921, 80);
INSERT INTO discoduro VALUES (57443717, 'WD5000AAKX-003CA0', 'WDC', 'N/A', 1, '465 GB', 574437, 465);
INSERT INTO discoduro VALUES (58837517, 'WD1600AAJS-60M0A0', 'WDC', 'N/A', 1, '160 GB', 588375, 160);
INSERT INTO discoduro VALUES (58837527, 'HDS728080PLAT20', 'HITACHI', 'N/A', 1, '80 GB', 588375, 80);
INSERT INTO discoduro VALUES (59271817, '5FB8EG7E', 'SEAGATE', 'N/A', 1, '40 GB', 592718, 40);
INSERT INTO discoduro VALUES (61895317, 'WD800BB-75JHC0', 'WDC', 'N/A', 1, '80 GB', 618953, 80);
INSERT INTO discoduro VALUES (62625027, 'E1RR0FGE', 'MAXTOR', 'N/A', 1, '40 GB', 626250, 40);
INSERT INTO discoduro VALUES (63485917, 'S0V3J9CQ713295', 'SAMSUNG', 'N/A', 2, '160 GB', 634859, 160);
INSERT INTO discoduro VALUES (64179617, 'WD800BB-00JKC0 ', 'WDC', 'N/A', 1, '74 GB', 641796, 74);
INSERT INTO discoduro VALUES (64834317, 'STM3250310AS', 'MAXTOR ', 'N/A', 2, '250 GB', 648343, 250);
INSERT INTO discoduro VALUES (65642187, 'STM3250310AS', 'MAXTOR', 'N/A', 2, '250 GB', 656421, 250);
INSERT INTO discoduro VALUES (65846817, 'STM3250310AS', 'MAXTOR', 'N/A', 2, '250 GB', 658468, 250);
INSERT INTO discoduro VALUES (66439017, 'WD800BB-22JHC0', 'WDC', 'N/A', 1, '80 GB', 664390, 80);
INSERT INTO discoduro VALUES (70218717, 'ST31000524AS', 'SEAGATE', '1', 2, '1 TB', 702187, 1000);
INSERT INTO discoduro VALUES (67540617, 'WD800BB-00JKC0 ', 'WDC', 'N/A', 1, '74 GB', 675406, 74);
INSERT INTO discoduro VALUES (69851517, 'STM3250310AS', 'MAXTOR', 'N/A', 2, '250 GB', 698515, 250);
INSERT INTO discoduro VALUES (103406267, 'N/A', 'SAMSUNG', '1', 2, '250 GB', 103406, 250);
INSERT INTO discoduro VALUES (128140597, 'N/A', 'SAMSUNG', '1', 2, '150 GB', 128140, 150);
INSERT INTO discoduro VALUES (87312847, '9RY3JF8K', 'MAXTOR', '01', 2, '250 GB', 87312, 250);
INSERT INTO discoduro VALUES (93687927, 'N/A', 'WESTERN DIGITAL', '01', 1, '80 GB', 93687, 80);
INSERT INTO discoduro VALUES (101484187, 'N/A', 'WESTER DIGITAL', '1', 1, '80 GB', 101484, 80);
INSERT INTO discoduro VALUES (108593437, 'N/A', 'N/A', '1', 1, '200 GB', 108593, 200);
INSERT INTO discoduro VALUES (11720111424312251, 'sp0411n', 'samsung', 'n/a', 1, '40 GB', 117201114243122, 40);
INSERT INTO discoduro VALUES (116437517, 'N/A', 'SAMSUNG', '1', 2, '250 GB', 116437, 250);
INSERT INTO discoduro VALUES (227937107, 'WD800BD', 'WDC', 'N/A', 1, '80 GB', 227937, 80);
INSERT INTO discoduro VALUES (254265137, 'N/A', 'SEAGATE', 'N/A', 2, '80 GB', 254265, 80);
INSERT INTO discoduro VALUES (265984197, 'FA520N60', 'MAXTOR', 'N/A', 1, '10 GB', 265984, 10);
INSERT INTO discoduro VALUES (272312297, '91021U2', 'MAXTOR', 'N/A', 1, '10 GB', 272312, 10);
INSERT INTO discoduro VALUES (2272011104123812363, 'WD800BB-255HCO', 'WESTERN DIGITAL', 'N/A', 1, '80 GB', 22720111041238123, 80);
INSERT INTO discoduro VALUES (3062011142146515142, '000000001', 'WESTERN DIGITAL', 'N/A', 2, '500 GB', 30620111421465151, 500);
INSERT INTO discoduro VALUES (219087, 'N/A', 'ULTRA ATA', 'N/A', 1, '60 GB', 2190, 60);
INSERT INTO discoduro VALUES (4694627, 'WD5000AAKX-001CA0', 'WDC', 'N/A', 1, '465 GB', 46946, 465);
INSERT INTO discoduro VALUES (17490617, 'STM3500320AS', 'MAXTOR', 'STM3500320AS', 2, '500 GB', 174906, 500);
INSERT INTO discoduro VALUES (31242117, 'WD400BB-23DEA0', 'WDC', 'N/A', 1, '34 GB', 312421, 34);
INSERT INTO discoduro VALUES (37387527, 'ST3808110AS', 'SEAGATE', 'N/A', 2, '80 GB', 373875, 80);
INSERT INTO discoduro VALUES (43148417, ' WD-WMAM9P026202', 'WDC', 'N/A', 1, '80 GB', 431484, 80);
INSERT INTO discoduro VALUES (7279317, 'N/A', 'MAXTOR', 'N/A', 2, '500 GB', 72793, NULL);
INSERT INTO discoduro VALUES (49323417, '180GXP', 'IBM', 'N/A', 1, '60 GB', 493234, 60);
INSERT INTO discoduro VALUES (56414017, 'HD161HJ', 'SAMSUNG ', 'N/A', 2, '160 GB', 564140, 160);
INSERT INTO discoduro VALUES (59692127, 'ST340015', 'SEAGATE', 'N/A', 1, '40 GB', 596921, 40);
INSERT INTO discoduro VALUES (66110917, 'HD161HJ', 'SAMSUNG ', 'N/A', 2, '160 GB', 661109, 160);
INSERT INTO discoduro VALUES (246406377, 'WD800BB-255HCO', 'WESTERN DIGITAL', 'N/A', 2, '80 GB', 246406, 80);
INSERT INTO discoduro VALUES (6862647, 'SP0411N', 'SAMSUNG', '1', 1, '40 GB', 6862, 40);
INSERT INTO discoduro VALUES (71437517, 'ST31000524AS', 'SEAGATE', 'N/A', 1, '1 TB', 714375, 1000);


--
-- TOC entry 2234 (class 0 OID 16411)
-- Dependencies: 1718
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO documento VALUES (6, '2011-06-30 11:53:25.406787', 1, 'soporte', 6, 6, 'no abren los archivos de excel', 3, 2, '2011-07-22 08:25:32.241417', 4, 30620111421465151, 1, 'info06');
INSERT INTO documento VALUES (7, '2011-07-15 11:46:57.182847', 1, 'Robert Torres', 7, 7, 'dfgsdg', 4, 2, '2011-07-22 08:25:59.376591', 10, 30620111421465151, 1, 'info06');
INSERT INTO documento VALUES (9, '2011-07-22 09:04:03.429018', 1, 'carlos sequera', 9, 9, '', 6, 2, '2011-07-22 09:04:47.855523', 8, 30620111421465151, 1, 'info06');
INSERT INTO documento VALUES (10, '2011-07-26 08:25:04.26461', 1, 'jesus guevara', 10, 10, '', 7, 2, '2011-07-26 08:27:08.537587', 11, 27620111015507030, 1, 'INFO15');
INSERT INTO documento VALUES (8, '2011-07-22 08:45:03.644791', 1, 'usuario', 8, 8, 'esta muy lento y se queda colgado', 5, 2, '2011-07-26 13:44:33.729358', 11, 27620111015507030, 1, 'INFO15');
INSERT INTO documento VALUES (11, '2011-08-22 12:43:47.471344', 1, 'ROBERT TORRES', 11, 11, '', 8, 1, NULL, 9, 27620111015507030, 1, 'INFO15');
INSERT INTO documento VALUES (12, '2011-09-29 12:37:56.361307', 1, 'JULIAN', 12, 12, 'SE REINICIA', 9, 2, '2011-09-29 12:42:37.693157', 3, 2772011112408284, 1, 'EPI11');
INSERT INTO documento VALUES (13, '2011-10-18 08:04:30.506795', 1, 'JULIAN', 13, 13, 'WINDOWS NO ARRANCA', NULL, 0, NULL, NULL, 101484, 1, 'ADM04');
INSERT INTO documento VALUES (15, '2011-10-18 08:11:31.402354', 3, 'PROBADOR SISTEMA', 15, 15, 'WINDOWS FALLA AL ARRANCAR', 10, 2, '2011-10-18 08:27:15.220622', 12, 101484, 1, 'ADM04');
INSERT INTO documento VALUES (14, '2011-10-18 08:08:55.160639', 3, 'PROBADOR SISTEMA', 14, 14, 'WINDOWS NO ARRANCA', 11, 2, '2011-10-18 08:54:27.504598', 9, 101484, 1, 'ADM04');


--
-- TOC entry 2235 (class 0 OID 16417)
-- Dependencies: 1719
-- Data for Name: equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO equipos VALUES (27620111015507030, 'KCBC95P', 'IBM  ThinkCentre', 1, 'Robert Torres', 1, 1, 4, '', 'INFO15', '8188-KSE');
INSERT INTO equipos VALUES (30620111421465151, 'n/a', 'clone', 1, 'jorman carrero', 1, 1, 5, '', 'info06', 'be-58774');
INSERT INTO equipos VALUES (117201114243122, 'KCDL29G', 'IBM', 1, 'TAMARA', 16, 1, 6, 'lan: intel pro 100 ve, mac: 00-09-6B-44-86-2c
t.m: ibm 8188-kse', 'ADM12', 'N/A');
INSERT INTO equipos VALUES (22720111041238123, 'n/a', 'KODE', 1, 'AIDE BEAMONT', 16, 1, 7, '', 'ADM16', 'BE-53133');
INSERT INTO equipos VALUES (21750, 'N/A', 'CLONE', 1, 'MARIA RODRIGUEZ', 14, 1, 14, 'NINGUNA', 'ADM36', 'BE-58311-B');
INSERT INTO equipos VALUES (25500, 'N/A', 'DELUX', 1, 'ADM22', 14, 1, 15, 'NINGUNA', 'ADM22', 'BE-58743');
INSERT INTO equipos VALUES (36781, 'N/A', 'AUSE', 1, 'ADM19', 14, 1, 17, 'NINGUNA', 'ADM19', 'BE- 54331');
INSERT INTO equipos VALUES (48906, 'N/A', 'CLONE', 1, 'MORAIMA KEY', 11, 1, 18, 'NINGUNA', 'SALA12', 'BE-50682');
INSERT INTO equipos VALUES (67734, 'N/A', 'CLONE', 1, 'ADM32', 4, 1, 19, 'NINGUNA', 'ADM32', 'BE-58246-B');
INSERT INTO equipos VALUES (6862, 'N/A', 'CLONE', 1, 'MAURA', 16, 1, 20, 'NINGUNA', 'ADM37', 'BE-51878');
INSERT INTO equipos VALUES (87312, 'N/A', 'CLONE', 1, 'PRESI01', 23, 1, 21, 'NINGUNA', 'PRESI01', 'BE: 59150-B');
INSERT INTO equipos VALUES (99281, 'N/A', 'CLONE', 1, 'ADM34', 4, 1, 24, 'NINGUNA', 'ADM34', 'BE: 51888');
INSERT INTO equipos VALUES (101484, '8188KSE', 'IBM', 1, 'ADM04', 3, 1, 25, 'NINGUNA', 'ADM04', 'N/A');
INSERT INTO equipos VALUES (103406, 'N/A', 'DELUX', 1, 'SALA20', 2, 1, 26, 'NINGUNA', 'SALA20', 'N/A');
INSERT INTO equipos VALUES (116437, 'N/A', 'DELUX', 1, 'CARMEN', 2, 1, 28, 'NINGUNO', 'SALA20', 'BE-58774');
INSERT INTO equipos VALUES (128140, 'N/A', 'CLON', 1, 'ADM39', 17, 1, 29, 'NINGUNA', 'ADM39', 'BE-61627');
INSERT INTO equipos VALUES (94343, 'N/A', 'WRITE MASTER', 1, 'ADM11', 0, 1, 23, 'NINGUNA', 'ADM11', 'BE: 58576-8');
INSERT INTO equipos VALUES (193265, 'N/A', 'CLON', 1, 'ONCOLOGIA', 21, 1, 34, 'REQUIERE MEMORIA RAM, TIENE POCO ESPACIN EN DISCO DURO, NO POSEE UNIDAD DE CDROM', 'EPI02', '51972');
INSERT INTO equipos VALUES (2190, 'KCDL25K', 'IBM', 1, ' JANIC TORRE', 21, 1, 46, 'OPTIMO', 'EPI09', 'N/A');
INSERT INTO equipos VALUES (227937, 'N/A', 'N/A', 1, 'LORENA GUEVARA', 21, 1, 47, 'NINGUNA', 'EPI16', '56320-A');
INSERT INTO equipos VALUES (246406, 'N/A', 'SONIC', 1, 'LILIAN DELGADO', 21, 1, 48, 'NINGUNA', 'EPI04', '56319-A');
INSERT INTO equipos VALUES (254265, 'MXJ702077T', 'HP', 1, 'MIGDALIA SEIJAS', 21, 1, 49, 'NINGUNA', 'EPI18', '3575276');
INSERT INTO equipos VALUES (272312, '2019471602126', 'OLIVETTI', 1, 'MAIRELIS ASCANIO', 21, 1, 51, 'NINGUNA', 'EPI11', '02973427');
INSERT INTO equipos VALUES (291921, 'KCDL32G', 'IBM', 1, 'YENI LISARAZO', 21, 1, 54, 'NINGUNA', 'EPI06', 'N/A');
INSERT INTO equipos VALUES (282640, 'KDG21Y', 'IBM', 1, 'DR. RAMON RIVAS', 0, 1, 53, 'NINGUNA', 'EPI05', 'N/A');
INSERT INTO equipos VALUES (300453, 'N/A', 'HP', 1, 'CARLOS VELES', 0, 1, 55, 'NINGUNA', 'EPI13', '3575226');
INSERT INTO equipos VALUES (310187, 'MXJ702076G', 'HP', 1, 'CARLOS VELES', 21, 1, 56, 'NINGUNA', 'EPI13', '3575266');
INSERT INTO equipos VALUES (316593, 'N/A', 'XPX', 1, 'NOREXIS ACOSTA', 21, 1, 58, 'NINGUNA', 'EPI14', 'N/A');
INSERT INTO equipos VALUES (325131, 'N/A', 'CLON', 1, 'DR MIGUEL TERAN', 21, 1, 59, 'NINGUNA', 'EPI03', '58668-B');
INSERT INTO equipos VALUES (329156, 'N/A', 'CLONE', 1, 'MARTA FERRERO', 21, 1, 60, 'LE FALTA UNIDAD DE CD', 'EPI08', 'N/A');
INSERT INTO equipos VALUES (33662, 'N/A', 'CLONE', 1, 'PATRICIA AMUNDARAY', 21, 1, 61, 'NINGUNA', 'EPI15', '51872');
INSERT INTO equipos VALUES (344937, 'PX301A70560068', 'XPX', 1, 'CARLA TORTOLEDO', 12, 1, 62, 'LE FALTA UNIDAD DE CD', 'CONTRA06', '57398');
INSERT INTO equipos VALUES (35831, 'AI06151LC00859', 'AUSE', 1, 'MIRIAM LA CRUZ', 21, 1, 64, 'NINGUNA', 'EPI12', '54341-B');
INSERT INTO equipos VALUES (357375, '0747953605', 'AUSE', 1, 'JOSE ANGEL', 0, 1, 63, 'NINGUNA', 'EPI10', '55188');
INSERT INTO equipos VALUES (366531, '0747953605', 'AUSE', 1, 'JOSE ANGEL', 21, 1, 65, 'NINGUNA', 'EPI10', '55188');
INSERT INTO equipos VALUES (379265, 'KCDG214', 'IBM', 1, 'DR. RAMON RIVAS', 21, 1, 66, 'NINGUNA', 'EPI05', 'N/A');
INSERT INTO equipos VALUES (373875, 'MXJ7020777', 'HP', 1, 'DR. ERNESTO FLORES', 21, 1, 67, 'NINGUNA', 'EPI17', ' 3575271');
INSERT INTO equipos VALUES (386687, 'ARTI/115', 'OLIVETTI', 1, 'ALICIA HERNANDEZ', 21, 1, 68, 'NINGUNA', 'EPI20', '02972919');
INSERT INTO equipos VALUES (399156, 'N/A', 'SONY', 1, 'MARIA ZAMBRANO', 21, 1, 69, 'NINGUNA', 'EPI19', 'C0102');
INSERT INTO equipos VALUES (4080, '916170', 'HP', 1, 'ALFREDO MUSURUARAR', 12, 1, 70, 'NINGUNA', 'CONTRA01', '3419.864');
INSERT INTO equipos VALUES (416234, 'N/A', 'HP', 1, 'HIGIENE', 12, 1, 71, 'NINGUNA', 'CONTRA09', '3650888');
INSERT INTO equipos VALUES (401796, 'MXL1232P8K', 'HP', 1, 'INGENIERIA SANITARIA', 12, 1, 72, 'NINGUNA', 'CONTRA05', '61635');
INSERT INTO equipos VALUES (431484, 'N/A', 'CLON', 1, 'JACKELINE PEREZ', 12, 1, 74, 'NINGUNA', 'CONTRA16', '60463');
INSERT INTO equipos VALUES (448765, 'MXJ91003B3', 'HP', 1, 'SECRETARIA CONTRALORIA SANITARIA', 12, 1, 75, 'NINGUNA', 'CONTRA08', '3650890');
INSERT INTO equipos VALUES (449218, 'N/A', 'KODE', 1, 'YAMILA DAGGELT', 0, 1, 76, 'NINGUNA', 'CONTRA07', '53186');
INSERT INTO equipos VALUES (458390, 'N/A', 'KODE', 1, 'YAMILA DAGGELT', 12, 1, 77, 'INFORMACION INCLOMPLETA', 'CONTRA07', '53186');
INSERT INTO equipos VALUES (459546, 'N/A', 'KODE', 1, 'DROGAS Y COSMETICOS', 12, 1, 78, 'NINGUNA', 'CONTRA02', '53182');
INSERT INTO equipos VALUES (46946, ' N/A            ', 'SENTEY', 1, 'SACS', 12, 1, 79, 'NINGUNA', 'CONTRA10', '  N/A ');
INSERT INTO equipos VALUES (470703, 'MXJ910039L', 'HP', 1, 'SACS', 12, 1, 80, 'NINGUNA', 'CONTRA11', '3650881');
INSERT INTO equipos VALUES (485421, '6Y2A-KN8Z-TO7J', 'COMPAQ', 1, 'FRANKLIN RIVERO', 12, 1, 81, 'NINGUNA', 'CONTRA12', '61335-B');
INSERT INTO equipos VALUES (48646, 'AI06151LC00920', 'AUSE', 1, 'VIRGINIA DUQUE', 0, 1, 82, 'NINGUNO', 'CONTRA13', '54334B');
INSERT INTO equipos VALUES (493234, 'KCDL30W', 'IBM', 1, 'SUPERVISORES AUDITORIA', 12, 1, 83, 'NINGUNA', 'CONTRA15', 'N/A');
INSERT INTO equipos VALUES (506796, 'AI06151LC00920', 'AUSE', 1, 'VIRGINIA DUQUE', 0, 1, 84, 'NINGUNA', 'CONTRA13', '54344C');
INSERT INTO equipos VALUES (174906, '45454', 'CLONE', 1, 'ADM11', 0, 1, 33, 'EXCELLENTES CONDICIONES', 'ADM11', 'N/A');
INSERT INTO equipos VALUES (13187, 'N/A', 'CLONE', 1, 'ADM07', 14, 1, 13, 'NINGUNA', 'ADM07', 'BE-51884');
INSERT INTO equipos VALUES (28218, 'N/A', 'KODE', 1, 'ADM09', 14, 1, 16, 'NINGUNA', 'ADM09', 'BE-53172');
INSERT INTO equipos VALUES (5220, 'AI06151LC00920', 'AUSE', 1, 'VIRGINIA DUQUE', 12, 1, 86, 'NINGUNA', 'CONTRA13', '54334-B');
INSERT INTO equipos VALUES (535406, 'N/A', 'AUSE', 1, 'SNELL ESPINOZA', 12, 1, 87, 'NINGUNA', 'CONTRA19', '58312-B');
INSERT INTO equipos VALUES (536875, 'N/A', 'SONIC', 1, 'LIC ALBA AVILA', 12, 1, 88, 'NINGUNA', 'CONTRA20', '56256-B');
INSERT INTO equipos VALUES (108593, 'N/A', 'AUSE', 1, 'LOREANA', 4, 1, 27, 'NINGUNA', 'ADM30', 'BE-58247-B');
INSERT INTO equipos VALUES (547640, 'N/A', 'KODE', 1, 'HELEN TOVAR', 18, 1, 89, 'NINGUNA', 'DGS01', '53226');
INSERT INTO equipos VALUES (554562, 'F932 CVN21464', 'COMPAQ', 1, 'MEDICINA VIAL Y ESTADISTICA', 18, 1, 90, 'NINGUNA', 'DGS04', 'N/A');
INSERT INTO equipos VALUES (564140, 'IAS7169LCO1104', 'AUSE', 1, 'LUZ MIRIAM', 18, 1, 91, 'NINGUNA', 'DGS02', '55923-A');
INSERT INTO equipos VALUES (574437, 'N/A', 'SIRAGON', 1, 'ING. CARELIS LUGO', 18, 1, 92, 'NINGUNA', 'DGS03', 'N/A');
INSERT INTO equipos VALUES (568921, 'N/A', 'AUSE', 1, 'DR CARLOS VIVAS', 18, 1, 93, 'NINGUNA', 'DGS08', '55095-B');
INSERT INTO equipos VALUES (566656, 'N/A', 'CLONE', 1, 'FELIX BERMUDEZ', 18, 1, 94, 'NINGUNA', 'DGS06', '58669-B');
INSERT INTO equipos VALUES (588375, 'N/A', 'CLONE', 1, 'GERMAN SANTOS', 18, 1, 95, 'NINGUNA', 'DGS05', 'N/A');
INSERT INTO equipos VALUES (596921, 'N/A', 'CLONE', 1, ' ZORAIDA GONZALEZ', 18, 1, 96, 'NO TIENE UNIDAD DE CD-ROM', 'DGS07', 'N/A');
INSERT INTO equipos VALUES (592718, 'F933CVN21908', 'COMPAQ', 1, 'ROGELIO HERNANDEZ', 18, 1, 97, 'NINGUNA', 'DGS11', '008811');
INSERT INTO equipos VALUES (618953, 'N/A', 'KODE ', 1, 'RODRIGUEZ ALEXIS', 18, 1, 98, 'NINGUNA', 'DGS13', '53211');
INSERT INTO equipos VALUES (626250, 'F930CVN21939', 'COMPAQ', 1, 'GESTION DE SERVICIOS', 18, 1, 99, 'LE FALTA UNIDAD DE CDROM', 'DGS09', '005733');
INSERT INTO equipos VALUES (634859, 'N/A', 'OMEGA', 1, 'CAROLINA', 18, 1, 100, 'NINGUNA', 'DGS10', '58302-B');
INSERT INTO equipos VALUES (641796, 'N/A', 'AUSE', 1, 'LIC. LEIDY OJEDA', 18, 1, 101, 'NINGUNA', 'DGS14', '55087-B');
INSERT INTO equipos VALUES (656421, 'N/A', 'CLONE', 1, 'DIRECCION DE SALUD', 0, 1, 103, 'NINGUNA', 'DGS12', '58667-B');
INSERT INTO equipos VALUES (658468, 'N/A', 'CLONE', 1, 'DIRECCION DE SALUD', 18, 1, 104, 'NINGUNA', 'DGS12', '58667-B');
INSERT INTO equipos VALUES (661109, 'N/A', 'CLONE', 1, 'ZARA SIRA', 9, 1, 105, 'NINGUNA', 'ELECT01', 'N/A');
INSERT INTO equipos VALUES (664390, '0747953605', 'AUSE', 1, 'JUDITH ACASIO', 10, 1, 106, 'SIN OBSERVACION', 'TRAN02', '55047-B');
INSERT INTO equipos VALUES (675406, '07479536050', 'AUSE', 1, 'CUARTO FRIO', 9, 1, 107, 'NINGUNA', 'CUARTO01', '55189');
INSERT INTO equipos VALUES (678937, 'N/A', 'CLON', 1, 'HENNYER MIJARES', 17, 1, 108, 'N/A', 'ADM01', '58307-B');
INSERT INTO equipos VALUES (698515, 'N/A', 'CLON', 1, 'MARISOL JIMENEZ', 17, 1, 109, 'NINGUNO', 'ADM03', 'N/A');
INSERT INTO equipos VALUES (702187, '61709', 'OMEGA', 1, 'CHEILA KARIPA', 3, 1, 110, 'ÑKLJ', 'ADM07', '61709');
INSERT INTO equipos VALUES (714375, '61721', 'OMEGA', 1, 'ADM09', 3, 1, 111, 'NO', 'ADM09', '61721');
INSERT INTO equipos VALUES (72193, '61713', 'OMEGA', 1, 'ADM10', 3, 1, 112, 'NO', 'ADM10', '61713');
INSERT INTO equipos VALUES (72793, '58576-B', 'CLONE', 1, 'ADM11', 3, 1, 113, 'NO', 'ADM11', '58576-B');


--
-- TOC entry 2236 (class 0 OID 16423)
-- Dependencies: 1720
-- Data for Name: estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estatus VALUES (0, 'Pendiente');
INSERT INTO estatus VALUES (1, 'En Revision');
INSERT INTO estatus VALUES (2, 'Reparado/Culminado');
INSERT INTO estatus VALUES (3, 'Anulada');
INSERT INTO estatus VALUES (5, 'Activa');
INSERT INTO estatus VALUES (6, 'Inactiva');


--
-- TOC entry 2237 (class 0 OID 16426)
-- Dependencies: 1721
-- Data for Name: fsoporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO fsoporte VALUES (3, 'todo bien', 'NADA', 'todo bien', '');
INSERT INTO fsoporte VALUES (4, 'el usuario no sabe trabajar', 'BOTAR AL EMPLEADO', '', '');
INSERT INTO fsoporte VALUES (6, 'nnnn', 'nn', 'nnn', 'nn');
INSERT INTO fsoporte VALUES (7, 'fuente de podeer', 'cambio de fuente de poder', 'no hay', 'se la quitamos a otra maquina');
INSERT INTO fsoporte VALUES (5, 'ninguna', 'ninguna', 'ninguna', 'ninguna');
INSERT INTO fsoporte VALUES (8, 'PROBLEMAS AL ARRANCAR EL SISTEMA OPERATIVO', NULL, '', NULL);
INSERT INTO fsoporte VALUES (9, 'PROBLEMAS AL ARRANQUE WINDOWS XP', 'INSTALACION WIN XP', '', '');
INSERT INTO fsoporte VALUES (10, 'SE REINICIA EL S.O.', 'SE FORMATEO E INSTALO TODO LO NECESARIO', 'REQUIERE CUCHILLO', '');
INSERT INTO fsoporte VALUES (11, 'NO DA VIDEO', 'CAMBIO TARJETA VIDEO', '', '');


--
-- TOC entry 2238 (class 0 OID 16432)
-- Dependencies: 1722
-- Data for Name: hardequip; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2239 (class 0 OID 16435)
-- Dependencies: 1723
-- Data for Name: hardware; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO hardware VALUES (6, 1, 0, 0, 0, 0, 0, 0, 0, 'se queda colgado ', 0);
INSERT INTO hardware VALUES (7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);
INSERT INTO hardware VALUES (8, 1, 0, 0, 0, 0, 0, 0, 0, 'no lee los cd', 0);
INSERT INTO hardware VALUES (9, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);
INSERT INTO hardware VALUES (10, 1, 0, 0, 0, 0, 0, 0, 0, 'no enciende', 0);
INSERT INTO hardware VALUES (11, 1, 0, 0, 0, 0, 0, 0, 0, 'yutyut', 0);
INSERT INTO hardware VALUES (12, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);
INSERT INTO hardware VALUES (13, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);
INSERT INTO hardware VALUES (14, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);
INSERT INTO hardware VALUES (15, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);


--
-- TOC entry 2240 (class 0 OID 16438)
-- Dependencies: 1724
-- Data for Name: impresoras; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO impresoras VALUES (5115, 'HP DESKJET', 'D2400 SERIES', 'N/A', 51, 'MORAIMA KEY', 11, 1, 'N/A', 'NINGUNA', 5, 'SALA12');
INSERT INTO impresoras VALUES (27546, 'EPSON', 'LX-300+', 'N/A', 45, 'ADM22', 14, 1, 'N/A', 'NINGUNA', 5, 'ADM22');
INSERT INTO impresoras VALUES (46734, 'EPSON', 'LX-300+', 'N/A', 45, 'ADM19', 14, 1, 'N/A', 'NINGUNA', 5, 'ADM19');
INSERT INTO impresoras VALUES (16437, 'HP', 'DESKJET 710C', 'N/A', 51, 'ADM07', 3, 1, 'N/A', 'NINGUNA', 5, 'ADM07');
INSERT INTO impresoras VALUES (2315, 'HP', 'DESKJET P2Y60', 'N/A', 51, 'MARIA RODRIGUEZ', 14, 1, 'N/A', 'NINGUNA', 5, 'ADM36');
INSERT INTO impresoras VALUES (113406, 'HP  DESKJET1020', 'DESKJET1020', 'CNBKR4889', 51, 'LORENA', 4, 1, 'N/A', 'CONECTADA AL EQUIPO', 5, 'ADM30');
INSERT INTO impresoras VALUES (204250, 'HP', 'DESKJET 845C', 'TH1B11B0KD', 51, 'DR MIGUEL TERAN', 21, 1, '51824', 'BIEN', 5, 'EPI03');
INSERT INTO impresoras VALUES (21762, 'HP', ' DESJD1460', 'CN79P3M2P7', 51, 'ONCOLOGIA', 0, 1, '56145', 'BIEN', 5, 'EPI02');
INSERT INTO impresoras VALUES (250484, 'HP', 'DESKJET 3940', 'CN5BA1J05G', 51, 'LILIAN DELGADO', 21, 1, '53243', 'NINGUNA', 5, 'EPI04');
INSERT INTO impresoras VALUES (256109, 'HP', 'DESJD1460', 'CN79P3M2P7', 51, 'ONCOLOGIA', 0, 1, '56145', 'NINGUNA', 5, 'EPI02');
INSERT INTO impresoras VALUES (322593, 'HP', 'DESKJET 840C', 'MX09P1W10K', 51, 'NOREXIS ACOSTA', 21, 1, 'N/A', 'DONADA', 5, 'EPI14');
INSERT INTO impresoras VALUES (333156, 'HP', 'DESJ D1460', 'TH81P3198X', 51, 'MARTA FERRERO', 21, 1, '56324', 'NINGUNA', 5, 'EPI08');
INSERT INTO impresoras VALUES (34093, 'HP', 'DESKJET 840C', 'MX11U1Z2FX', 51, 'PATRICIA AMUNDARAY', 21, 1, 'N/A', 'NINGUNA', 5, 'EPI15');
INSERT INTO impresoras VALUES (348906, 'HP', 'DESJET845', 'CN16K1M0RG', 51, 'CARLA TORTOLEDO', 12, 1, '50943', 'NINGUNA', 5, 'CONTRA06');
INSERT INTO impresoras VALUES (412546, 'HP ', 'OFFICEJET 5510', 'MY454F10SY', 51, 'ALFREDO MUSURUARAR', 12, 1, '3.419.866', 'NINGUNA', 5, 'CONTRA01');
INSERT INTO impresoras VALUES (445218, 'HP', 'DESKJET 845C', 'CN163131Q1DH', 51, 'JACKELINE PEREZ', 12, 1, '51157', 'NINGUNA', 5, 'CONTRA16');
INSERT INTO impresoras VALUES (454328, 'HP', 'DESKJET 845C', 'TH1BM1B0RG', 51, 'SECRETARIA CONTRALORIA SANITARIA', 12, 1, '50945', 'NINGUNA', 5, 'CONTRA08');
INSERT INTO impresoras VALUES (475468, 'HP', 'DESJET 2000', 'CN09H14Q2R ', 51, 'SACS', 12, 1, 'N/A', 'NINGUNA', 5, 'CONTRA10');
INSERT INTO impresoras VALUES (527906, 'HP', 'DESKJET D2460', 'TH83Q524MJ', 51, 'SNELL ESPINOZA', 12, 1, '58363', 'NINGUNA', 5, 'CONTRA19');
INSERT INTO impresoras VALUES (542265, 'HP', 'DESKJET840C', 'MX0631W0HX', 51, 'LIC ALBA AVILA', 12, 1, '40603', 'NINGUNA', 5, 'CONTRA20');
INSERT INTO impresoras VALUES (589984, 'HP', 'DESKJET D2460', 'TH83Q524VX', 51, 'DR CARLOS VIVAS', 18, 1, '58351', 'NINGUNA', 5, 'DGS08');
INSERT INTO impresoras VALUES (638390, 'HP', 'DESKJET F4480', 'CN9B9CK42Z', 51, 'CAROLINA', 18, 1, 'N/A', 'DAÑADA', 5, 'DGS10');
INSERT INTO impresoras VALUES (645828, 'HP', 'DESKJET D2460', 'N/A', 51, 'LIC. LEIDY OJEDA', 18, 1, '58350', 'IMPRESORA PRESTADA', 5, 'DGS14');
INSERT INTO impresoras VALUES (668734, 'HP', 'DESKJET 720C', 'N/A', 51, 'JUDITH ACASIO', 10, 1, '30223', 'NINGUNA', 5, 'TRAN02');
INSERT INTO impresoras VALUES (2993, 'XEROX', 'DHASER 3117', 'N/A', 49, 'NEYDA', 3, 1, 'N/A', 'NINGUNA', 5, 'AMD09');
INSERT INTO impresoras VALUES (91265, 'HP', 'LASER JET 3600', 'CNWHH02019', 49, 'PRESI01', 23, 1, 'BE: 58744', 'NINGUNA', 5, 'PRESI01');
INSERT INTO impresoras VALUES (98890, 'HP', 'LASER JET 1005', 'N/A', 49, 'AMD11', 3, 1, 'N/A', 'NINGUNA', 5, 'AMD11');
INSERT INTO impresoras VALUES (176453, 'HP', 'PHOTOSMART C4600', 'N/A', 49, 'ADM11', 3, 1, 'N/A', 'NINGUNA', 5, 'ADM11');
INSERT INTO impresoras VALUES (229640, 'HP', 'LASER JET P2015', 'CNB1R12339', 49, 'JANIC TORRE', 21, 1, '3644475', 'BIEN', 5, 'EPI09');
INSERT INTO impresoras VALUES (261953, 'HP', 'LASER JET P2015', 'CNB2519710', 49, 'MIGDALIA SEIJAS', 21, 1, '3595065 ', 'NINGUNA', 5, 'EPI18');
INSERT INTO impresoras VALUES (297859, 'HP', '3820', 'CN27E1PORM', 49, 'YENI LISARAZO', 21, 1, 'N/A', 'NINGUNA', 5, 'EPI06');
INSERT INTO impresoras VALUES (304750, 'HP', 'LASERJET 4350', 'CNRXH56333', 49, 'CARLOS VELES', 21, 1, '3595066', 'NINGUNA', 5, 'EPI13');
INSERT INTO impresoras VALUES (365906, 'N/A', 'N/A', 'N/A', 49, 'MIRIAM LA CRUZ', 21, 1, 'N/A', 'SIN IMPRESORA', 5, 'EPI12');
INSERT INTO impresoras VALUES (405843, 'EPSON', 'P170B', 'G8DY480916', 49, 'MARIA ZAMBRANO', 21, 1, '61161', 'NINGUNA', 5, 'EPI19');
INSERT INTO impresoras VALUES (586718, 'HP', 'LASERJET 1022', 'N/A', 49, 'FELIX BERMUDEZ', 18, 1, '57156', 'NINGUNA', 5, 'DGS06');
INSERT INTO impresoras VALUES (551343, 'HP', 'LASERJET P2015', 'CNB1P31924', 49, 'HELEN TOVAR', 18, 1, '58375', 'NINGUNA', 5, 'DGS01');
INSERT INTO impresoras VALUES (653890, 'HP', 'HPLASERJET P1102W', 'VNB4F05711', 49, 'DIRECCION DE SALUD', 18, 1, 'N/A', 'NINGUNA', 5, 'DGS12');
INSERT INTO impresoras VALUES (582468, 'HP', 'P1102W', 'VNB3M81710', 49, 'ING. CARELIS LUGO', 18, 1, 'N/A', 'NINGUNA', 5, 'DGS03');
INSERT INTO impresoras VALUES (463468, 'HP', 'C5870A', 'US7BE1P05Q', 49, 'YAMILA DAGGELT', 12, 1, '18483', 'NINGUNA', 5, 'CONTRA07');
INSERT INTO impresoras VALUES (269640, 'N/A', 'N/A', 'N/A', 49, 'MAIRELIS ASCANIO', 0, 1, 'N/A', 'NINGUNA', 5, 'EPI11');
INSERT INTO impresoras VALUES (369406, 'N/A', 'N/A', 'N/A', 49, 'LORENA GUEVARA', 21, 1, 'N/A', 'NINGUNA', 5, 'EPI16');
INSERT INTO impresoras VALUES (375437, 'N/A', 'N/A', 'N/A', 49, 'JOSE ANGEL', 21, 1, 'N/A', 'NINGUNA', 5, 'EPI10');
INSERT INTO impresoras VALUES (383187, 'N/A', 'N/A', 'N/A', 49, 'DR. RAMON RIVAS', 21, 1, 'N/A', 'NINGUNA', 5, 'EPI05');
INSERT INTO impresoras VALUES (390656, 'N/A', 'N/A', 'N/A', 49, 'DR. ERNESTO FLORES', 21, 1, 'N/A', 'NINGUNA', 5, 'EPI17');
INSERT INTO impresoras VALUES (396578, 'N/A', 'N/A', 'N/A', 49, 'ALICIA HERNANDEZ', 21, 1, 'N/A', 'NINGUNA', 5, 'EPI20');
INSERT INTO impresoras VALUES (423656, 'N/A', 'N/A', 'N/A', 49, 'HIGIENE', 12, 1, 'N/A', 'NINGUNA', 5, 'CONTRA09');
INSERT INTO impresoras VALUES (428421, 'N/A', 'N/A', 'N/A', 49, 'INGENIERIA SANITARIA', 12, 1, 'N/A', 'NO POSEE IMPRESORA', 5, 'CONTRA05');
INSERT INTO impresoras VALUES (480875, 'N/A', 'N/A', 'N/A', 49, 'SACS', 12, 1, 'N/A', 'NINGUNA', 5, 'CONTRA11');
INSERT INTO impresoras VALUES (490906, 'N/A', 'N/A', 'N/A', 49, 'FRANKLIN RIVERO', 12, 1, 'N/A', 'NINGUNA', 5, 'CONTRA12');
INSERT INTO impresoras VALUES (50931, 'N/A', 'N/A', 'N/A', 49, 'SUPERVISORES AUDITORIA', 12, 1, 'N/A', 'NO TIENE IMPRESORA', 5, 'CONTRA15');
INSERT INTO impresoras VALUES (5320, 'N/A', 'N/A', 'N/A', 49, 'VIRGINIA DUQUE', 12, 1, 'N/A', 'NINGUNA', 5, 'CONTRA13');
INSERT INTO impresoras VALUES (561828, 'N/A', 'N/A', 'N/A', 49, 'MEDICINA VIAL Y ESTADISTICA', 18, 1, 'N/A', 'NO TIENE IMPRESORA', 5, 'DGS04');
INSERT INTO impresoras VALUES (57193, 'N/A', 'N/A', 'N/A', 49, 'LUZ MIRIAM', 18, 1, 'N/A', 'NINGUNA', 5, 'DGS02');
INSERT INTO impresoras VALUES (603921, 'N/A', 'N/A', 'N/A', 49, 'GERMAN SANTOS', 18, 1, 'N/A', 'NINGUNA', 5, 'DGS05');
INSERT INTO impresoras VALUES (610890, 'N/A', 'N/A', 'N/A', 49, 'ZORAIDA GONZALEZ', 18, 1, 'N/A', 'IMPRESORA CONECTADA POR RED', 5, 'DGS07');
INSERT INTO impresoras VALUES (615640, 'N/A', 'N/A', 'N/A', 49, 'ROGELIO HERNANDEZ', 18, 1, 'N/A', 'IMPRESORA EN RED CON LA DGS01', 5, 'DGS11');
INSERT INTO impresoras VALUES (623453, 'N/A', 'N/A', 'N/A', 49, 'RODRIGUEZ ALEXIS', 18, 1, 'N/A', 'IMPRESORA CONECTADA POR RED', 5, 'DGS13');
INSERT INTO impresoras VALUES (630625, 'N/A', 'N/A', 'N/A', 49, 'GESTION DE SERVICIOS', 18, 1, 'N/A', 'IMPRESORA POR RED', 5, 'DGS09');
INSERT INTO impresoras VALUES (682765, 'EPSON', 'FX-2180', 'FCTY080133', 45, 'CUARTO FRIO', 0, 1, '54812', 'NINGUNA', 5, 'CUARTO01');
INSERT INTO impresoras VALUES (692812, 'EPSON', 'LX-300', 'N/A', 45, 'MARISOL JIMENEZ', 17, 1, 'N/A', 'NINGUNO', 5, 'ADM03');
INSERT INTO impresoras VALUES (693171, 'EPSON', 'FX-2190', 'FCTY069216', 45, 'MARISOL JIMENEZ', 17, 1, '54964', 'NINGUNO', 5, 'ADM03');
INSERT INTO impresoras VALUES (22720111058336714, 'EPSON', 'FX-1180', 'A2SY009382', 45, 'AIDE BEAMONT', 16, 1, 'N/A', '', 5, 'ADM16');
INSERT INTO impresoras VALUES (467125, 'HP', 'LASER JET 1020', 'CNBK761776', 49, 'DROGAS Y COSMETICOS', 12, 1, '53180', 'NINGUNA', 5, 'CONTRA02');
INSERT INTO impresoras VALUES (71215, 'XEROX', 'PHASER 3117', 'L92372412', 49, 'ADM09', 3, 1, '58579', 'NO', 5, 'ADM09');


--
-- TOC entry 2241 (class 0 OID 16444)
-- Dependencies: 1725
-- Data for Name: lan; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO lan VALUES (11720111424312255, 'INTEL', 'PRO 100-VE', 'N/A', '00-09-6B-44-86-2C', 34, 117201114243122);
INSERT INTO lan VALUES (574437414, 'REALTEK', 'N/A', 'N/A', 'D0-27-88-1D-9B-E7', 34, 574437);
INSERT INTO lan VALUES (568921414, 'VIA', 'N/A', 'N/A', '00-19-21-36-87-A4', 34, 568921);
INSERT INTO lan VALUES (277201111240828496, 'DLINK', 'PCI', 'DFE-530TX', '00-50-BA-2E-44-DB', 34, 2772011112408284);
INSERT INTO lan VALUES (2272011104123812366, 'VIA ', 'PCI FAST ETHERNET', 'N/A', '00-14-2A-FC-02-C1', 34, 22720111041238123);
INSERT INTO lan VALUES (2762011101550703037, 'Integrada', 'Integrada', 'Integrada', '00:09:6B:6F:D4:EA', 38, 27620111015507030);
INSERT INTO lan VALUES (3062011142146515145, 'INTEGRADA', 'INTEGRADA', 'N/A', '', 38, 30620111421465151);
INSERT INTO lan VALUES (13187514, 'INTEGRADA', 'N/A', 'N/A', 'N/A', 38, 13187);
INSERT INTO lan VALUES (217501514, 'INTEGRADA', 'N/A', 'N/A', 'N/A', 38, 21750);
INSERT INTO lan VALUES (255002314, 'INTEGRADA', 'N/A', 'N/A', 'N/A', 38, 25500);
INSERT INTO lan VALUES (282183114, 'INTEGRADA', 'N/A', 'N/A', '00-14-2A-FB-1D-C5', 38, 28218);
INSERT INTO lan VALUES (367813914, 'INTEGRADA', 'N/A', 'N/A', 'N/A', 38, 36781);
INSERT INTO lan VALUES (489064814, 'D-LINK', 'N/A', 'N/A', '00-50-BA-2D-3A-89', 38, 48906);
INSERT INTO lan VALUES (677345814, 'INTEGRADA', '1', 'N/A', 'N/A', 38, 67734);
INSERT INTO lan VALUES (68626814, 'ETHERNET FAST PCI', 'N/A', 'N/A', '000AE6AD4B49', 34, 6862);
INSERT INTO lan VALUES (873129014, 'N/A', 'N/A', 'N/A', 'N/A', 38, 87312);
INSERT INTO lan VALUES (936879514, 'N/A', 'N/A', 'N/A', 'N/A', 38, 93687);
INSERT INTO lan VALUES (94343414, 'N/A', 'N/A', 'N/A', 'N/A', 38, 94343);
INSERT INTO lan VALUES (992811214, 'N/A', 'N/A', 'N/A', 'N/A', 38, 99281);
INSERT INTO lan VALUES (1014842114, 'N/A', '1', 'NA', 'N/A', 38, 101484);
INSERT INTO lan VALUES (1034062914, 'N/A', '1', 'N/A', 'N/A', 38, 103406);
INSERT INTO lan VALUES (1085934614, 'N/A', '1', 'N/A', 'N/A', 38, 108593);
INSERT INTO lan VALUES (1164375414, 'N/A', 'N/A', 'N/A', 'N/A', 38, 116437);
INSERT INTO lan VALUES (1281406214, 'N/A', '1', 'N/A', 'N/A', 38, 128140);
INSERT INTO lan VALUES (174906314, 'REALTEK RTL8168/8111', 'N/A', 'N/A', '00-1C-C0-74-64-0D', 38, 174906);
INSERT INTO lan VALUES (1932651014, 'REALTEK', 'FAMILIA RTL8139', 'N/A', '00-0C-76-49-DA-94', 34, 193265);
INSERT INTO lan VALUES (190312714, 'INTEL', 'N/A', 'N/A', '00-0D-60-23-3A-00', 34, 19031);
INSERT INTO lan VALUES (21901314, 'INTEL PRO/100', 'N/A', 'N/A', '00-09-6B-44-87-58', 34, 2190);
INSERT INTO lan VALUES (227937414, 'ELITE', 'N/A', 'N/A', ' 00-1B-B9-CA-85-8A', 38, 227937);
INSERT INTO lan VALUES (2464064014, 'VIA', 'N/A', 'N/A', '00-1B-B9-CA-B4-74', 34, 246406);
INSERT INTO lan VALUES (254265514, 'INTEL', 'N/A', '82566DM', '00-0F-FE-70-18-30', 34, 254265);
INSERT INTO lan VALUES (2659842214, 'D-LINK', 'N/A', 'N/A', '00-50-BA-2E-44-DB', 34, 265984);
INSERT INTO lan VALUES (2723123214, 'D-LINK', 'N/A', 'N/A', '00-50-BA-2E-44-DB', 34, 272312);
INSERT INTO lan VALUES (282640414, 'INTEL', 'N/A', 'N/A', '00-0D-60-23-3A-00', 34, 282640);
INSERT INTO lan VALUES (291921514, 'INTEL', 'N/A', 'N/A', '00-09-6B-44-84-59', 34, 291921);
INSERT INTO lan VALUES (300453514, 'INTEL', 'N/A', '82566DM', '00-0F-FE-70-49-00', 34, 300453);
INSERT INTO lan VALUES (310187514, 'INTEL', 'N/A', '82566DM', '00-0F-FE-70-49-00', 34, 310187);
INSERT INTO lan VALUES (312421414, 'INTEL', 'N/A', 'N/A', '00-0D-60-23-3A-00', 34, 312421);
INSERT INTO lan VALUES (316593314, 'REALTEK', 'N/A', 'RTL8139 ', '00-05-1D-EF-C7-5F', 34, 316593);
INSERT INTO lan VALUES (325131414, 'REALTEK', 'N/A', 'RTL8139', '00-21-97-D0-B5-7C', 34, 325131);
INSERT INTO lan VALUES (329156514, 'REALTEK', 'N/A', 'RTL8201', '00-0A-E6-D9-46-1B', 34, 329156);
INSERT INTO lan VALUES (33662514, 'MICROSOFT', 'N/A', 'N/A', '00-0A-E6-AD-68-73', 34, 33662);
INSERT INTO lan VALUES (344937614, 'REALTEK', 'N/A', 'RTL8201', '00-0A-E6-DB-B6-29', 34, 344937);
INSERT INTO lan VALUES (357375414, 'VIA', 'N/A', 'N/A', '00-19-21-36-86-E2', 34, 357375);
INSERT INTO lan VALUES (35831414, 'REALTEK', 'N/A', 'RTL8139', ' 00-13-8F-C2-93-31', 34, 35831);
INSERT INTO lan VALUES (366531414, 'VIA', 'N/A', 'N/A', '00-19-21-36-86-E2', 34, 366531);
INSERT INTO lan VALUES (379265414, 'INTEL', 'N/A', 'N/A', '00-0D-60-23-3A-00', 34, 379265);
INSERT INTO lan VALUES (373875514, 'INTEL', 'N/A', 'N/A', '00-0F-FE-70-49-14', 34, 373875);
INSERT INTO lan VALUES (386687614, 'SIS', 'N/A', 'N/A', '00-01-6C-B0-B1-66', 34, 386687);
INSERT INTO lan VALUES (399156414, 'SIS', 'N/A', 'N/A', '00-01-6C-AE-90-44', 34, 399156);
INSERT INTO lan VALUES (4080414, 'BROADCOM', 'N/A', 'N/A', '00-02-E3-4C-49-69', 34, 4080);
INSERT INTO lan VALUES (416234414, 'INTEL', 'N/A', '82567LM-3', '00-23-7D-49-C4-FC', 34, 416234);
INSERT INTO lan VALUES (401796514, 'REALTEK', 'N/A', 'RTL8102E/RTL8103E', '78-AC-C0-B6-D4-C0', 34, 401796);
INSERT INTO lan VALUES (433593414, 'VIA', 'N/A', 'N/A', '00-14-2A-FC-93-AE', 34, 433593);
INSERT INTO lan VALUES (431484414, 'VIA', 'N/A', 'VT6102', '00-13-8F-71-32-03', 34, 431484);
INSERT INTO lan VALUES (448765414, 'INTEL', 'N/A', '82567LM-3 ', '00-23-7D-48-8D-1F', 34, 448765);
INSERT INTO lan VALUES (449218414, 'VIA', 'N/A', 'N/A', 'N/A', 34, 449218);
INSERT INTO lan VALUES (458390414, 'VIA', 'N/A', 'N/A', 'N/A', 38, 458390);
INSERT INTO lan VALUES (459546414, 'VIA', 'N/A', 'N/A', '00-14-2A-FC-93-AE', 34, 459546);
INSERT INTO lan VALUES (46946514, 'REALTEK', 'N/A', 'RTL8102E/RTL8103E', '00-25-22-71-53-89', 34, 46946);
INSERT INTO lan VALUES (470703314, 'INTEL', 'N/A', '82567LM-3', '00-23-7D-49-C2-3B', 34, 470703);
INSERT INTO lan VALUES (485421514, 'INTEL', 'N/A', 'N/A', '00-08-02-C7-92-C0', 34, 485421);
INSERT INTO lan VALUES (48646414, 'REALTEK', 'N/A', 'RTL8139', '00-13-8F-C2-93-7B', 34, 48646);
INSERT INTO lan VALUES (493234414, 'INTEL', 'N/A', 'N/A', '00-09-6B-44-87-77', 34, 493234);
INSERT INTO lan VALUES (506796414, 'REALTEK', 'N/A', 'RTL8139', '00-13-8F-C2-93-7B', 34, 506796);
INSERT INTO lan VALUES (521656414, 'REALTEK ', 'N/A', 'RTL8139', '00-15-58-33-A4-7F', 34, 521656);
INSERT INTO lan VALUES (5220414, 'REALTEK', 'N/A', 'RTL8139 ', '00-13-8F-C2-93-7B', 34, 5220);
INSERT INTO lan VALUES (535406414, 'REALTEK', 'N/A', 'RTL8139', '00-15-58-33-A4-7F', 34, 535406);
INSERT INTO lan VALUES (536875414, 'REALTEK', 'N/A', 'RTL8139', '00-05-1D-EF-C6-3E', 34, 536875);
INSERT INTO lan VALUES (547640514, 'VIA', 'N/A', 'N/A', '00-14-2A-FC-02-BE', 34, 547640);
INSERT INTO lan VALUES (554562514, 'N/A', 'N/A', 'N/A', '00-A0-24-2E-A5-6A', 34, 554562);
INSERT INTO lan VALUES (564140414, 'VIA', 'N/A', 'N/A', '00-19-DB-B5-EB-D7', 34, 564140);
INSERT INTO lan VALUES (566656414, 'REALTEK', 'N/A', 'RTL8139', '00-21-97-D0-9F-30', 34, 566656);
INSERT INTO lan VALUES (588375514, 'INTEL', 'N/A', 'N/A', '00-11-11-6A-99-B2', 34, 588375);
INSERT INTO lan VALUES (596921514, 'SIS', 'N/A', 'N/A', '00-0A-E6-AD-4F-10', 34, 596921);
INSERT INTO lan VALUES (592718414, 'COMPAQ ', 'N/A', 'NC3120 ', '00-50-8B-6A-10-85', 34, 592718);
INSERT INTO lan VALUES (618953414, 'VIA', 'N/A', 'N/A', '00-14-2A-FC-02-A3', 34, 618953);
INSERT INTO lan VALUES (626250514, '3COM', 'N/A', '3C905B-TX', '00-10-5A-5D-A6-62', 34, 626250);
INSERT INTO lan VALUES (634859414, 'NVIDIA ', 'N/A', 'N/A', '00-1E-90-72-93-EC', 34, 634859);
INSERT INTO lan VALUES (641796414, 'VIA', 'N/A', 'N/A', '00-19-21-35-36-34', 34, 641796);
INSERT INTO lan VALUES (648343414, 'REALTEK ', 'N/A', 'RTL8139/810X', '00-21-97-EF-FF-E7', 34, 648343);
INSERT INTO lan VALUES (656421414, 'REALTEK', 'N/A', 'RTL8139/810X', '00-21-97-EF-FF-E7', 34, 656421);
INSERT INTO lan VALUES (658468414, 'REALTEK', 'N/A', 'RTL8139/810X', '00-21-97-EF-FF-E7', 34, 658468);
INSERT INTO lan VALUES (661109414, 'NVIDIA', 'N/A', 'N/A', '00-1E-90-73-E2-39', 34, 661109);
INSERT INTO lan VALUES (664390414, 'SILICONE', 'N/A', 'N/A', '00-0A-E6-D9-46-5F', 34, 664390);
INSERT INTO lan VALUES (664390514, 'REALTEK', 'N/A', 'RTL8139/810X', '00-A1-B0-12-15-B9', 34, 664390);
INSERT INTO lan VALUES (675406414, 'ETHERLINK', 'N/A', 'P4M800P-8237-6A7L6B09C-00', ' 00-10-5A-E1-69-39', 38, 675406);
INSERT INTO lan VALUES (678937414, ' NVIDIA NFORCE', 'N/A', 'N/A', '00-1E-90-79-12-46', 34, 678937);
INSERT INTO lan VALUES (698515414, 'NVIDIA NFORCE', 'N/A', 'N/A', '00-21-97-82-92-2B', 34, 698515);
INSERT INTO lan VALUES (702187414, 'REALTEK RTL8102E/RTL8103E', 'N/A', 'N/A', '10-78-D2-23-FB-40', 34, 702187);
INSERT INTO lan VALUES (714375414, 'REALTEK', 'N/A', 'N/A', '10-78-D2-23-FB-3C', 34, 714375);
INSERT INTO lan VALUES (72193414, 'RREALTEK EALTEK ', 'N/A', 'N/A', '10-78-D2-23-FB-3A', 34, 72193);
INSERT INTO lan VALUES (72793414, 'REALTEK', 'N/A', 'N/A', ' 00-1C-C0-74-64-0D', 34, 72793);


--
-- TOC entry 2242 (class 0 OID 16450)
-- Dependencies: 1726
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO menu VALUES (23, 'Ingresar Tecnicos', 'Soporte/Default.aspx', 'respuesta.gif', 10, 1, 1);
INSERT INTO menu VALUES (25, 'Monitores', 'Consultas/frmconsulta5.aspx', 'monitores.gif', 40, 1, 1);
INSERT INTO menu VALUES (26, 'Impresoras', 'Consultas/frmconsulta4.aspx', 'impresoras.gif', 40, 1, 1);
INSERT INTO menu VALUES (27, 'Equipos (CPU)', 'Consultas/frmconsulta8.aspx', 'equipos.gif', 40, 1, 1);
INSERT INTO menu VALUES (28, 'Mouse', 'Consultas/frmconsulta9.aspx', 'mouses.gif', 40, 1, 1);
INSERT INTO menu VALUES (29, 'Teclados', 'Consultas/frmconsulta10.aspx', 'teclados.gif', 40, 1, 1);
INSERT INTO menu VALUES (30, 'Reguladores', 'Consultas/frmconsulta11.aspx', 'reguladores.gif', 40, 1, 1);
INSERT INTO menu VALUES (31, 'Switches (RED)', 'Consultas/frmconsulta12.aspx', 'redes.gif', 40, 1, 1);
INSERT INTO menu VALUES (32, 'Actividades Realizadas (Por Cada Tecnico)', 'Reportes/frmReporte2.aspx', 'reportes.gif', 4, 1, 2);
INSERT INTO menu VALUES (33, 'Asignar Actividades', 'Asignar/Default.aspx', 'respuesta.gif', 10, 1, 1);
INSERT INTO menu VALUES (34, 'Modificaciones', '', 'codificadores.gif', 8, 1, 1);
INSERT INTO menu VALUES (35, 'Soporte', 'Consultas/frmSoporte.aspx', 'respuesta.gif', 34, 1, 1);
INSERT INTO menu VALUES (36, 'Equipos (Modificacion de datos del CPU)', 'Consultas/frmCPU.aspx', 'equipos.gif', 34, 1, 1);
INSERT INTO menu VALUES (38, 'Perifericos (Modificacion de datos de los equipos perifericos)', 'Consultas/frmPerifericos.aspx', 'equipos.gif', 34, 1, 1);
INSERT INTO menu VALUES (40, 'Listados', '', 'listados.gif', 8, 1, 1);
INSERT INTO menu VALUES (41, 'Actividades Realizadas (Segun tipo de equipo)', 'Reportes/frmReporte3.aspx', 'reportes.gif', 4, 1, 1);
INSERT INTO menu VALUES (42, 'Actividades Realizadas (Segun Departamento)', 'Reportes/frmReporte4.aspx', 'reportes.gif', 4, 1, 1);
INSERT INTO menu VALUES (43, 'Ingreso de Cartuchos de Impresion', 'Cartuchos/', 'impresoras.gif', 1, 1, 1);
INSERT INTO menu VALUES (44, 'Reporte de Cantidad de Dispositivos (Hardware Interno)', 'Reportes/frmReporte7.aspx', 'impresoras.gif', 4, 1, 1);
INSERT INTO menu VALUES (1, 'Solicitud de Servicio', '', 'solicitud.gif', NULL, 1, 3);
INSERT INTO menu VALUES (3, 'Formulario de Solicitud de Servicio', 'Solicitud/Default.aspx', 'solicitud.gif', 1, 1, 3);
INSERT INTO menu VALUES (4, 'Reportes', '', 'reportes.gif', NULL, 1, 3);
INSERT INTO menu VALUES (5, 'Actividades Realizadas', 'Reportes/frmreporte1.aspx', 'reportes.gif', 4, 1, 2);
INSERT INTO menu VALUES (8, 'Consultas', '', 'mantenimiento.gif', NULL, 1, 1);
INSERT INTO menu VALUES (9, 'Control de Equipos de Computacion', 'Equipos/Default.aspx', 'equipos.gif', 1, 1, 2);
INSERT INTO menu VALUES (10, 'Codificadores', '', 'codificadores.gif', NULL, 1, 1);
INSERT INTO menu VALUES (11, 'Usuarios del Sistema', 'Usuarios/Default.aspx', 'usuarios.gif', 10, 1, 1);
INSERT INTO menu VALUES (12, 'Departamentos', 'Departamentos/Default.aspx', 'departamentos.gif', 10, 1, 1);
INSERT INTO menu VALUES (14, 'Solicitudes Procesadas', 'Consultas/frmconsulta1.aspx', 'procesadas.gif', 8, 1, 2);
INSERT INTO menu VALUES (15, 'Solicitudes Pendientes', 'Consultas/frmconsulta2.aspx', 'revision.gif', 8, 1, 2);
INSERT INTO menu VALUES (16, 'Formulario para iniciar el servicio de soporte', 'Revision/Default.aspx', 'revision.gif', 1, 1, 2);
INSERT INTO menu VALUES (17, 'Equipos de computacion (Ver planilla de inventario)', 'Consultas/frmconsulta3.aspx', 'equipos.gif', 8, 1, 2);
INSERT INTO menu VALUES (18, 'Formulario de Respuesta de Solicitudes', 'Respuesta/Default.aspx', 'procesadas.gif', 1, 1, 2);
INSERT INTO menu VALUES (21, 'Seguimiento de Equipos (Estatus de solicitudes por cada equipo reportado)', 'Consultas/frmconsulta6.aspx', 'mantenimiento.gif', 8, 1, 2);
INSERT INTO menu VALUES (22, 'Seguimiento de Solicitudes (Ver estatus de solicitudes)', 'Consultas/frmconsulta7.aspx', 'solicitud.gif', 8, 1, 3);


--
-- TOC entry 2243 (class 0 OID 16453)
-- Dependencies: 1727
-- Data for Name: monitores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO monitores VALUES (15625, 'N/A', 'OLIVETTI', 'N/A', 'ADM07', 3, 1, 'NINGUNA', 2, 'ADM07', NULL, NULL);
INSERT INTO monitores VALUES (22953, 'N/A', 'AOC', 'N/A', 'MARIA RODRIGUEZ', 14, 1, 'NINGUNA', 2, 'ADM36', NULL, NULL);
INSERT INTO monitores VALUES (26234, 'N/A', 'DELUX', 'BE-58743', 'ADM22', 14, 1, 'NINGUNA', 2, 'ADM22', NULL, NULL);
INSERT INTO monitores VALUES (43468, 'N/A', 'N/A', 'N/A', 'ADM19', 0, 1, 'NINGUNA', 2, 'ADM19', 'N/A', 18);
INSERT INTO monitores VALUES (49640, 'N/A', 'LG', 'N/A', 'MORAIMA KEY', 11, 1, 'NINGUNA', 2, 'SALA12', 'N/A', 18);
INSERT INTO monitores VALUES (76343, 'K1462N14218360301', 'OLIVETTI', 'N/A', 'MAURA', 16, 1, 'NINGUNA', 2, 'ADM37', 'DSM21-772M', 17);
INSERT INTO monitores VALUES (80718, 'K1462N14218360301', 'OLIVETTI', 'N/A', 'MAURA', 16, 1, 'NINGUNA', 2, 'ADM37', 'DSM21-772M', 17);
INSERT INTO monitores VALUES (88812, '35487BA076921', 'AOC', 'BE: 59150-A', 'PRESI01', 23, 1, 'NINGUNA', 2, 'PRESI01', 'N/A', 17);
INSERT INTO monitores VALUES (109968, 'N/A', 'AOC', 'BE-58247-A', 'LORENA', 4, 1, 'NINGUNA', 2, 'ADM30', 'N/A', 17);
INSERT INTO monitores VALUES (119171, 'N/A', 'XPX', 'N/A', 'CARMEN', 2, 1, 'NINGUNA', 2, 'SALA20', 'N/A', 18);
INSERT INTO monitores VALUES (95109, 'N/A', 'AOC', 'N/A', 'ADM11', 3, 1, 'NINGUNA', 2, 'ADM11', 'N/A', 17);
INSERT INTO monitores VALUES (214250, 'AQ15VSPN/XBM', 'SAMSUNG', '50980', 'ONCOLOGIA', 21, 1, 'BIEN', 2, 'EPI02', ' SYNCMASTER', 18);
INSERT INTO monitores VALUES (223109, '88KB770', 'IBM', 'N/A', 'JANIC TORRE', 21, 1, 'BIEN', 2, 'EPI09', 'E74', 18);
INSERT INTO monitores VALUES (235500, 'N/A', 'AUSE', '56320-B', 'LORENA GUEVARA', 21, 1, 'NINGUNA', 2, 'EPI16', 'HKC 775V', 18);
INSERT INTO monitores VALUES (247765, 'V8C77A004219', 'AOC', '56319-B', 'LILIAN DELGADO', 21, 1, 'NINGUNA', 2, 'EPI04', 'CT700G', 18);
INSERT INTO monitores VALUES (258171, 'CNN64OKIN', 'HP', '3575279', 'MIGDALIA SEIJAS', 21, 1, 'NINGUNA', 2, 'EPI18', 'L1706', 17);
INSERT INTO monitores VALUES (266734, 'N/A', 'OLIVETTI', '02972906', 'MAIRELIS ASCANIO', 21, 1, 'NINGUNA', 2, 'EPI11', 'PROVIEW 772', 18);
INSERT INTO monitores VALUES (293875, '88KA815', 'IBM', '88KA815', 'YENI LISARAZO', 21, 1, 'NINGUNA', 2, 'EPI06', 'E74', 18);
INSERT INTO monitores VALUES (301687, 'PX849A', 'HP', '3575274', 'CARLOS VELES', 21, 1, 'NINGUNA', 2, 'EPI13', 'L1706 ', 18);
INSERT INTO monitores VALUES (318609, ' HCGY812218', 'SAMSUNG', '53230', 'NOREXIS ACOSTA', 21, 1, 'NINGUNA', 2, 'EPI14', 'SYNCMASTER', 18);
INSERT INTO monitores VALUES (555140, 'VRYDY86', 'IBM', 'N/A', ' MEDICINA VIAL Y ESTADISTICA', 18, 1, 'NINGUNA', 2, 'DGS04', 'E74', 18);
INSERT INTO monitores VALUES (199218, 'U8C86A092779', 'AOC', '58669-A', 'DR MIGUEL TERAN', 21, 1, 'OPTIMO', 2, 'EPI03', 'CT720G ', 18);
INSERT INTO monitores VALUES (330171, '104MX06753', 'LG', 'N/A', 'MARTA FERRERO', 21, 1, 'NINGUNA', 2, 'EPI08', 'CB775C', 17);
INSERT INTO monitores VALUES (337859, 'HCET309459', 'SAMSUNG', '50977', 'PATRICIA AMUNDARAY', 21, 1, 'NINGUNA', 2, 'EPI15', 'AQ15VSPNIXBM', 18);
INSERT INTO monitores VALUES (345796, 'N/A', 'DTK', '02968540', 'CARLA TORTOLEDO', 12, 1, 'NINGUNA', 2, 'CONTRA06', 'N/A', 18);
INSERT INTO monitores VALUES (360140, 'M9C65A772260', 'ENVISION', 'N/A', 'MIRIAN LA CRUZ', 21, 1, 'NINGUNA', 2, 'EPI12', 'EN-S1770A', 18);
INSERT INTO monitores VALUES (362921, 'CN-0J9235-64180-67J-32HY', 'DELL', '55188', 'JOSE ANGEL', 21, 1, 'NINGUNA', 2, 'EPI10', 'N/A', 18);
INSERT INTO monitores VALUES (380375, '88HY777', 'IBM', 'N/A', 'DR. RAMON RIVAS', 21, 1, 'NINGUNA', 2, 'EPI05', 'E74', 18);
INSERT INTO monitores VALUES (38793, 'PX849A', 'HP', '3575269', 'DR. ERNESTO FLORES', 21, 1, 'NINGUNA', 2, 'EPI17', 'HP L1706', 18);
INSERT INTO monitores VALUES (393140, 'CB775C', 'LG', '50666', 'ALICIA HERNANDEZ', 21, 1, 'NINGUNA', 2, 'EPI20', 'N/A', 18);
INSERT INTO monitores VALUES (402328, 'K1CS51A887215', 'AOC', 'N/A', 'MARIA ZAMBRANO', 21, 1, 'NINGUNA', 2, 'EPI19', 'CT720G', 18);
INSERT INTO monitores VALUES (409187, 'N/A', 'HP', '3419864', 'ALFREDO MUSURUARAR', 12, 1, 'NINGUNA', 2, 'CONTRA01', ' 5500', 18);
INSERT INTO monitores VALUES (417640, 'N/A', 'HP ', '3660898', 'HIGIENE', 12, 1, 'NINGUNA', 2, 'CONTRA09', 'L1710', 17);
INSERT INTO monitores VALUES (419625, 'HVHB303993', 'SAMSUNG', '61636', 'INGENIERIA SANITARIA', 12, 1, 'NINGUNA', 2, 'CONTRA05', 'SA300', 17);
INSERT INTO monitores VALUES (434828, 'LB17LS7L/XMB', 'SAMSUNG', '53188', 'DROGAS Y COSMETICOS', 12, 1, 'NINGUNA', 2, 'CONTRA02', 'SYNCMASTER 793S', 18);
INSERT INTO monitores VALUES (44231, '23-BDYC1', 'IBM', '02959254', 'JACKELINE PEREZ', 12, 1, 'NINGUNA', 2, 'CONTRA16', 'G52', 18);
INSERT INTO monitores VALUES (451125, 'CNC826QXJN', 'HP', '3650900', 'SECRETARIA CONTRALORIA SANITARIA', 12, 1, 'NINGUNA', 2, 'CONTRA08', 'L1710', 17);
INSERT INTO monitores VALUES (460234, 'LB17HCGY812317E', 'SAMSUNG', '53184', 'YAMILA DAGGELT', 12, 1, 'NINGUNA', 2, 'CONTRA07', '793S', 18);
INSERT INTO monitores VALUES (471937, '012NDQAE3820', 'LG', 'N/A', 'SACS', 12, 1, 'NINGUNA', 2, 'CONTRA10', 'W1943CV', 17);
INSERT INTO monitores VALUES (474859, 'CNC834PXRK', 'HP ', '3650894', 'SACS', 0, 1, 'NINGUNA', 2, 'CONTRA11', 'L1710', 17);
INSERT INTO monitores VALUES (483843, 'CNC834PXRK', 'HP', '3650894', 'SACS', 12, 1, 'NINGUNA', 2, 'CONTRA11', 'L1710', 17);
INSERT INTO monitores VALUES (487484, '144BM28HB724', 'COMPAQ', '61335-A', 'FRANKLIN RIVERO', 12, 1, 'NINGUNA', 2, 'CONTRA12', 'COMPAQ V570', 18);
INSERT INTO monitores VALUES (505359, '88GN452', 'IBM', 'N/A', 'SUPERVISORES AUDITORIA', 12, 1, 'NINGUNA', 2, 'CONTRA15', 'E74', 18);
INSERT INTO monitores VALUES (523812, 'K1287CA002916', 'AOC ', '58312-A', 'SNELL ESPINOZA', 12, 1, 'NINGUNA', 2, 'CONTRA19', '718SWAG-1', 17);
INSERT INTO monitores VALUES (526109, 'M9C65A772265', 'AOC', 'N/A', 'VIRGINIA DUQUE', 12, 1, 'NINGUNA', 2, 'CONTRA13', 'C720G', 18);
INSERT INTO monitores VALUES (539140, 'F0SU74120848U', 'KDS', '5625-B', 'LIC ALBA AVILA', 12, 1, 'NINGUNA', 2, 'CONTRA20', 'PTS076D', 17);
INSERT INTO monitores VALUES (548906, 'HCGY812384', 'SAMSUNG', '53226', 'HELEN TOVAR', 18, 1, 'NINGUNA', 2, 'DGS01', 'SYNCMASTER793S', 18);
INSERT INTO monitores VALUES (565937, 'JC01Z000000JG', 'AUSE', '58740-A', 'LUZ MIRIAM', 18, 1, 'NINGUNA', 2, 'DGS02', '775BI', 18);
INSERT INTO monitores VALUES (575234, '101NDHG6601', 'LG', 'N/A', 'ING. CARELIS LUGO', 18, 1, 'NINGUNA', 2, 'DGS03', 'W1943', 17);
INSERT INTO monitores VALUES (576218, 'N8176689FF4J', 'DELL', '55095-A', 'DR CARLOS VIVAS', 18, 1, 'NINGUNA', 2, 'DGS08', 'E773S', 18);
INSERT INTO monitores VALUES (578203, 'U8C86A092727', 'AOC', '58668-A', 'FELIX BERMUDEZ', 18, 1, 'NINGUNA', 2, 'DGS06', 'CT720G', 18);
INSERT INTO monitores VALUES (597609, 'K1PS55B633670', 'AOC', 'N/A', 'GERMAN SANTOS', 18, 1, 'NINGUNA', 2, 'DGS05', 'CT720G', 18);
INSERT INTO monitores VALUES (606906, '74AG26G K815', 'COMPAQ', '2616091', 'ZORAIDA GONZALEZ', 18, 1, 'NINGUNA', 2, 'DGS07', '300U', 18);
INSERT INTO monitores VALUES (609796, '1S6307BTEV114405', 'LENOVO', 'N/A', 'ROGELIO HERNANDEZ', 18, 1, 'NINGUNA', 2, 'DGS11', 'N/A', 18);
INSERT INTO monitores VALUES (620125, 'LB17HCGY801010L', '53210', 'SANSUNG', 'RODRIGUEZ ALEXIS', 18, 1, 'NINGUNA', 2, 'DGS13', 'SYNCMASTER793S', 18);
INSERT INTO monitores VALUES (627531, '926BF28RM217', 'COMPAQ', 'N/A', 'GESTION DE SERVICIOS', 18, 1, 'NINGUNA', 2, 'DGS09', 'PE11', 18);
INSERT INTO monitores VALUES (635765, 'K1287CA001572', 'AOC', '58302-A', 'CAROLINA', 18, 1, 'NINGUNA', 2, 'DGS10', '718SWAG-1', 17);
INSERT INTO monitores VALUES (642953, 'CN-0J9235-64180-5C8-33MX', 'DELL', '55087-A', 'LIC. LEIDY OJEDA', 18, 1, 'NINGUNA', 2, 'DGS14', 'N/A', 18);
INSERT INTO monitores VALUES (649359, 'U8C85A084608', 'AOC', 'N/A', 'DIRECCION DE SALUD', 18, 1, 'NINGUNA', 2, 'DGS12', '1770', 18);
INSERT INTO monitores VALUES (665531, 'LB17HCEY812331B', 'SAMSUNG', '53266', 'JUDITH ACASIO', 10, 1, 'SIN OBSERVACION', 2, 'TRAN02', '793S', 18);
INSERT INTO monitores VALUES (679890, 'CNOJ9235', 'DELL', 'N/A', 'CUARTO FRIO', 9, 1, 'NINGUNA', 2, 'CUARTO01', '64180', 18);
INSERT INTO monitores VALUES (685953, 'K1287CA002896', 'AOC', '58307-A', 'HENNYER MIJARES', 17, 1, 'NINGUNO', 2, 'ADM01', '718SWAG-1', 18);
INSERT INTO monitores VALUES (694859, '88KB878', 'IBM', 'N/A', 'MARISOL JIMENEZ', 17, 1, 'NINGUNO', 2, 'ADM03', 'E74', 18);
INSERT INTO monitores VALUES (705109, '58575-B', 'CLONE', '58575-B', 'RUBEN', 3, 1, 'NO', 2, 'ADM08', 'AOC 731W', 17);
INSERT INTO monitores VALUES (706578, 'D3287JA303636', 'GENIUS', '58575-A', 'RUBEN', 3, 1, 'NO', 2, 'ADM08', 'AOC 731W', 17);
INSERT INTO monitores VALUES (709421, 'CEQB7HA', 'AOC', '61712', 'ADM09', 3, 1, 'NO', 2, 'ADM09', 'TFT185', 17);
INSERT INTO monitores VALUES (715625, 'CEQB7HA037920', 'AOC', '61720', 'ADM10', 3, 1, 'NO', 2, 'ADM10', '7FT185W80PS', 17);
INSERT INTO monitores VALUES (724921, 'D3287JA303576', 'AOC', '5857-A', 'ADM11', 3, 1, 'NO', 2, 'ADM11', 'AOC1731', 17);
INSERT INTO monitores VALUES (729468, 'K1287CA002896', 'AOC', '58307-A', 'HENNYER MIJARES', 3, 1, 'NO', 2, 'ADM01', '718SWAG-1', 17);


--
-- TOC entry 2244 (class 0 OID 16459)
-- Dependencies: 1728
-- Data for Name: motherboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO motherboard VALUES (656421311, 'N/A', '63-0100-001131-00101111-051408', 'N/A', 'PCCHIPS', 656421, 29);
INSERT INTO motherboard VALUES (11720111424312257, 'null', 'n/a', '8188kse', 'intel', 117201114243122, 29);
INSERT INTO motherboard VALUES (277201111240828495, 'null', '621200001169001001111', 'MS-6534', 'MSI', 2772011112408284, 29);
INSERT INTO motherboard VALUES (2272011104123812365, 'null', 'N/A', 'K8M800-M7A', 'BIOSTAR', 22720111041238123, 29);
INSERT INTO motherboard VALUES (2762011101550703036, 'null', 'No tiene', 'No tiene', 'IBM', 27620111015507030, 29);
INSERT INTO motherboard VALUES (3062011142146515144, 'null', 'N/A', 'D975', 'INTEL', 30620111421465151, 29);
INSERT INTO motherboard VALUES (13187911, 'N/A', 'N/A', 'N/A', 'N/A', 13187, 29);
INSERT INTO motherboard VALUES (217501411, 'N/A', 'N/A', 'N/A', 'N/A', 21750, 29);
INSERT INTO motherboard VALUES (255002211, 'N/A', 'N/A', 'N/A', 'FOXCONN', 25500, 29);
INSERT INTO motherboard VALUES (282183011, 'N/A', 'N/A', 'N/A', 'BIOSTAR', 28218, 29);
INSERT INTO motherboard VALUES (367813811, 'N/A', 'N/A', '1', 'ASROCK', 36781, 29);
INSERT INTO motherboard VALUES (489064711, 'N/A', 'N/A', 'N/A', 'EASTON', 48906, 29);
INSERT INTO motherboard VALUES (677345711, '2000 MHZ', 'N/A', '1', 'ECS', 67734, 29);
INSERT INTO motherboard VALUES (68626711, 'N/A', 'N/A', 'M935D', 'PC CHIPS', 6862, 29);
INSERT INTO motherboard VALUES (873128611, 'N/A', 'N/A', 'N/A', 'ESCP43G', 87312, 29);
INSERT INTO motherboard VALUES (936879411, 'N/A', 'N/A', '01', 'BIOSTAR', 93687, 29);
INSERT INTO motherboard VALUES (94343311, 'N/A', 'N/A', 'N/A', 'N/A', 94343, 29);
INSERT INTO motherboard VALUES (992811111, 'N/A', 'N/A', '01', 'PC CHIPSBM935D', 99281, 29);
INSERT INTO motherboard VALUES (1014842011, 'N/A', 'N/A', 'N/A', 'IBM', 101484, 29);
INSERT INTO motherboard VALUES (1034062811, 'N/A', 'N/A', '1', 'FOXCONN', 103406, 29);
INSERT INTO motherboard VALUES (1085934511, 'N/A', 'N/A', 'N/A', 'N/A', 108593, 29);
INSERT INTO motherboard VALUES (1164375311, 'N/A', 'N/A', 'N/A', 'N/A', 116437, 29);
INSERT INTO motherboard VALUES (1281406111, 'N/A', 'N/A', 'N/A', 'N/A', 128140, 29);
INSERT INTO motherboard VALUES (174906711, 'P55G', 'N/A', 'N/A', 'PC CHIPS', 174906, 30);
INSERT INTO motherboard VALUES (193265811, 'N/A', 'N/A', 'N/A', 'MSI', 193265, 29);
INSERT INTO motherboard VALUES (190312411, 'N/A', 'N/A', 'N/A', 'IBM', 19031, 29);
INSERT INTO motherboard VALUES (21901111, 'N/A', '8188KSE', 'N/A', 'IBM', 2190, 29);
INSERT INTO motherboard VALUES (227937811, 'N/A', 'N/A', 'N/A', 'PCCHIPS', 227937, 29);
INSERT INTO motherboard VALUES (2464063911, 'N/A', 'N/A', 'N/A', 'INTEL', 246406, 29);
INSERT INTO motherboard VALUES (2542651511, 'N/A', 'N/A', 'N/A', 'HP', 254265, 29);
INSERT INTO motherboard VALUES (2659842111, 'N/A', 'N/A', 'N/A', ' MICRO-STAR', 265984, 29);
INSERT INTO motherboard VALUES (2723123111, 'N/A', 'N/A', 'N/A', 'MICRO-STAR', 272312, 29);
INSERT INTO motherboard VALUES (282640311, 'N/A', '8188KSE', 'N/A', 'IBM', 282640, 29);
INSERT INTO motherboard VALUES (291921411, 'N/A', 'N/A', 'N/A', 'IBM', 291921, 29);
INSERT INTO motherboard VALUES (300453411, 'N/A', 'MXJ702076G', 'N/A', 'HEWLETT-PACKARD', 300453, 29);
INSERT INTO motherboard VALUES (310187411, 'N/A', 'MXJ702076G', 'N/A', 'HEWLETT-PACKARD', 310187, 29);
INSERT INTO motherboard VALUES (312421311, 'N/A', '8188KSE', 'N/A', 'IBM', 312421, 29);
INSERT INTO motherboard VALUES (316593711, 'N/A', 'ECS 945GCT-M', 'N/A', 'INTEL', 316593, 29);
INSERT INTO motherboard VALUES (325131311, 'N/A', 'P17G', 'N/A', 'PCCHIPS', 325131, 29);
INSERT INTO motherboard VALUES (329156411, 'N/A', 'M935D', 'N/A', 'PCCHIPS', 329156, 29);
INSERT INTO motherboard VALUES (33662411, 'N/A', 'M935D', 'N/A', 'PCCHIPS ', 33662, 29);
INSERT INTO motherboard VALUES (344937511, 'N/A', 'M935D', 'N/A', 'PCCHIPS', 344937, 29);
INSERT INTO motherboard VALUES (357375311, 'N/A', 'P4M800', 'N/A', 'BIOSTAR', 357375, 29);
INSERT INTO motherboard VALUES (35831311, 'N/A', '775I65G', 'N/A', 'ASROCK', 35831, 29);
INSERT INTO motherboard VALUES (366531311, 'N/A', 'P4M800', 'N/A', 'BIOSTAR', 366531, 29);
INSERT INTO motherboard VALUES (379265311, 'N/A', '8188KSE', 'N/A', 'IBM', 379265, 29);
INSERT INTO motherboard VALUES (373875411, 'N/A', 'N/A', 'N/A', 'HEWLETT-PACKARD HP', 373875, 29);
INSERT INTO motherboard VALUES (386687511, 'N/A', 'SIS-661-6A7I4FK9C-00', 'N/A', 'FOXCONN', 386687, 29);
INSERT INTO motherboard VALUES (399156311, 'N/A', 'SIS-661-6A7I4FK9C-00', 'N/A', 'FOXCONN', 399156, 29);
INSERT INTO motherboard VALUES (4080311, 'N/A', 'NR138', 'N/A', 'LITEON', 4080, 29);
INSERT INTO motherboard VALUES (416234311, 'N/A', 'DC7900', 'N/A', 'HP', 416234, 29);
INSERT INTO motherboard VALUES (401796411, 'N/A', '2A8C', 'N/A', 'FOXCONN', 401796, 30);
INSERT INTO motherboard VALUES (433593311, 'N/A', 'K8M800-M7A', 'N/A', 'BIOSTAR', 433593, 29);
INSERT INTO motherboard VALUES (431484311, '64 BIT', '775VM800', 'N/A', 'ASROCK', 431484, 29);
INSERT INTO motherboard VALUES (448765311, 'N/A', 'MXJ91003B3', 'N/A', 'HP', 448765, 30);
INSERT INTO motherboard VALUES (449218311, 'N/A', 'N/A', 'N/A', 'N/A', 449218, 29);
INSERT INTO motherboard VALUES (458390311, 'N/A', 'N/A', 'N/A', 'N/A', 458390, 29);
INSERT INTO motherboard VALUES (459546311, 'N/A', 'K8M800-M7A', 'N/A', 'BIOSTAR', 459546, 29);
INSERT INTO motherboard VALUES (46946411, 'N/A', 'N/A', 'N/A', 'ASROCK', 46946, 30);
INSERT INTO motherboard VALUES (470703711, 'N/A', 'DC7900', 'N/A', 'HP', 470703, 29);
INSERT INTO motherboard VALUES (485421411, 'N/A', 'N/A', 'N/A', 'HP', 485421, 29);
INSERT INTO motherboard VALUES (48646311, 'N/A', '775I65G', 'N/A', 'ASROCK', 48646, 29);
INSERT INTO motherboard VALUES (493234311, 'N/A', '8188KSE', 'N/A', 'IBM', 493234, 29);
INSERT INTO motherboard VALUES (506796311, 'N/A', '775I65G', 'N/A', ' ASROCK', 506796, 29);
INSERT INTO motherboard VALUES (521656311, 'N/A', 'P4M800P7MA', 'N/A', 'FOXCONN', 521656, 29);
INSERT INTO motherboard VALUES (5220311, 'N/A', '775I65G', 'N/A', 'ASROCK', 5220, 29);
INSERT INTO motherboard VALUES (535406311, 'N/A', 'P4M800P7MA', 'N/A', 'FOXCONN ', 535406, 29);
INSERT INTO motherboard VALUES (536875311, 'N/A', '945GCT-M', 'N/A', 'ECS', 536875, 29);
INSERT INTO motherboard VALUES (547640411, 'N/A', 'K8M800-M7A', 'N/A', 'BIOSTAR', 547640, 29);
INSERT INTO motherboard VALUES (554562411, 'N/A', 'F932CVN21464', 'N/A', 'COMPAQ', 554562, 29);
INSERT INTO motherboard VALUES (564140311, 'N/A', 'PM9M-V MS-7364', 'N/A', 'MSI', 564140, 29);
INSERT INTO motherboard VALUES (574437311, 'N/A', 'N/A', 'N/A', 'INTEL', 574437, 29);
INSERT INTO motherboard VALUES (568921311, 'N/A', 'P4M800P-8237-6A7L6B09C-00', 'N/A', 'BIOSTAR', 568921, 29);
INSERT INTO motherboard VALUES (566656311, 'N/A', 'P17G', 'N/A', 'INTEL', 566656, 29);
INSERT INTO motherboard VALUES (588375411, 'N/A', 'D915PSY', 'N/A', 'INTEL', 588375, 29);
INSERT INTO motherboard VALUES (596921411, 'N/A', 'M935D', 'N/A', 'PCCHIPS', 596921, 29);
INSERT INTO motherboard VALUES (592718311, 'N/A', 'N/A', 'N/A', ' COMPAQ DESKPRO', 592718, 29);
INSERT INTO motherboard VALUES (618953311, 'N/A', 'K8M800-M7A', 'N/A', 'BIOSTAR', 618953, 29);
INSERT INTO motherboard VALUES (626250411, 'N/A', 'N/A', 'N/A', 'COMPAQ', 626250, 29);
INSERT INTO motherboard VALUES (634859311, 'N/A', 'MCP73T-M3', 'N/A', 'ECS', 634859, 29);
INSERT INTO motherboard VALUES (641796311, 'N/A', 'P4M800 PRO-M7', 'N/A', 'BIOSTAR', 641796, 29);
INSERT INTO motherboard VALUES (648343311, 'N/A ', '63-0100-001131-00101111-051408', 'N/A', 'PCCHIPS', 648343, 29);
INSERT INTO motherboard VALUES (658468311, 'N/A', '63-0100-001131-00101111-051408', 'N/A', 'PCCHIPS', 658468, 29);
INSERT INTO motherboard VALUES (661109311, 'N/A', 'MCP73T-M3', 'N/A', ' ECS', 661109, 29);
INSERT INTO motherboard VALUES (664390311, 'N/A', 'N/A', 'N/A', 'ELITE', 664390, 29);
INSERT INTO motherboard VALUES (675406311, 'N/A', 'P4M800', 'N/A', 'BIOSTAR', 675406, 29);
INSERT INTO motherboard VALUES (678937311, '2.00GHZ', 'ECS MCP73T-M3', 'N/A', 'NVIDIA', 678937, 30);
INSERT INTO motherboard VALUES (698515311, 'N/A', '00000000', 'N/A', 'PCCHIPS', 698515, 29);
INSERT INTO motherboard VALUES (702187811, 'N/A', 'N/A', 'P49G', 'PCCHIPS', 702187, 29);
INSERT INTO motherboard VALUES (714375311, '1984 MB', 'N/A', 'EAGLELAKE G41', 'INTEL', 714375, 29);
INSERT INTO motherboard VALUES (72193311, 'N/A', '64-0100-001131-00101111-091710-EAGLELAKE', 'N/A', 'PCCHIPS', 72193, 29);
INSERT INTO motherboard VALUES (72793311, 'N/A', 'N/A', 'N/A', 'INTEL', 72793, 30);


--
-- TOC entry 2245 (class 0 OID 16465)
-- Dependencies: 1729
-- Data for Name: mouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mouse VALUES (2272011112124684, 'IBM', 'OPTICO', '123177', 14, 'N/A', 'AIDE BEAMONT', 16, 1, '', 'ADM16', 4);
INSERT INTO mouse VALUES (20359, 'N/A', 'N/A', 'N/A', 15, 'N/A', 'ADM07', 3, 1, 'NINGUNA', 'ADM07', 4);
INSERT INTO mouse VALUES (2315, 'OMEGA', 'N/A', 'N/A', 15, 'N/A', 'MARIA RODRIGUEZ', 14, 1, 'NINGUNA', 'ADM36', 4);
INSERT INTO mouse VALUES (26234, 'N/A', 'N/A', 'N/A', 15, 'N/A', 'ADM22', 14, 1, 'NINGUNA', 'ADM22', 4);
INSERT INTO mouse VALUES (2993, 'DTK', 'M- S48', 'N/A', 15, 'N/A', 'NEYDA', 3, 1, 'NINGUNA', 'AMD09', 4);
INSERT INTO mouse VALUES (45421, 'N/A', 'N/A', 'N/A', 14, 'N/A', 'ADM19', 14, 1, 'NINGUNA', 'ADM19', 4);
INSERT INTO mouse VALUES (820, 'IBM', 'N/A', '23-035947', 14, 'N/A', 'MAURA', 16, 1, 'NINGUNA', 'ADM37', 4);
INSERT INTO mouse VALUES (90453, 'GENIUS', 'N/A', 'X52240705199', 15, 'N/A', 'PRESI01', 23, 1, 'NINGUNA', 'PRESI01', 4);
INSERT INTO mouse VALUES (11115, 'GENIUS', 'N/A', '460470000974', 14, 'N/A', 'LORENA', 4, 1, 'NINGUNA', 'ADM30', 4);
INSERT INTO mouse VALUES (12193, 'OMEGA', 'N/A', '2010000258', 14, 'N/A', 'CARMEN', 2, 1, 'NINGUNA', 'SALA20', 4);
INSERT INTO mouse VALUES (97937, 'GENIUS', 'LASER JET 1005', 'N/A', 14, 'N/A', 'ADM11', 3, 1, 'NINGUNA', 'ADM11', 4);
INSERT INTO mouse VALUES (202187, 'GENIUS', 'N/A', '150738203052', 15, '58669-B', 'DR MIGUEL TERAN', 21, 1, 'BUENO', 'EPI03', 4);
INSERT INTO mouse VALUES (203906, 'IBM', 'N/A', '142283', 14, 'N/A', 'DR RAMON RIVAS', 0, 1, 'NINGUNA', 'EPI05', 4);
INSERT INTO mouse VALUES (216171, 'DTK', 'M-548', 'LZA83056131', 15, ' 02964623', 'ONCOLOGIA', 21, 1, 'BIEN', 'EPI02', 4);
INSERT INTO mouse VALUES (228156, 'IBM', 'N/A', '23-116767', 14, 'N/A', 'JANIC TORRE', 21, 1, 'BIEN', 'EPI09', 4);
INSERT INTO mouse VALUES (23762, 'SONIC', 'M233UP008SA', 'N/A', 14, '56320-F', 'LORENA GUEVARA', 21, 1, 'NINGUNA', 'EPI16', 4);
INSERT INTO mouse VALUES (249671, 'SONIC', 'M233UP008SA', 'N/A', 14, '56319-F', 'LILIAN DELGADO', 21, 1, 'NINGUNA', 'EPI04', 4);
INSERT INTO mouse VALUES (260625, 'AUSE', 'LM6603P', 'N/A', 15, 'N/A', 'MIGDALIA SEIJAS', 21, 1, 'NINGUNA', 'EPI18', 4);
INSERT INTO mouse VALUES (275265, 'OMEGA', 'OPTICO', '2010000124', 15, 'N/A', 'MAIRELIS ASCANIO', 21, 1, 'NINGUNA', 'EPI11', 4);
INSERT INTO mouse VALUES (296703, 'IBM', 'N/A', 'SN23-116723', 14, 'N/A', 'YENI LISARAZO', 21, 1, 'NINGUNA', 'EPI06', 4);
INSERT INTO mouse VALUES (303265, 'HP', 'N/A', '265986-003', 15, '3575267', 'CARLOS VELES', 21, 1, 'NINGUNA', 'EPI13', 4);
INSERT INTO mouse VALUES (3210, 'GENIUS', 'N/A', 'X66036501170', 14, 'N/A', 'NOREXIS ACOSTA', 21, 1, 'NINGUNA', 'EPI14', 4);
INSERT INTO mouse VALUES (332828, 'GENIUS', 'OPTICO', 'X66036501134', 14, 'N/A', 'MARTA FERRERO', 21, 1, 'NINGUNA', 'EPI08', 4);
INSERT INTO mouse VALUES (339328, 'GENIUS', 'N/A', 'X66036501163', 14, 'N/A', 'PATRICIA AMUNDARAY', 21, 1, 'NINGUNA', 'EPI15', 4);
INSERT INTO mouse VALUES (347718, 'DTK', 'M-S48', 'LZA83007918', 15, '02968543', 'CARLA TORTOLEDO', 12, 1, 'NINGUNA', 'CONTRA06', 4);
INSERT INTO mouse VALUES (363703, 'GENIUS', 'N/A', 'X52240702739', 15, 'N/A', 'MIRIAN LA CRUZ', 21, 1, 'NINGUNA', 'EPI12', 4);
INSERT INTO mouse VALUES (374812, 'N/A', 'N/A', 'N/A', 14, 'N/A', 'JOSE ANGEL', 21, 1, 'NO SE IDENTIFICA LA MARCA, NI EL SERIAL (BORRADO)', 'EPI10', 4);
INSERT INTO mouse VALUES (38278, 'IBM', 'N/A', '142283', 14, 'N/A', 'DR. RAMON RIVAS', 21, 1, 'NINGUNA', 'EPI05', 4);
INSERT INTO mouse VALUES (389671, 'GENIUS', 'N/A', '460470001009', 15, 'N/A', 'DR. ERNESTO FLORES', 21, 1, 'NINGUNA', 'EPI17', 4);
INSERT INTO mouse VALUES (395687, 'GENIUS', 'N/A', 'X52240702739', 15, 'N/A', 'ALICIA HERNANDEZ', 21, 1, 'NINGUNA', 'EPI20', 4);
INSERT INTO mouse VALUES (404828, 'AITEG', 'N/A', '0608019962', 15, '55465-D', 'MARIA ZAMBRANO', 21, 1, 'NINGUNA', 'EPI19', 4);
INSERT INTO mouse VALUES (411593, 'HP', 'OPTICO', 'M-SBF96', 15, 'N/A', 'ALFREDO MUSURUARAR', 12, 1, 'NINGUNA', 'CONTRA01', 4);
INSERT INTO mouse VALUES (421218, 'HP ', 'OPTICO', 'N/A', 15, 'N/A', 'HIGIENE', 12, 1, 'NINGUNA', 'CONTRA09', 4);
INSERT INTO mouse VALUES (427718, 'HP', 'N/A', '265986-011', 14, '61635', 'INGENIERIA SANITARIA', 12, 1, 'NINGUNA', 'CONTRA05', 4);
INSERT INTO mouse VALUES (436250, 'AITE', 'MO-003', '060600438', 15, 'N/A', 'DROGAS Y COSMETICOS', 12, 1, 'NINGUNA', 'CONTRA02', 4);
INSERT INTO mouse VALUES (444203, 'POLUX', 'N/A', 'N/A', 15, 'N/A', 'JACKELINE PEREZ', 12, 1, 'NINGUNA', 'CONTRA16', 4);
INSERT INTO mouse VALUES (453375, 'HP', 'SBF96', '417441-001', 15, 'N/A', 'SECRETARIA CONTRALORIA SANITARIA', 12, 1, 'NINGUNA', 'CONTRA08', 4);
INSERT INTO mouse VALUES (462875, 'BELKIN', 'F8E813', '030163865', 15, 'N/A', 'YAMILA DAGGELT', 12, 1, 'NINGUNA', 'CONTRA07', 4);
INSERT INTO mouse VALUES (473578, ' AXXIS  ', 'AX-MOU-16539', '201051000302', 14, 'N/A', 'SACS', 12, 1, 'NINGUNA', 'CONTRA10', 4);
INSERT INTO mouse VALUES (478781, 'HP', 'SBF96 ', '417441-001', 15, 'N/A', 'SACS', 12, 1, 'NINGUNA', 'CONTRA11', 4);
INSERT INTO mouse VALUES (489500, 'COMPAQ', 'N/A', 'N/A', 15, '61335-D', 'FRANKLIN RIVERO', 12, 1, 'NINGUNA', 'CONTRA12', 4);
INSERT INTO mouse VALUES (508140, 'IBM', 'M028UO', '23-210202', 14, 'N/A', 'SUPERVISORES AUDITORIA', 12, 1, 'NINGUNA', 'CONTRA15', 4);
INSERT INTO mouse VALUES (525109, 'OMEGA', '27862BS', '2008020759', 15, '58312-E', 'SNELL ESPINOZA', 12, 1, 'NINGUNA', 'CONTRA19', 4);
INSERT INTO mouse VALUES (531250, 'GENIUS', 'N/A', 'X6334630S0', 15, 'N/A', 'VIRGINIA DUQUE', 12, 1, 'NINGUNA', 'CONTRA13', 4);
INSERT INTO mouse VALUES (541343, 'GENIUS', 'N/A', 'X52240702713', 15, 'N/A', 'LIC ALBA AVILA', 12, 1, 'NINGUNA', 'CONTRA20', 4);
INSERT INTO mouse VALUES (550531, 'GENIUS', 'OPTICO', '158186307119', 14, 'N/A', 'HELEN TOVAR', 18, 1, 'NINGUNA', 'DGS01', 4);
INSERT INTO mouse VALUES (557125, 'MARKVISION', 'OPTICO', '125200732315917', 15, 'N/A', 'MEDICINA VIAL Y ESTADISTICA', 18, 1, 'NINGUNA', 'DGS04', 4);
INSERT INTO mouse VALUES (57031, 'GENIUS', 'GM-080025', 'X641507077681', 14, 'N/A', 'LUZ MIRIAM', 18, 1, 'NINGUNA', 'DGS02', 4);
INSERT INTO mouse VALUES (579281, 'SIRAGON', 'N/A', 'N/A', 14, 'N/A', 'ING. CARELIS LUGO', 18, 1, 'NINGUNA', 'DGS03', 4);
INSERT INTO mouse VALUES (583265, 'GENIUS', 'OPTICO', '150738203067', 14, '58668-E', 'FELIX BERMUDEZ', 18, 1, 'NINGUNA', 'DGS06', 4);
INSERT INTO mouse VALUES (584421, 'A4THC', 'OP-57D', 'N/A', 14, '55095-E', 'DR CARLOS VIVAS', 18, 1, 'NINGUNA', 'DGS08', 4);
INSERT INTO mouse VALUES (60131, 'LOGITECH', 'M-SBF90', 'N/A', 15, 'N/A', 'GERMAN SANTOS', 18, 1, 'NINGUNA', 'DGS05', 4);
INSERT INTO mouse VALUES (608671, 'GENIUS', 'NETSCROLL120', '460451409908', 15, ' N/A', 'ZORAIDA GONZALEZ', 18, 1, 'NINGUNA', 'DGS07', 4);
INSERT INTO mouse VALUES (614578, 'GENIUS', 'N/A', '158186307154', 14, 'N/A', 'ROGELIO HERNANDEZ', 18, 1, 'NINGUNA', 'DGS11', 4);
INSERT INTO mouse VALUES (622312, 'GENIUS', 'NETSCROLL 120', 'W64485308060', 15, 'N/A', 'RODRIGUEZ ALEXIS', 18, 1, 'NINGUNA', 'DGS13', 4);
INSERT INTO mouse VALUES (629500, 'GENIUS', 'GM-04003A', '158186307114', 15, 'N/A', 'GESTION DE SERVICIOS', 18, 1, 'NINGUNA', 'DGS09', 4);
INSERT INTO mouse VALUES (637187, 'AITEG', 'MO-003', '060600884', 15, '54331-E', 'CAROLINA', 18, 1, 'NINGUNA', 'DGS10', 4);
INSERT INTO mouse VALUES (644609, 'N/A', 'OP-57D', 'N/A', 14, '57087-E', 'LIC. LEIDY OJEDA', 18, 1, 'NINGUNA', 'DGS14', 4);
INSERT INTO mouse VALUES (651328, 'GENIUS', 'GM-04003A', '150738203013', 14, '58667-E', 'DIRECCION DE SALUD', 18, 1, 'NINGUNA', 'DGS12', 4);
INSERT INTO mouse VALUES (667406, 'BENQ', 'L001', 'N/A', 14, 'N/A', 'JUDITH ACASIO', 10, 1, 'NINGUNA', 'TRAN02', 4);
INSERT INTO mouse VALUES (681828, 'AITEG', 'OP-570', 'N/A', 14, '55189', 'CUARTO FRIO', 9, 1, 'NINGUNA', 'CUARTO01', 4);
INSERT INTO mouse VALUES (687484, 'OMEGA', '278862BS', '2008043680', 15, 'N/A', 'HENNYER MIJARES', 17, 1, 'NINGUNO', 'ADM01', 4);
INSERT INTO mouse VALUES (697296, 'VIT', 'MSU0718T', 'MS063Q72185A', 14, 'N/A', 'MARISOL JIMENEZ', 17, 1, 'NINGUNO', 'ADM03', 4);
INSERT INTO mouse VALUES (711984, 'OMEGA', '278963BK', '2011260801', 15, '61712', 'ADM09', 3, 1, 'NO', 'ADM09', 4);
INSERT INTO mouse VALUES (717484, 'OMEGA', '278963BK', '2011260830', 15, '61720', 'ADM10', 3, 1, 'NO', 'ADM10', 4);
INSERT INTO mouse VALUES (72531, 'GENIUS', 'GM-04003A', '14978230599', 15, '58576-D', 'ADM11', 3, 1, 'NO', 'ADM11', 4);
INSERT INTO mouse VALUES (732125, 'OMEGA', '278862BS', '2008043680', 15, 'N/A', 'HENNYER MIJARES', 3, 1, 'NO', 'ADM01', 4);


--
-- TOC entry 2246 (class 0 OID 16471)
-- Dependencies: 1730
-- Data for Name: nivel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO nivel VALUES (1, 'Administrador');
INSERT INTO nivel VALUES (2, 'Operador');
INSERT INTO nivel VALUES (3, 'Usuario');


--
-- TOC entry 2247 (class 0 OID 16474)
-- Dependencies: 1731
-- Data for Name: procesador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO procesador VALUES (11720111424312253, 'n/a', '2.4 ghz', 'intel', 'pentium 4', 117201114243122, 32);
INSERT INTO procesador VALUES (277201111240828494, 'N/A', '1.6 GHZ', 'INTEL', 'P4', 2772011112408284, 32);
INSERT INTO procesador VALUES (588375310, 'N/A', '3.0 GHZ', 'INTEL', 'PENTIUM 4', 588375, 32);
INSERT INTO procesador VALUES (2762011101550703035, 'No tiene', '1.7 Ghz', 'Intel', 'Pentium IV', 27620111015507030, 32);
INSERT INTO procesador VALUES (596921310, '00000F13H', '1.70 GHZ', 'INTEL', 'CELERON', 596921, 32);
INSERT INTO procesador VALUES (592718210, 'N/A', '466 MHZ', 'INTEL', 'CELERON(TM)', 592718, 32);
INSERT INTO procesador VALUES (2272011104123812364, 'N/A', '1.6 GHZ.', 'AMD', 'SEMPRON', 22720111041238123, 31);
INSERT INTO procesador VALUES (13187410, 'N/A', '1700 MHZ', 'GENERICA', 'CELERON', 13187, 31);
INSERT INTO procesador VALUES (217501310, 'N/A', '2000 MHZ', 'DUAR CORE INTEL', 'E2180', 21750, 32);
INSERT INTO procesador VALUES (255002110, 'N/A', '2.20 GHZ', 'INTEL PENTIUM DUAL', 'N/A', 25500, 32);
INSERT INTO procesador VALUES (282182910, 'N/A', '1.6 GHZ', 'AMD', 'SEMPRON 2006+', 28218, 31);
INSERT INTO procesador VALUES (367813710, 'N/A', '3.66 MHZ', 'PENTIUM IV', 'N/A', 36781, 32);
INSERT INTO procesador VALUES (489064610, 'N/A', '863 MHZ', 'INTEL', 'PENTIUM III', 48906, 32);
INSERT INTO procesador VALUES (677345610, 'N/A', '2000 MHZ', 'INTEL', 'DUAL CORE', 67734, 32);
INSERT INTO procesador VALUES (68626610, 'N/A', '1.7 G', 'INTEL', 'CELERON', 6862, 32);
INSERT INTO procesador VALUES (873128510, 'N/A', '1800MHZ', 'CELERON', 'N/A', 87312, 32);
INSERT INTO procesador VALUES (936879310, 'N/A', '1.6 GHZ', 'AMD', 'SEMPRON', 93687, 31);
INSERT INTO procesador VALUES (94343210, 'N/A', '2.50 MHZ', 'N/A', 'PENTIUM DUAL CORE', 94343, 32);
INSERT INTO procesador VALUES (992811010, 'N/A', '1700 MHZ', 'N/A', 'CELERON', 99281, 32);
INSERT INTO procesador VALUES (1014841910, 'N/A', '2394MHZ', 'GENUINEINTEL', 'N/A', 101484, 32);
INSERT INTO procesador VALUES (1034062710, 'N/A', '2500MHZ', 'INTEL', 'DUAL-CORE', 103406, 32);
INSERT INTO procesador VALUES (1085934410, 'N/A', 'N/A', 'INTEL PENTIUM DUAL', 'INTEL', 108593, 32);
INSERT INTO procesador VALUES (1164375210, 'N/A', '2500 MHZ', 'N/A', 'DUAL CORE', 116437, 32);
INSERT INTO procesador VALUES (1281406010, 'N/A', 'N/A', 'INTEL', 'INTEL', 128140, 32);
INSERT INTO procesador VALUES (174906210, 'N/A', '2.50GHZ', 'INTEL', ' DUAL-CORE   E5200 ', 174906, 32);
INSERT INTO procesador VALUES (193265710, 'N/A', '1.60GHZ', 'INTEL(R)', 'PENTIUM 4', 193265, 32);
INSERT INTO procesador VALUES (190312310, 'N/A', '2.4 GB', 'INTEL', 'PENTIUM 4', 19031, 32);
INSERT INTO procesador VALUES (2190910, 'N/A', '2400 MHZ', 'INTEL', 'PENTIUM 4', 2190, 32);
INSERT INTO procesador VALUES (227937910, 'N/A', '1.8 GHZ', 'INTEL', 'PENTIUM E2160', 227937, 32);
INSERT INTO procesador VALUES (2422343310, 'N/A', '3.4 GHZ', 'INTEL', 'PENTIUM D', 242234, 32);
INSERT INTO procesador VALUES (2464063810, 'N/A', '1800 MHZ', 'INTEL', 'PENTIUM E2160', 246406, 32);
INSERT INTO procesador VALUES (2542651410, 'N/A', '3400 MHZ', 'INTEL', 'DUALCORE PENTIUM D', 254265, 32);
INSERT INTO procesador VALUES (2659842010, 'N/A', '1600 MHZ', 'INTEL', 'PENTIUM 4', 265984, 32);
INSERT INTO procesador VALUES (2723123010, 'N', '1600 MHZ', 'INTEL', 'PENTIUM 4', 272312, 32);
INSERT INTO procesador VALUES (282640210, ' 00000F29H', '2400 MHZ', 'INTEL', 'PENTIUM 4', 282640, 32);
INSERT INTO procesador VALUES (291921310, 'N/A', '2400 MHZ', 'INTEL', 'PENTIUM 4', 291921, 32);
INSERT INTO procesador VALUES (300453310, 'N/A', '3400 MHZ', 'DUALCORE INTEL', 'PENTIUM D', 300453, 32);
INSERT INTO procesador VALUES (310187310, 'N/A', '3400 MHZ', 'INTEL', 'PENTIUM D', 310187, 32);
INSERT INTO procesador VALUES (312421210, 'N/A', ' 2400 MHZ', 'INTEL', 'PENTIUM 4', 312421, 32);
INSERT INTO procesador VALUES (316593210, 'N/A', '3066 MHZ', 'INTEL', 'PENTIUM 4', 316593, 32);
INSERT INTO procesador VALUES (325131210, 'N/A', ' 1800 MHZ', 'INTEL', 'CELERON 430', 325131, 32);
INSERT INTO procesador VALUES (329156310, '00000F13H', '1700 MHZ', 'INTEL', 'CELERON', 329156, 32);
INSERT INTO procesador VALUES (33662310, 'N/A', '1700 MHZ', 'INTEL', 'CELERON', 33662, 32);
INSERT INTO procesador VALUES (344937410, 'N/A', '1700 MHZ', 'INTEL', 'CELERON', 344937, 32);
INSERT INTO procesador VALUES (357375210, '00000F49H', '3.2 GHZ', 'INTEL', 'PENTIUM 4', 357375, 32);
INSERT INTO procesador VALUES (35831210, 'N/A', '3.06GHZ', 'INTEL', ' PENTIUM 4', 35831, 32);
INSERT INTO procesador VALUES (366531210, 'N/A', '3.2 GHZ', 'INTEL', 'PENTIUM 4', 366531, 32);
INSERT INTO procesador VALUES (379265210, 'N/A', '2.4 GHZ', 'INTEL', 'PENTIUM 4', 379265, 32);
INSERT INTO procesador VALUES (373875310, 'N/A', '3.40GHZ', 'INTEL', 'PENTIUM(R) D', 373875, 32);
INSERT INTO procesador VALUES (386687410, 'N/A', '1.6 GHZ', 'INTEL', 'PENTIUM 4', 386687, 32);
INSERT INTO procesador VALUES (399156210, '00000F29H', '2000 MHZ', 'INTEL', 'CELERON', 399156, 32);
INSERT INTO procesador VALUES (4080210, '00000F29H', '2.80 GHZ', 'INTEL', 'PENTIUM 4', 4080, 32);
INSERT INTO procesador VALUES (416234210, '00010676H', '2.66 GHZ', 'INTEL', 'CORE 2 DUO ', 416234, 32);
INSERT INTO procesador VALUES (401796310, 'E5800', '3.20GHZ', 'INTEL', 'DUAL-CORE', 401796, 32);
INSERT INTO procesador VALUES (433593210, 'N/A', ' 3000 MHZ', 'AMD', 'SEMPRON', 433593, 31);
INSERT INTO procesador VALUES (431484210, 'N/A', '2.80GHZ', 'INTEL', 'PENTIUM 4', 431484, 32);
INSERT INTO procesador VALUES (448765210, ' E7300', '2.66GHZ', 'INTEL', 'CORE 2 DUO', 448765, 32);
INSERT INTO procesador VALUES (449218210, 'N/A', '2.6 GHZ', 'AMD', 'SEMPRON', 449218, 31);
INSERT INTO procesador VALUES (458390210, 'N/A', '2.6 GHZ', 'AMD', 'SEMPRON', 458390, 31);
INSERT INTO procesador VALUES (459546210, 'N/A', '3000 MHZ', 'AMD ', 'SEMPRON', 459546, 31);
INSERT INTO procesador VALUES (46946310, 'E5700', '3000 MHZ', 'INTEL', 'PENTIUM(R) DUAL-CORE', 46946, 32);
INSERT INTO procesador VALUES (470703210, 'N/A', '2.66 GHZ', 'INTEL', 'INTEL CORE 2 DUO', 470703, 32);
INSERT INTO procesador VALUES (485421310, 'N/A', '1800 MHZ', 'INTEL', 'PENTIUM 4', 485421, 32);
INSERT INTO procesador VALUES (48646610, 'N/A', '3.06GHZ', 'INTEL', 'PENTIUM 4', 48646, 32);
INSERT INTO procesador VALUES (493234210, 'N/A', '2.40GHZ', 'INTEL', 'PENTIUM(R) 4', 493234, 32);
INSERT INTO procesador VALUES (506796210, 'N/A', '3.06 GHZ', 'INTEL', 'PENTIUM 4', 506796, 32);
INSERT INTO procesador VALUES (521656210, '00000F43H', '3200 MHZ', 'INTEL', 'PENTIUM 4', 521656, 32);
INSERT INTO procesador VALUES (5220210, 'N/A', '3.06 GHZ', 'INTEL', 'PENTIUM 4', 5220, 32);
INSERT INTO procesador VALUES (535406210, '00000F43H', '3.20GHZ', 'INTEL', 'PENTIUM 4', 535406, 32);
INSERT INTO procesador VALUES (536875210, 'N/A', '1.8 GHZ', 'INTEL', 'PENTIUM E2160', 536875, 32);
INSERT INTO procesador VALUES (547640310, 'N/A', '3000 MHZ', 'AMD', 'SEMPRON', 547640, 31);
INSERT INTO procesador VALUES (554562310, 'N/A', '500 MHZ', 'INTEL', 'CELERON', 554562, 32);
INSERT INTO procesador VALUES (564140210, '000006FDH', '1.60 GHZ', 'INTEL', 'PENTIUM E2160', 564140, 32);
INSERT INTO procesador VALUES (574437210, 'N/A', '2.8 GHZ', 'INTEL', 'PENTIUM D', 574437, 32);
INSERT INTO procesador VALUES (568921210, '00000F49H', '3.20 GHZ', 'INTEL', 'PENTIUM 4', 568921, 32);
INSERT INTO procesador VALUES (566656210, 'N/A', '1.80GHZ', 'INTEL', 'CELERON(R) ', 566656, 32);
INSERT INTO procesador VALUES (618953210, '00020FC2H', '2600 MHZ', 'AUTHENTICAMD', 'N/A', 618953, 31);
INSERT INTO procesador VALUES (626250310, '00000665H', '466 MHZ', 'INTEL', 'CELERON(R)', 626250, 32);
INSERT INTO procesador VALUES (634859210, '000006FDH', '2000 MHZ', 'INTEL', 'PENTIUM E2180', 634859, 32);
INSERT INTO procesador VALUES (641796210, 'N/A', '3200 MHZ', 'INTEL', 'PENTIUM 4', 641796, 32);
INSERT INTO procesador VALUES (648343210, 'N/A', '1.8 GHZ', 'INTEL', 'CELERON 430', 648343, 32);
INSERT INTO procesador VALUES (656421210, 'N/A', '1.8 GHZ', 'INTEL', 'CELERON 430', 656421, 32);
INSERT INTO procesador VALUES (658468210, 'N/A', '1.8 GHZ', 'INTEL', 'CELERON 430', 658468, 32);
INSERT INTO procesador VALUES (661109210, 'N/A', '2.0 GHZ', 'INTEL', 'PENTIUM E2180', 661109, 32);
INSERT INTO procesador VALUES (664390210, 'N/A', '1700 MHZ', 'INTEL', 'INTEL(R) PENTIUM(R) 4 PROCESSOR', 664390, 32);
INSERT INTO procesador VALUES (675406210, 'N/A', '3.20GHZ  ', 'INTEL', 'PENTIUM 4', 675406, 32);
INSERT INTO procesador VALUES (678937210, 'N/A', '2000 MHZ', 'INTEL', 'DUALCORE PENTIUM E2180', 678937, 32);
INSERT INTO procesador VALUES (698515210, 'N/A', '3.00GHZ', 'INTEL', 'CORE(TM)2 DUO', 698515, 32);
INSERT INTO procesador VALUES (702187210, 'S/N', '3.00GHZ', 'INTEL', 'CORE(TM)2 DUO', 702187, 32);
INSERT INTO procesador VALUES (714375210, 'E8400', '3000 MHZ', 'INTEL', 'CORE 2 DUO', 714375, 32);
INSERT INTO procesador VALUES (72193210, 'E8400', '3000 MHZ', 'INTEL', 'CORE 2 DUO', 72193, 32);
INSERT INTO procesador VALUES (72793210, 'N/A', '2500 MHZ', 'INTEL', 'PENTIUM E5200 DUAL CORE', 72793, 32);


--
-- TOC entry 2248 (class 0 OID 16480)
-- Dependencies: 1732
-- Data for Name: ram; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ram VALUES (3583109, 'N/A', 'N/A', 'N/A', '512 MB', 35831, 11, 512);
INSERT INTO ram VALUES (277201111240828492, 'GMX64PC100CL', 'N/A', 'KINGSTON', '128 MB', 2772011112408284, 11, 128);
INSERT INTO ram VALUES (2272011104123812362, 'N/A', 'N/A', 'GENERICA', '256 MB', 22720111041238123, 11, 256);
INSERT INTO ram VALUES (11656999, 'No tiene', 'No tiene', 'No tiene', '1 GB', 11656, 11, NULL);
INSERT INTO ram VALUES (277201111240828491, 'GMX64PC100CL2168P', 'N/A', 'KINGSTON', '128 MB', 2772011112408284, 11, 128);
INSERT INTO ram VALUES (3062011142146515141, 'n/a', 'n/a', 'kingstone', '2 GB', 30620111421465151, 12, 2000);
INSERT INTO ram VALUES (522009, 'N/A', 'N/A', 'N/A', '512 MB', 5220, 11, 512);
INSERT INTO ram VALUES (1318719, 'N/A', 'N/A', 'GENERICA', '256 MB', 13187, 11, 256);
INSERT INTO ram VALUES (1318729, 'N/A', 'N/A', 'GENERICA', '128 MB', 13187, 11, 128);
INSERT INTO ram VALUES (3366209, '0901883AH', 'N/A', 'SPECTEK', '128 MB', 33662, 11, 128);
INSERT INTO ram VALUES (3366219, '1301897FH', 'N/A', 'SPECTEK', '128 MB', 33662, 11, 128);
INSERT INTO ram VALUES (21750109, 'N/A', '1', 'N/A', '1 GB', 21750, 12, 1000);
INSERT INTO ram VALUES (4694609, 'N/A', 'N/A', 'SUPERTALENT', '1 GB', 46946, 12, 1000);
INSERT INTO ram VALUES (4864609, 'N/A', 'N/A', 'N/A', '512 MB', 48646, 11, 512);
INSERT INTO ram VALUES (6862629, 'N/A', '1', 'SPECTEK', '128 MB', 6862, 11, 128);
INSERT INTO ram VALUES (6862639, 'N/A', '1', 'SPECTEK', '128 MB', 6862, 11, 128);
INSERT INTO ram VALUES (9928189, 'N/A', '01', 'SPECTEK', '256 MB', 99281, 11, 256);
INSERT INTO ram VALUES (17490609, 'N/A', 'N/A', 'KINGSTONE', '1 GB', 174906, 12, 1000);
INSERT INTO ram VALUES (19031319, 'N/A', 'N/A', 'HYNIX', '256 MB', 19031, 11, 256);
INSERT INTO ram VALUES (43148409, 'N/A', 'N/A', 'N/A', '256 MB', 431484, 11, 256);
INSERT INTO ram VALUES (25500199, 'N/A', '1', 'VALUE', '1 GB', 25500, 11, 1000);
INSERT INTO ram VALUES (28218279, 'N/A', '1', 'N/A', '256 MB', 28218, 11, 256);
INSERT INTO ram VALUES (28264009, 'HYMD232 646B8J-J  ', 'N/A', 'HYNIX', '256 MB', 282640, 11, 256);
INSERT INTO ram VALUES (29192109, '0E025932H', 'N/A', 'SPECTEK', '256 MB ', 291921, 11, 256);
INSERT INTO ram VALUES (29192119, '672961B6H', 'N/A', 'HYNIX', '256 MB', 291921, 11, 256);
INSERT INTO ram VALUES (30045319, '53021752H (1377239635)', 'N/A', 'SAMSUNG M3  ', '512 MB', 300453, 12, 512);
INSERT INTO ram VALUES (31018709, '530215ADH', 'N/A', 'SAMSUNG', '512 MB', 310187, 12, 512);
INSERT INTO ram VALUES (31018719, '53021752H', 'N/A', 'SAMSUNG', '512 MB', 310187, 12, 512);
INSERT INTO ram VALUES (31242109, '8112C07BH', 'N/A', 'HYNIX', '256 MB', 312421, 11, 256);
INSERT INTO ram VALUES (31659309, ' F8090A93H (2466908664)', 'N/A', 'SAMSUNG', '512 MB', 316593, 12, 512);
INSERT INTO ram VALUES (32513109, '9905429-002.A00LF', 'N/A', 'KINGSTON', '1 GB', 325131, 12, 1000);
INSERT INTO ram VALUES (32915609, '01018EE5H', 'N/A', 'SPECTEK', '128 MB', 329156, 11, 128);
INSERT INTO ram VALUES (32915619, '01018EE3H', 'N/A', 'SPECTEK', '128 MB', 329156, 11, 128);
INSERT INTO ram VALUES (34493719, '0501CDFDH', 'N/A', 'SPECTEK', '128 MB', 344937, 11, 128);
INSERT INTO ram VALUES (34493729, '0B01D61DH', 'N/A', 'SPECTEK', '128 MB', 344937, 11, 128);
INSERT INTO ram VALUES (36653109, 'VS512MB533D2', 'N/A', 'CORSAIR', '512 MB', 366531, 12, 512);
INSERT INTO ram VALUES (36781359, 'N/A', '1', 'VDATA', '512 MB', 36781, 11, 512);
INSERT INTO ram VALUES (37387509, 'F1181CD4H ', 'N/A', 'SAMSUNG', '512 MB', 373875, 12, 512);
INSERT INTO ram VALUES (37387519, 'F1181CA8H', 'N/A', 'SAMSUNG', '512 MB', 373875, 12, 512);
INSERT INTO ram VALUES (37926509, '8112C07BH', 'N/A', 'HYNIX', '256 MB', 379265, 11, 256);
INSERT INTO ram VALUES (38668709, '646B8J-J', 'N/A', 'HYNIX', '256 MB', 386687, 11, 256);
INSERT INTO ram VALUES (38668719, 'N/A', 'N/A', 'N/A', '256 MB', 386687, 11, 256);
INSERT INTO ram VALUES (40179609, '40169B36H', 'N/A', 'KINGSTON', '2 GB', 401796, 13, 2000);
INSERT INTO ram VALUES (40179619, '40169636H (915805760)', 'N/A', 'KINGSTON', '2 GB', 401796, 13, 2000);
INSERT INTO ram VALUES (41623409, '00004012H', 'N/A', 'HYNIX', '1 GB', 416234, 12, 1000);
INSERT INTO ram VALUES (67734539, 'N/A', '1', 'SUPER TALENT', '1 GB', 67734, 11, 1000);
INSERT INTO ram VALUES (43359309, 'N/A', 'N/A', 'N/A', '256 MB', 433593, 11, 256);
INSERT INTO ram VALUES (44921809, 'N/A', 'N/A', 'N/A', '256 MB', 449218, 11, 256);
INSERT INTO ram VALUES (45839009, 'N/A', 'N/A', 'N/A', '256 MB', 458390, 11, 256);
INSERT INTO ram VALUES (45954609, 'N/A', 'N/A', 'N/A', '256 MB', 459546, 11, 256);
INSERT INTO ram VALUES (47070309, '00004003H', 'N/A', 'HYNIX', '1 GB', 470703, 12, 1000);
INSERT INTO ram VALUES (48542109, '390D248BH ', 'N/A', 'MICRON', '128 MB', 485421, 11, 128);
INSERT INTO ram VALUES (48542119, '00176E03H (57546496)', 'N/A', 'KINGSTON', '128 MB', 485421, 11, 128);
INSERT INTO ram VALUES (48906439, 'N/A', '1', 'WINTEC 2R2', '256 MB', 48906, 13, 256);
INSERT INTO ram VALUES (48906449, 'N/A', '1', 'SPECTEK', '128 MB', 48906, 13, 128);
INSERT INTO ram VALUES (50679609, 'N/A', 'N/A', 'N/A', '512 MB', 506796, 11, 512);
INSERT INTO ram VALUES (52165609, 'N/A', 'N/A', 'SUPERTALENT', '1 GB', 521656, 12, 1000);
INSERT INTO ram VALUES (53687509, 'DQPE1A16', 'N/A', 'A-DATA', '1 GB', 536875, 12, 1000);
INSERT INTO ram VALUES (53540609, 'N/A', 'N/A', 'SUPERTALENT', '1 GB', 535406, 12, 1000);
INSERT INTO ram VALUES (54764009, 'N/A', 'N/A', 'N/A', '256 MB', 547640, 11, 256);
INSERT INTO ram VALUES (54764019, 'CF1C1D14H', 'N/A', 'NANYA', '256 MB', 547640, 11, 256);
INSERT INTO ram VALUES (55456209, 'N/A', 'N/A', 'N/A', '128 MB', 554562, 11, 128);
INSERT INTO ram VALUES (56414009, 'NA2D001G30D', 'N/A', 'NOVATECH', '1 GB', 564140, 12, 1000);
INSERT INTO ram VALUES (56665609, '9905429-002.A00LF', 'N/A', 'KINGSTON', '1 GB', 566656, 12, 1000);
INSERT INTO ram VALUES (56892109, 'VS512MB533D2', 'N/A', 'CORSAIR', '512 MB', 568921, 12, 512);
INSERT INTO ram VALUES (57443709, 'N/A', 'N/A', 'MICRON ', '2 GB', 574437, 13, 2000);
INSERT INTO ram VALUES (58837509, '96FE3C42H', 'N/A', 'KRETON', '1 GB', 588375, 11, 1000);
INSERT INTO ram VALUES (59692109, '01018EE2H', 'N/A', 'SPECTEK', '128 MB', 596921, 11, 128);
INSERT INTO ram VALUES (59692119, '1501C986H', 'N/A', 'SPECTEK', '128 MB', 596921, 11, 128);
INSERT INTO ram VALUES (108593429, 'N/A', 'N/A', 'N/A', '1 GB', 108593, 12, 1000);
INSERT INTO ram VALUES (87312839, 'N/A', '01', 'KINGTONG', '1 GB', 87312, 12, 1000);
INSERT INTO ram VALUES (94343999, 'N/A', 'N/A', 'VALUE SELECT', '1 GB', 94343, 12, 1000);
INSERT INTO ram VALUES (101484179, 'N/A', '1', 'N/A', '256 MB', 101484, 13, 256);
INSERT INTO ram VALUES (103406259, 'N/A', '1', 'TITAN', '1 GB', 103406, 12, 1000);
INSERT INTO ram VALUES (116437509, 'N/A', '1', 'TITAN', '1 GB', 116437, 12, 1000);
INSERT INTO ram VALUES (128140589, 'N/A', '1', 'N/A', '1 GB', 128140, 12, 1000);
INSERT INTO ram VALUES (254265119, 'F1181B0EH', 'N/A', 'SAMSUNG M3', '512 MB', 254265, 12, 512);
INSERT INTO ram VALUES (227937129, 'N/A', 'N/A', 'A-DATA', '1 GB', 227937, 12, 1000);
INSERT INTO ram VALUES (246406369, 'N/A', 'N/A', 'A-DATA', '1 GB', 246406, 12, 1000);
INSERT INTO ram VALUES (254265129, 'F1181C2FH', 'N/A', 'SAMSUNG M3', '512 MB', 254265, 12, 512);
INSERT INTO ram VALUES (11720111424312250, 'n/a', 'pc2100', 'n/a', '256 MB', 117201114243122, 12, 256);
INSERT INTO ram VALUES (265984179, '00013100H', 'N/A', 'KINGSTON', '128 MB', 265984, 13, 128);
INSERT INTO ram VALUES (265984189, 'N/A', 'N/A', 'CLONE', '128 MB', 265984, 13, 128);
INSERT INTO ram VALUES (272312289, '00013100H', 'N/A', 'KINGSTONE', '128 MB', 272312, 13, 128);
INSERT INTO ram VALUES (11720111424312252, 'n/a', 'pc2700', 'SpecTek', '128 MB', 117201114243122, 12, 128);
INSERT INTO ram VALUES (219079, 'N/A', 'N/A', 'SPECTEK', '128 MB', 2190, 11, 128);
INSERT INTO ram VALUES (408009, 'F107E9D6H', 'N/A', 'SAMSUNG', '256 MB ', 4080, 11, 256);
INSERT INTO ram VALUES (4694619, 'N/A', 'N/A', 'SUPERTALENT', '1 GB', 46946, 12, 1000);
INSERT INTO ram VALUES (19326539, '0E025947H', '0E025947H', 'SPECTEK', '256 MB', 193265, 11, 256);
INSERT INTO ram VALUES (30045309, '530215ADH (2903835219)', 'N/A', 'SAMSUNG', '512 MB', 300453, 12, 512);
INSERT INTO ram VALUES (35737509, 'VS512MB533D2', 'N/A', 'CORSAIR', '512 MB', 357375, 12, 512);
INSERT INTO ram VALUES (39915609, 'AE680242H', 'N/A', 'KRETON', '1 GB', 399156, 11, 1000);
INSERT INTO ram VALUES (44876509, 'HYMP112U64CP8-S6 ', 'N/A', 'HYNIX', '1 GB', 448765, 12, 1000);
INSERT INTO ram VALUES (49323409, '67232043H (1126179687)', 'N/A', 'HYNIX', '256 MB', 493234, 11, 256);
INSERT INTO ram VALUES (55456219, '01024E01H (21889537)', 'N/A', 'PRINCETON', '128 MB', 554562, 11, 128);
INSERT INTO ram VALUES (59271809, 'N/A', 'N/A', 'PRINCETON', '256 MB', 592718, 11, 256);
INSERT INTO ram VALUES (61895309, 'N/A', 'N/A', 'N/A', '256 MB', 618953, 11, 256);
INSERT INTO ram VALUES (62625009, 'N/A', 'N/A', 'PRINCETON', '256 MB', 626250, 11, 256);
INSERT INTO ram VALUES (62625019, 'N/A', 'N/A', 'N/A', '32 MB ', 626250, 11, 32);
INSERT INTO ram VALUES (63485909, 'N/A', 'N/A', 'SUPERTALENT ', '1 GB', 634859, 12, 1000);
INSERT INTO ram VALUES (64179609, 'N/A', 'N/A', 'CORSAIR', '512 MB', 641796, 12, 512);
INSERT INTO ram VALUES (64834309, 'B6CC9DD1H', 'N/A', 'KINGSTON ', '1 GB', 648343, 12, 1000);
INSERT INTO ram VALUES (65642109, 'B6CC9DD1H', 'N/A', 'KINGSTON', '1 GB', 656421, 12, 1000);
INSERT INTO ram VALUES (65846809, 'B6CC9DD1H', 'N/A', 'KINGSTON', '1 GB', 658468, 11, 1000);
INSERT INTO ram VALUES (66110909, 'N/A', 'N/A', 'SUPERTALENT', '1 GB', 661109, 12, 1000);
INSERT INTO ram VALUES (66439009, 'N/A', 'N/A', 'SUPERTALENT ', '1 GB', 664390, 11, 1000);
INSERT INTO ram VALUES (67540609, 'N/A', 'N/A', 'CORSAIR', '512 MB', 675406, 12, 512);
INSERT INTO ram VALUES (93687919, 'N/A', '01', 'N/A', '256 MB', 93687, 11, 256);
INSERT INTO ram VALUES (194953329, 'N/A', 'N/A', 'KINGSTON', '1 GB', 194953, 12, 1000);
INSERT INTO ram VALUES (272312279, 'N/A', 'N/A', 'CLONE', '128 MB', 272312, 13, 128);
INSERT INTO ram VALUES (7219309, 'N/A', 'N/A', 'PCCHIPS', '2 GB', 72193, 12, 2000);
INSERT INTO ram VALUES (7279309, 'N/A', 'N/A', 'INTEL', '1 GB', 72793, 11, 1000);
INSERT INTO ram VALUES (71437509, 'N/A', 'N/A', 'N/A', '2 GB', 714375, 12, 2000);
INSERT INTO ram VALUES (70218709, '99U5474-010.A00LF', '1A0A6ACDH (3446278682)', 'KINGSTON', '2 GB', 702187, 13, 2000);
INSERT INTO ram VALUES (69851509, '99U5429-003.A00LF', 'N/A', 'KINGSTON', '1 GB', 698515, 12, 1000);
INSERT INTO ram VALUES (67893709, 'CM2X1024-6400   ', 'N/A', 'CORSAIR', '1 GB', 678937, 12, 1000);
INSERT INTO ram VALUES (2762011101550703033, 'No tiene', 'No tiene', 'Markvision', '1 GB', 27620111015507030, 12, 1000);


--
-- TOC entry 2249 (class 0 OID 16486)
-- Dependencies: 1733
-- Data for Name: reguladores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO reguladores VALUES (2272011113177654, 'n/a', 'INTEGRA', 'N/A', 6, 'AIDE BEAMONT', 16, 1, '', 'ADM16', NULL, NULL);
INSERT INTO reguladores VALUES (1715, 'N/A', 'INTEGRA', 'N/A', 6, 'ADM07', 3, 1, 'NINGUNA', 'ADM07', NULL, NULL);
INSERT INTO reguladores VALUES (2315, 'N/A', 'INTEGRA', 'N/A', 6, 'MARIA RODRIGUEZ', 14, 1, 'NINGUNA', 'ADM36', NULL, NULL);
INSERT INTO reguladores VALUES (27546, 'N/A', 'AUSE', 'N/A', 6, 'ADM22', 14, 1, 'NINGUNA', 'ADM22', NULL, NULL);
INSERT INTO reguladores VALUES (2993, 'N/A', 'CDP', 'N/A', 6, 'NEYDA', 3, 1, 'NINGUNA', 'AMD09', NULL, NULL);
INSERT INTO reguladores VALUES (65437, 'N/A', 'LG', 'N/A', 6, 'MORAIMA KEY', 11, 1, 'NINGUNA', 'SALA12', 24, 'FOR PC''S');
INSERT INTO reguladores VALUES (8315, 'N/A', 'KODE', 'BE-56397-D', 6, 'MAURA', 16, 1, 'NINGUNA', 'ADM37', 24, 'N/A');
INSERT INTO reguladores VALUES (92437, '5827700066', 'KODE', 'BE: 59150-D', 6, 'PRESI01', 23, 1, 'NINGUNA', 'PRESI01', 24, 'K-AVR 1006');
INSERT INTO reguladores VALUES (11431, 'N/A', 'N/A', 'N/A', 6, 'LORENA', 0, 1, 'NINGUNA', 'ADM30', 24, 'N/A');
INSERT INTO reguladores VALUES (178156, 'N/A', 'AVTEK', 'N/A', 6, 'ADM11', 3, 1, 'NINGUNA', 'ADM11', 24, 'RPC PLUS');
INSERT INTO reguladores VALUES (211984, '582770066', 'KODE', '58669-D', 6, 'DR MIGUEL TERAN', 21, 1, 'BIEN', 'EPI03', 24, 'N/A');
INSERT INTO reguladores VALUES (218687, '130803721', 'AUTEK', '51644', 6, 'ONCOLOGIA', 21, 1, 'BIEN', 'EPI02', 24, 'N/A');
INSERT INTO reguladores VALUES (231125, 'N/A', 'KODE', '54365', 6, 'JANIC TORRE', 21, 1, 'BIEN', 'EPI09', 24, 'N/A');
INSERT INTO reguladores VALUES (239265, '071112-1295593', 'CODE', '56320-D', 6, 'LORENA GUEVARA', 21, 1, 'NINGUNA', 'EPI16', 24, 'N/A');
INSERT INTO reguladores VALUES (251984, 'N/A', 'KODE', 'N/A', 6, 'LILIAN DELGADO', 21, 1, 'NINGUNA', 'EPI04', 24, 'N/A');
INSERT INTO reguladores VALUES (262671, '3L0634X15335', 'APC', ' 3575270', 6, 'MIGDALIA SEIJAS', 21, 1, 'NINGUNA', 'EPI18', 24, 'LEI1200');
INSERT INTO reguladores VALUES (277375, 'N/A', 'N/A', '56809', 6, 'MAIRELIS ASCANIO', 21, 1, 'NINGUNA', 'EPI11', 24, 'N/A');
INSERT INTO reguladores VALUES (298187, 'N/A', 'N/A', '2795763', 6, 'YENI LISARAZO', 21, 1, 'NINGUNA', 'EPI06', 24, 'N/A');
INSERT INTO reguladores VALUES (305937, 'N/A', 'APC', 'N/A', 6, 'CARLOS VELES', 21, 1, 'NINGUNA', 'EPI13', 24, 'N/A');
INSERT INTO reguladores VALUES (323187, 'X04D93185', 'N/A', '53233', 6, 'NOREXIS ACOSTA', 21, 1, 'NINGUNA', 'EPI14', 24, 'N/A');
INSERT INTO reguladores VALUES (334234, 'N/A', 'INTEGRA', 'S-19915', 6, 'MARTA FERRERO', 21, 1, 'NINGUNA', 'EPI08', 24, 'N/A');
INSERT INTO reguladores VALUES (341875, 'N/A', 'N/A', 'N/A', 6, 'PATRICIA AMUNDARAY', 21, 1, 'EN MUY MAL ESTADO', 'EPI15', 24, 'N/A');
INSERT INTO reguladores VALUES (349703, 'N/A', 'INTEGRA', '20455', 6, 'CARLA TORTOLEDO', 12, 1, 'NINGUNA', 'CONTRA06', 24, 'N/A');
INSERT INTO reguladores VALUES (367156, 'N/A', 'SONEVIEW', '54341-D', 6, 'MIRIAM LA CRUZ', 21, 1, 'NINGUNA', 'EPI12', 24, 'ABR1000M');
INSERT INTO reguladores VALUES (376187, 'N/A', 'AVTEK', '50501', 6, 'JOSE ANGEL', 21, 1, 'NINGUNA', 'EPI10', 24, 'N/A');
INSERT INTO reguladores VALUES (384296, '20099', 'AVTEK', 'N/A', 6, 'DR. RAMON RIVAS', 21, 1, 'NINGUNA', 'EPI05', 24, 'N/A');
INSERT INTO reguladores VALUES (391468, 'N/A', 'APC', '3575280', 6, 'DR. ERNESTO FLORES', 0, 1, 'NINGUNA', 'EPI17', 24, 'LE600');
INSERT INTO reguladores VALUES (397437, 'N/A', 'N/A', 'N/A', 6, 'ALICIA HERNANDEZ', 21, 1, 'NO POSEE REGULADOR, ESTA CONECTADO DIRECTO DESDE LA TOMA DE CORRIENTE', 'EPI20', 24, 'N/A');
INSERT INTO reguladores VALUES (406343, 'N/A', 'AVR', '55467-E', 6, 'MARIA ZAMBRANO', 21, 1, 'NINGUNA', 'EPI19', 24, '1000M');
INSERT INTO reguladores VALUES (413671, '916188', 'CDP', '3419868', 6, 'ALFREDO MUSURUARAR', 12, 1, 'NINGUNA', 'CONTRA01', 24, 'N/A');
INSERT INTO reguladores VALUES (424515, '081121-1291179', 'CDP', 'N/A', 6, 'HIGIENE', 12, 1, 'NINGUNA', 'CONTRA09', 24, 'N/A');
INSERT INTO reguladores VALUES (429812, 'EXAFE1000VA', 'N/A', 'N/A', 6, 'INGENIERIA SANITARIA', 12, 1, 'NINGUNA', 'CONTRA05', 24, 'N/A');
INSERT INTO reguladores VALUES (438296, 'N/A', 'CDP', '53185', 6, 'DROGAS Y COSMETICOS', 0, 1, 'NINGUNA', 'CONTRA02', 24, 'N/A');
INSERT INTO reguladores VALUES (440796, 'N/A', 'CDP', '53185', 6, 'DROGAS Y COSMETICOS', 12, 1, 'NINGUNA', 'CONTRA02', 24, 'N/A');
INSERT INTO reguladores VALUES (446453, 'N/A', 'INTEGRA', '30055', 6, 'JACKELINE PEREZ', 12, 1, 'NINGUNA', 'CONTRA16', 24, 'N/A');
INSERT INTO reguladores VALUES (455343, '5827700040', 'CDP', 'N/A', 6, 'SECRETARIA CONTRALORIA SNAITARIA', 12, 1, 'NINGUNA', 'CONTRA08', 24, 'B-AVR1006');
INSERT INTO reguladores VALUES (464437, '05101-1300884', 'CDP', '53183', 6, 'YAMILA DAGGELT', 12, 1, 'NINGUNA', 'CONTRA07', 24, 'N/A');
INSERT INTO reguladores VALUES (477359, '0085001010658', 'AUSE  ', 'N/A', 6, 'SACS', 12, 1, 'NINGUNA', 'CONTRA10', 24, 'PCG-1200');
INSERT INTO reguladores VALUES (481640, '5827700040', 'DCP', 'N/A', 6, 'SACS', 12, 1, 'NINGUNA', 'CONTRA11', 24, 'N/A');
INSERT INTO reguladores VALUES (491796, '071112-1295602', 'KODE', '56394-D', 6, 'FRANKLIN RIVERO', 12, 1, 'NINGUNA', 'CONTRA12', 24, 'N/A');
INSERT INTO reguladores VALUES (510250, 'N/A', 'N/A', 'N/A', 6, 'SUPERVISORES AUDITORIA', 12, 1, 'NO TIENE REGULADOR', 'CONTRA15', 24, 'N/A');
INSERT INTO reguladores VALUES (529203, '0826013975', 'AUSE', '58312-D', 6, 'SNELL ESPINOZA', 12, 1, 'NINGUNA', 'CONTRA19', 24, '4A5061');
INSERT INTO reguladores VALUES (533859, 'N/A', 'INTEGRA', '20465', 6, 'VIRGINIA DUQUE', 12, 1, 'NINGUNA', 'CONTRA13', 24, 'N/A');
INSERT INTO reguladores VALUES (54346, '07112-1297364', 'KODE', '56270-D', 6, 'LIC ALBA AVILA', 12, 1, 'NINGUNA', 'CONTRA20', 24, 'N/A');
INSERT INTO reguladores VALUES (552671, '5322905101-1300886', 'CDP', 'N/A', 6, 'HELEN TOVAR', 18, 1, 'NINGUNA', 'DGS01', 24, 'N/A');
INSERT INTO reguladores VALUES (559453, '1050001020531', 'OMEGA', 'N/A', 6, 'MEDICINA VIAL Y ESTADISTICA', 18, 1, 'NINGUNA', 'DGS04', 24, 'N/A');
INSERT INTO reguladores VALUES (572718, '20080522272', 'AVTEK', '58219', 6, 'LUZ MIRIAM', 18, 1, 'NINGUNA', 'DGS02', 24, 'RTCPLUS600');
INSERT INTO reguladores VALUES (585484, 'N/A', 'INTEGRA', '19262', 6, 'ING. CARELIS LUGO', 18, 1, 'NINGUNA', 'DGS03', 24, 'N/A');
INSERT INTO reguladores VALUES (590515, '5827700066', 'KODE', '58668-B', 6, 'FELIX BERMUDEZ', 18, 1, 'NINGUNA', 'DGS06', 24, 'N/A');
INSERT INTO reguladores VALUES (593453, 'N/A', 'SONEVIEW', '55095-D', 6, 'DR CARLOS VIVAS', 18, 1, 'NINGUNA', 'DGS08', 24, 'AVR 1000M');
INSERT INTO reguladores VALUES (604984, 'WZ21101517705', 'TECAM', 'N/A', 6, 'GERMAN SANTOS', 18, 1, 'NINGUNA', 'DGS05', 24, 'TTR-1000A');
INSERT INTO reguladores VALUES (612656, 'N/A', 'INTEGRA', '19982', 6, 'ZORAIDA GONZALEZ', 18, 1, 'NINGUNA', 'DGS07', 24, 'N/A');
INSERT INTO reguladores VALUES (616750, 'N/A', 'KODE', 'N/A', 6, 'ROGELIO HERNANDEZ', 18, 1, 'NINGUNA', 'DGS11', 24, 'N/A');
INSERT INTO reguladores VALUES (624234, 'N/A', 'KODE', '54363', 6, 'RODRIGUEZ ALEXIS', 18, 1, 'NINGUNA', 'DGS13', 24, 'N/A');
INSERT INTO reguladores VALUES (631890, 'N/A', 'OMEGA', 'N/A', 6, 'GESTION DE SERVICIOS', 18, 1, 'NINGUNA', 'DGS09', 24, '4A50B1SVE1');
INSERT INTO reguladores VALUES (639671, '0826000700', 'AUSE', '58304-D', 6, 'CAROLINA', 18, 1, 'NINGUNA', 'DGS10', 24, 'PCG 1200');
INSERT INTO reguladores VALUES (646406, 'N/A', 'SONEVIEW', '55087-D', 6, 'LIC. LEIDY OJEDA', 18, 1, 'NINGUNA', 'DGS14', 24, 'AVR 1000M');
INSERT INTO reguladores VALUES (654765, '081008-1291855', 'KODE', '58667-D', 6, 'DIRECCION DE SALUD', 18, 1, 'NINGUNA', 'DGS12', 24, 'K-AVR1006');
INSERT INTO reguladores VALUES (66993, '3012031674', 'AVETEK', '55023', 6, 'JUDITH ACASIO', 0, 1, 'NINGUNA', 'TRAN02', 24, 'N/A');
INSERT INTO reguladores VALUES (683515, '07011169E', 'SONEVIEW', '55189-D', 6, 'CUARTO FRIO', 9, 1, 'NINGUNA', 'CUARTO01', 24, 'AVR1000N');
INSERT INTO reguladores VALUES (688687, 'N/A', 'INTEGRA', '18456', 6, 'HENNYER MIJARES', 0, 1, 'NINGUNO', 'ADM01', 24, 'N/A');
INSERT INTO reguladores VALUES (696437, 'N/A', 'CDP', '53121', 6, 'MARISOL JIMENEZ', 17, 1, 'NINGUNO', 'ADM03', 24, 'N/A');
INSERT INTO reguladores VALUES (713218, 'N/A', 'TECAN', 'N/A', 6, 'ADM09', 3, 1, 'NO', 'ADM09', 24, 'N/A');
INSERT INTO reguladores VALUES (718281, '61723', 'OMEGA', '61723', 6, 'ADM10', 3, 1, 'NO', 'ADM10', 24, 'N/A');
INSERT INTO reguladores VALUES (726406, '17271', 'INTEGRA', '17271', 6, 'ADM11', 3, 1, 'NO', 'ADM11', 24, 'N/A');
INSERT INTO reguladores VALUES (733437, '18456', 'INTEGRA', '18456', 6, 'HENNYER MIJARES', 3, 1, 'NO', 'ADM01', 24, 'N/A');


--
-- TOC entry 2250 (class 0 OID 16492)
-- Dependencies: 1734
-- Data for Name: softequip; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO softequip VALUES (4, 4, 'Visual Studio 2010, Macromedia 8', 'Ninguno', NULL, '');
INSERT INTO softequip VALUES (5, 4, 'completas', 'sis, adm rrhh, aplicaciones web', NULL, '');
INSERT INTO softequip VALUES (6, 4, 'acronis, everest, winrar, avast 4.8, usb disk security 6, firefox 3.6, internet explorer 8, office 2003 compat. 2007, adobe reader 9, klite, solid pdf, ccleaner, centura 2.1, netsupport.', 'Sistema General 2008.', NULL, '');
INSERT INTO softequip VALUES (7, 4, 'CORPODVD AVAST 4.8 USB DISC  SECURITY 6', 'ADM 2008, ADM 2006, ADM 99', NULL, '');
INSERT INTO softequip VALUES (8, 4, 'prueba', 'prueba', NULL, 'prueba');
INSERT INTO softequip VALUES (9, 4, 'prueba', 'prueba', NULL, 'prueba');
INSERT INTO softequip VALUES (10, 4, 'CORPODVD', 'SIS', NULL, 'NO SE INSTALO ACRONIZ POCO ESPACIO EN DISCO');
INSERT INTO softequip VALUES (11, 4, 'CORPODVD', 'ALMACE, ALMACEN EXISTENCIA', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (12, 4, 'prueba', 'prueba', NULL, 'prueba');
INSERT INTO softequip VALUES (13, 4, 'ACRONIS, CENTURA 2.1, SOLID DOCUMENTS, ADOBE READER 9, AVAST 4.8, MICROSOFT OFFICE 2003, TERA COPY, USB SECURITY 6, CCLEANER, NETSUPPORT TUNE UP UTIL 2009, WINRAR', 'SISTEMA GENERAL 1999, SISTEMA GENERAL 2006, SISTEMA GENERAL 2008.', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (14, 4, 'ACRONIS, AVAST SECURITY 6, EVEREST, USB DISK SECURITY, CCLEANER, CENTURA 2.1, NET SUPPRT, SOLID DOCUMENTS, ADOBE READER, MICROSOFT OFFICE 2003.', 'SISTEMA GENERAL 2006, SISTEMA GENERAL 2008.', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (15, 4, 'USB SECURITY 6, AVAST 6, ACRONIS, NETSUPPORT, CENTURA 2.1, OFFICE 2003', 'SISTEMA GENERAL 2006, SISTEMA GENERAL 2008', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (16, 4, 'ADOBE READER, AVAST 4.8, USB SECURITY 6, WINRAR, OFFICE 2003, NET SUPPORT, CENTURA 2.1, EVEREST, CCLEANER, SOLID PDF, FIREFOX 3.6, IE8, ACRONIS, OFFICE 2007', 'SISTEMA GENERAL 2006 , SISTEMA GENERAL 2008', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (17, 4, 'ACRONIS, EVEREST, OFFICE 2007, FIREFOX, IE8, CENTURA 2.1, AVAST 6, USB SECURITY 6, NET SUPPORT, CCLEANER, ADOBE READER 9,NET FRAMEWORK, WINRAR', 'SISTEMA GENERAL 2008', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (18, 4, 'OFFICE 2003, IE8, NET SUPPORT, WINRAR, ADOBE READER 9, EVEREST.', 'ACCESO DIRECTO A (Z): FE DE VIDA 2010', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (19, 4, 'USB DISK SECURITY 6, AVAST 6, CENTURA 2.1', 'SISTEMA GENERAL 2008', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (20, 4, 'OFFICE 2003, AVAST 4.8, CENTURA 2.1, ORACLE 10G, WINRAR, CCLEANNER, ADOBE READER 9, USB SECURITY 6, EVEREST, ACRONIS, NETSSUPRT', 'SISTEMA GENERAL 2008', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (21, 4, 'OFFICCE 2003, CLEANER, ADOBE READER 9, NERO 8, EVEREST, WINRAD, ACRONIS, AVAST 6, MOZCILLA, IE8, USB SECURITY 6.', 'NINGUNA', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (22, 4, 'OFFICCE 2003, AVAST, EVEREST, IE8, MOZCILLA, ADOBE READER.', 'NINGUNA', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (23, 4, 'IE8, PARCHES, USB6, EVEREST, FIREFOX 3.6, NET SUPPORT, WINRAR, OFFICCE 2003, CENTURA 2.1, AVAST 6, ACORNIS. ', 'NINGUNA', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (24, 4, 'ACRONIS, USB DISK SECURITY 6, AVAST 4.8, OFFICE 2003, ADOBE READER 9.', 'SISTEMAS ADMINISTRATIVOS.', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (25, 4, 'AVAST4.8, ACLEANER, WINRAR, IE, ADOBE READER 9, USB DISKSECURITY, ORACLE 10G, NETSUPPORT, ACRONIS, MOZILLA.', 'SISTEMA GENERAL 2006, SISTEMA GENERAL 2008', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (26, 4, 'AVAST6, CCLEANNER, WINRAR, IE, ADOBE READER 9, USB DISKSECURITY, ORACLE 10G, NETSUPPORT, MOZILLA, ACRONIS, CENTURA 2.1, CENTURA 1.5, OFFICE 2007.', 'NINGUNO', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (27, 4, 'AVAST6, CCLEANNER, WINRAR, IE, ADOBE READER, USB DISK SECURITY, NETSUPPORT, MOZILLA, ACRONIS, CENTURA 2.1', 'SISTEMA GENERAL  2006-2007, SISTEMA GENERAL 2008-2010, SISTEMA GENERAL1999-2005', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (28, 4, 'AVAST6,CCLEANNE, WINRAR, IE, ADOBE READER, USB SECURITY, ORACLE 10G, NETSUPPORT, MOZILLA, ACRONIS, CENTURA 2.1, CENTURA 1.5', 'NINGUNO', NULL, 'NINGUNO');
INSERT INTO softequip VALUES (29, 4, 'OFFICE 2003, USB DISK SECURITY, NERO, MOZILLA, WINRAR, ADOBE READER 7.0, NET SUPPORT, AVAST 6, ACRONIS.', 'SISTEMA GENERAL 2008', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (31, 4, 'FHGFH', 'GFHGF', NULL, 'FGHGFH');
INSERT INTO softequip VALUES (32, 4, 'DFGFGDFG', 'FGDFG', NULL, 'FGD');
INSERT INTO softequip VALUES (33, 4, 'CORPODVD 2.0', 'ADM Y RRHH', NULL, 'ACTUALIZAR ANTIVIRUS');
INSERT INTO softequip VALUES (34, 4, 'CORPO-DVD', 'SALUD', NULL, 'LAS APLIACCIONES LAS REALIZA CON LENTITUD. ');
INSERT INTO softequip VALUES (35, 4, 'CORPO-DVD', 'SALUD', NULL, 'NIGUNA');
INSERT INTO softequip VALUES (36, 4, 'CORPO-DVD', 'SALUD', NULL, 'OPTIMA');
INSERT INTO softequip VALUES (37, 4, 'CORPO-DVD', 'SALUD', NULL, 'OPTIMA');
INSERT INTO softequip VALUES (38, 4, 'CORPO-DVD', 'SALUD', NULL, 'OPTIMA');
INSERT INTO softequip VALUES (39, 4, 'CORPO-DVD', 'SALUD', NULL, 'OPTIMA');
INSERT INTO softequip VALUES (40, 4, 'CORPO-DVD', 'SALUD', NULL, 'OPTIMA');
INSERT INTO softequip VALUES (41, 4, 'CORPO-DVD', 'SALUD', NULL, 'OPTIMA');
INSERT INTO softequip VALUES (42, 4, 'CORPO-DVD', 'SALUD', NULL, 'OPTIMA');
INSERT INTO softequip VALUES (43, 4, 'CORPO-DVD', 'SALUD', NULL, 'OPTIMA');
INSERT INTO softequip VALUES (44, 4, 'CORPO-DVD', 'SALUD', NULL, 'OPTIMA');
INSERT INTO softequip VALUES (45, 4, 'CORPO-DVD', 'SALUD', NULL, 'OPTIMA');
INSERT INTO softequip VALUES (46, 4, 'CORPO-DVD', 'SALUD', NULL, 'CON VIRUS');
INSERT INTO softequip VALUES (47, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (48, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (49, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (50, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (70, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (51, 4, 'CORPO-DVD', 'SALUD', 'N/A', 'NINGUNA');
INSERT INTO softequip VALUES (53, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (54, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (55, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (56, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (57, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (58, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (59, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (60, 4, 'CORPO-DVD', 'SIS', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (61, 4, 'CORPO-DVD', 'SIS', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (62, 4, 'CORPO-DVD', 'SIS', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (63, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (64, 4, 'CORPODVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (65, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (66, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (67, 4, 'CORPODVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (68, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (69, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (71, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (72, 4, 'CORPODVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (73, 0, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (74, 4, 'CORPODVD', 'NINGUA', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (75, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (76, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (77, 4, 'CORPO-DVD', 'SALUD', NULL, 'MUY LENTO');
INSERT INTO softequip VALUES (78, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (79, 6, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (80, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (81, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (82, 4, 'CORPODVD', 'NINGUNO', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (83, 4, 'CORPD-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (84, 0, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (85, 0, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (86, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (87, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (88, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (89, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (90, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (91, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (92, 6, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (93, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (94, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (95, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (96, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (97, 4, 'CORPO-DVD', 'CIRUGIA AMBULATORIA, OPERACION MILAGRO', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (98, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (99, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (100, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (101, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (102, 0, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (103, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (104, 4, 'CORPO-DVD', 'SALUD', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (105, 4, 'CORPO-DVD', 'NINGUNO', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (106, 4, 'CORPO-DVD', 'ALMACEN', NULL, 'SIN OBSERVACION');
INSERT INTO softequip VALUES (107, 4, 'CORPO-DVD', 'SISTEMA DE ADMINISTRACION', NULL, 'NINGUNA');
INSERT INTO softequip VALUES (108, 4, 'CORPODVD', 'SISTEMA DE ADMON', NULL, 'N/A');
INSERT INTO softequip VALUES (109, 4, 'CORPODVD', 'SISTEMA DE ADMINISTRACION', NULL, 'NINGUNO');
INSERT INTO softequip VALUES (110, 6, 'LKÑJN', 'LKMNÑ', NULL, 'LMÑK N');
INSERT INTO softequip VALUES (111, 0, 'NO', 'NO', NULL, 'NO');
INSERT INTO softequip VALUES (112, 6, 'NO', 'NO', NULL, 'NO');
INSERT INTO softequip VALUES (113, 4, 'NO', 'NO', NULL, 'NO');


--
-- TOC entry 2251 (class 0 OID 16498)
-- Dependencies: 1735
-- Data for Name: software; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO software VALUES (6, 0, 0, 0, 0, 0, 1, 0, 'no abren los archivos de excel');
INSERT INTO software VALUES (7, 1, 0, 0, 0, 0, 0, 0, 'dfgsdg');
INSERT INTO software VALUES (8, 0, 0, 1, 0, 0, 0, 0, 'esta muy lento y se queda colgado');
INSERT INTO software VALUES (9, 1, 0, 0, 0, 0, 0, 0, '');
INSERT INTO software VALUES (10, 0, 0, 0, 0, 0, 0, 1, '');
INSERT INTO software VALUES (11, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO software VALUES (12, 0, 0, 1, 0, 0, 0, 0, 'SE REINICIA');
INSERT INTO software VALUES (13, 0, 0, 1, 0, 0, 0, 0, 'WINDOWS NO ARRANCA');
INSERT INTO software VALUES (14, 0, 0, 1, 0, 0, 0, 0, 'WINDOWS NO ARRANCA');
INSERT INTO software VALUES (15, 0, 0, 1, 0, 0, 0, 0, 'WINDOWS FALLA AL ARRANCAR');


--
-- TOC entry 2252 (class 0 OID 16501)
-- Dependencies: 1736
-- Data for Name: sonido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sonido VALUES (2762011101550703039, 'Integrada', 'null', 'No tiene', 'Integrada', 36, 27620111015507030);
INSERT INTO sonido VALUES (3062011142146515147, 'INTEGRADA', 'null', 'N/A', 'INTEGRADA', 36, 30620111421465151);
INSERT INTO sonido VALUES (277201111240828498, 'REALTEK ALC200', 'null', 'N/A', 'INTEGRADA', 36, 2772011112408284);
INSERT INTO sonido VALUES (11720111424312260, 'intel', 'null', 'n/a', '82801eb ICH5', 36, 117201114243122);
INSERT INTO sonido VALUES (13187712, 'INTEGRADA', 'N/A', 'N/A', 'N/A', 36, 13187);
INSERT INTO sonido VALUES (217501712, 'INTEGRADA', 'N/A', 'N/A', 'N/A', 36, 21750);
INSERT INTO sonido VALUES (255002512, 'INTEGRADA', 'N/A', 'N/A', 'N/A', 36, 25500);
INSERT INTO sonido VALUES (282183312, 'REALTEK', 'N/A', 'N/A', 'N/A', 36, 28218);
INSERT INTO sonido VALUES (367814112, 'INTEGRADA', 'N/A', 'N/A', 'N/A', 36, 36781);
INSERT INTO sonido VALUES (489065012, 'INTEGRADA INTEL', 'N/A', 'N/A', 'N/A', 36, 48906);
INSERT INTO sonido VALUES (677346012, 'INTEGRADA', 'N/A', 'N/A', '1', 36, 67734);
INSERT INTO sonido VALUES (68627012, 'REALTEK', 'N/A', 'ALC101', 'N/A', 36, 6862);
INSERT INTO sonido VALUES (873128812, 'N/A', 'N/A', 'N/A', 'N/A', 36, 87312);
INSERT INTO sonido VALUES (936879712, 'N/A', 'N/A', 'N/A', 'N/A', 36, 93687);
INSERT INTO sonido VALUES (94343612, 'N/A', 'N/A', 'N/A', 'N/A', 36, 94343);
INSERT INTO sonido VALUES (992811412, 'N/A', 'N/A', 'N/A', 'N/A', 36, 99281);
INSERT INTO sonido VALUES (1014842312, 'N/A', 'N/A', 'N/A', '1', 36, 101484);
INSERT INTO sonido VALUES (1034063112, 'N/A', 'N/A', 'N/A', '1', 36, 103406);
INSERT INTO sonido VALUES (1085934812, 'N/A', 'N/A', 'N/A', 'N/A', 36, 108593);
INSERT INTO sonido VALUES (1164375612, 'N/A', 'N/A', 'N/A', 'N/A', 36, 116437);
INSERT INTO sonido VALUES (1281406412, 'N/A', 'N/A', 'N/A', '1', 36, 128140);
INSERT INTO sonido VALUES (174906612, 'REALTEK', 'N/A', 'N/A', 'N/A', 36, 174906);
INSERT INTO sonido VALUES (1932651212, 'REALTEK ', 'B-0', 'N/A', '82801DB', 36, 193265);
INSERT INTO sonido VALUES (190312912, 'INTEL', 'N/A', 'N/A', 'N/A', 36, 19031);
INSERT INTO sonido VALUES (21901612, 'INTEL 82801EB', 'N/A', 'NÇ', 'N/A', 36, 2190);
INSERT INTO sonido VALUES (227937612, 'VIA', 'N/A', 'N/A', 'N/A', 36, 227937);
INSERT INTO sonido VALUES (2464064112, 'VIA', 'N/A', 'N/A', 'N/A', 36, 246406);
INSERT INTO sonido VALUES (254265712, 'REALTEK', 'N/A', 'N/A', 'N/A', 36, 254265);
INSERT INTO sonido VALUES (2659842512, 'INTEL', 'N/A', 'N/A', 'N/A', 36, 265984);
INSERT INTO sonido VALUES (2723123412, 'REALTEK', 'N/A', 'N/A', 'N/A', 36, 272312);
INSERT INTO sonido VALUES (280140612, 'PRUEBA', 'PRUEBA', 'ROBETORR', 'PRUEBA', 35, 280140);
INSERT INTO sonido VALUES (282640612, 'INTEL', 'N/A', '82801EB', 'N/A', 36, 282640);
INSERT INTO sonido VALUES (291921812, 'INTEL', 'N/A', 'AD1981B', 'N/A', 36, 291921);
INSERT INTO sonido VALUES (300453712, 'INTEL', 'N/A', 'N/A', 'N/A', 36, 300453);
INSERT INTO sonido VALUES (310187712, 'INTEL', 'N/A', 'N/A', 'N/A', 36, 310187);
INSERT INTO sonido VALUES (312421612, 'INTEL', 'N/A', '82801EB ICH5', 'N/A', 36, 312421);
INSERT INTO sonido VALUES (316593512, 'INTEL', 'N/A', '82801GB ICH7', 'N/A', 36, 316593);
INSERT INTO sonido VALUES (325131612, 'SIGMATEL', 'N/A', 'STAC9221', 'N/A', 36, 325131);
INSERT INTO sonido VALUES (329156712, 'REALTEK', 'N/A', 'ALC101', 'N/A', 36, 329156);
INSERT INTO sonido VALUES (33662712, 'REALTEK', 'N/A', 'ALC101', 'N/A', 36, 33662);
INSERT INTO sonido VALUES (344937812, 'REALTEK', 'N/A', 'ALC101', 'N/A', 36, 344937);
INSERT INTO sonido VALUES (357375612, 'REALTEK ', 'N/A', 'ALC655', 'N/A', 35, 357375);
INSERT INTO sonido VALUES (35831612, 'INTEL', 'N/A', '82865G', 'N/A', 36, 35831);
INSERT INTO sonido VALUES (366531612, 'REALTEK', 'N/A', 'N/A', 'N/A', 35, 366531);
INSERT INTO sonido VALUES (379265612, 'ANALOG DEVICES ', 'N/A', 'AD1981B', 'N/A', 36, 379265);
INSERT INTO sonido VALUES (373875712, 'INTEL', 'N/A', 'N/A', 'N/A', 35, 373875);
INSERT INTO sonido VALUES (386687812, 'SIS', 'N/A', 'N/A', 'N/A', 36, 386687);
INSERT INTO sonido VALUES (399156612, 'REALTEK', 'N/A', 'ALC655', 'N/A', 36, 399156);
INSERT INTO sonido VALUES (4080612, 'ANALOG DEVICES', 'N/A', 'AD1981B', 'N/A', 36, 4080);
INSERT INTO sonido VALUES (416234612, 'INTEL', 'N/A', '82801JB', 'N/A', 36, 416234);
INSERT INTO sonido VALUES (401796712, 'REALTEK', 'N/A', 'ALC662', 'N/A', 35, 401796);
INSERT INTO sonido VALUES (433593612, 'REALTEK', 'N/A', 'ALC655', 'N/A', 36, 433593);
INSERT INTO sonido VALUES (431484612, 'C-MEDIA', 'N/A', 'CMI9739A/9761', 'N/A', 36, 431484);
INSERT INTO sonido VALUES (448765612, 'ANALOG DEVICES', 'N/A', '82801JB ', 'N/A', 35, 448765);
INSERT INTO sonido VALUES (449218612, 'REALTEK', 'N/A', 'N/A', 'N/A', 36, 449218);
INSERT INTO sonido VALUES (458390612, 'REALTEK', 'N/A', 'N/A', 'N/A', 36, 458390);
INSERT INTO sonido VALUES (459546612, 'REALTEK', 'N/A', 'ALC655', 'N/A', 35, 459546);
INSERT INTO sonido VALUES (46946712, 'REALTEK', 'N/A', 'ALC662', 'N/A', 35, 46946);
INSERT INTO sonido VALUES (470703512, 'INTEL', 'N/A', '2801JB ICH10', 'N/A', 36, 470703);
INSERT INTO sonido VALUES (485421712, 'ANALOG DEVICES', 'N/A', 'AD1981A', 'N/A', 36, 485421);
INSERT INTO sonido VALUES (48646712, 'REALTEK', 'N/A', '82801GB ICH7', 'N/A', 35, 48646);
INSERT INTO sonido VALUES (493234612, 'ANALOG DEVICES', 'N/A', 'AD1981B', 'N/A', 36, 493234);
INSERT INTO sonido VALUES (506796612, 'INTEL', 'N/A', '82801EB', 'N/A', 36, 506796);
INSERT INTO sonido VALUES (521656612, 'REALTEK ', 'N/A', 'ALC655', 'N/A', 36, 521656);
INSERT INTO sonido VALUES (5220612, 'C-MEDIA ', 'N/A', 'CMI9739A/9761', 'N/A', 35, 5220);
INSERT INTO sonido VALUES (535406612, 'REALTEK ', 'N/A', 'ALC655', 'N/A', 36, 535406);
INSERT INTO sonido VALUES (536875612, 'INTEL', 'N/A', '82801GB ICH7', 'N/A', 36, 536875);
INSERT INTO sonido VALUES (547640712, 'REALTEK', 'N/A', 'ALC655', 'N/A', 36, 547640);
INSERT INTO sonido VALUES (554562712, 'ANALOG DEVICES', 'N/A', 'AD1881', 'N/A', 36, 554562);
INSERT INTO sonido VALUES (564140612, 'REALTEK', 'N/A', 'ALC888/1200', 'N/A', 36, 564140);
INSERT INTO sonido VALUES (574437612, 'REALTEK', 'N/A', 'ALC662', 'N/A', 36, 574437);
INSERT INTO sonido VALUES (568921612, 'REALTEK ', 'N/A', 'ALC655', 'N/A', 36, 568921);
INSERT INTO sonido VALUES (566656612, 'SIGMATEL', 'N/A', 'STAC9221', 'N/A', 36, 566656);
INSERT INTO sonido VALUES (588375712, 'REALTEK', 'N/A', 'ALC880(D)', 'N/A', 36, 588375);
INSERT INTO sonido VALUES (596921712, 'REALTEK ', 'N/A', 'ALC101', 'N/A', 36, 596921);
INSERT INTO sonido VALUES (592718612, 'ANALOG DEVICES', 'N/A', 'AD1881', 'N/A', 36, 592718);
INSERT INTO sonido VALUES (618953612, 'REALTEK', 'N/A', 'ALC655', 'N/A', 36, 618953);
INSERT INTO sonido VALUES (626250712, 'ANALOG DEVICES', 'N/A', 'AD1881', 'N/A', 36, 626250);
INSERT INTO sonido VALUES (634859612, 'VIA', 'N/A', 'VT1708', 'N/A', 36, 634859);
INSERT INTO sonido VALUES (641796612, 'REALTEK', 'N/A', 'ALC655', 'N/A', 36, 641796);
INSERT INTO sonido VALUES (648343612, 'SIGMATEL ', 'N/A', 'STAC9221', 'N/A', 36, 648343);
INSERT INTO sonido VALUES (656421612, 'SIGMATEL', 'N/A', 'STAC9221', 'N/A', 36, 656421);
INSERT INTO sonido VALUES (658468612, 'SIGMATEL', 'N/A', 'STAC9221', 'N/A', 36, 658468);
INSERT INTO sonido VALUES (661109612, 'VIA', 'N/A', 'VT1708', 'N/A', 36, 661109);
INSERT INTO sonido VALUES (664390712, 'REALTEK', 'N/A', 'ALC101', 'N/A', 36, 664390);
INSERT INTO sonido VALUES (675406612, ' REALTEK', 'N/A', 'ALC655', 'N/A', 36, 675406);
INSERT INTO sonido VALUES (678937612, 'NVIDIA MCP73', 'N/A', 'N/A', 'N/A', 35, 678937);
INSERT INTO sonido VALUES (698515612, 'NVIDIA', 'N/A', 'N/A', 'N/A', 35, 698515);
INSERT INTO sonido VALUES (702187712, 'INTEL 82801GB ICH7', 'N/A', 'N/A', 'N/A', 35, 702187);
INSERT INTO sonido VALUES (714375612, 'INTEL', 'N/A', '82801GB ICH7', '8086-27D8', 35, 714375);
INSERT INTO sonido VALUES (72193612, 'INTEL', '1GB', 'N/A', 'ICH7', 35, 72193);
INSERT INTO sonido VALUES (72793612, 'REALTEK', '82801GB', 'N/A', 'ALC888/1200', 35, 72793);


--
-- TOC entry 2253 (class 0 OID 16507)
-- Dependencies: 1737
-- Data for Name: soperativo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO soperativo VALUES (1, 'Windows 95');
INSERT INTO soperativo VALUES (2, 'Windows 98');
INSERT INTO soperativo VALUES (3, 'Windows 2000');
INSERT INTO soperativo VALUES (4, 'Windows XP');
INSERT INTO soperativo VALUES (5, 'Windows Vista');
INSERT INTO soperativo VALUES (6, 'Windows 7');
INSERT INTO soperativo VALUES (7, 'Linux Debian');
INSERT INTO soperativo VALUES (8, 'OpenSuse (Linux)');
INSERT INTO soperativo VALUES (9, 'Otro');


--
-- TOC entry 2254 (class 0 OID 16510)
-- Dependencies: 1738
-- Data for Name: soporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO soporte VALUES (3, 'Yorman Carrero', NULL, NULL);
INSERT INTO soporte VALUES (4, 'jorman carrero', NULL, NULL);
INSERT INTO soporte VALUES (5, 'argenis gallardo', NULL, NULL);
INSERT INTO soporte VALUES (6, 'victor lugo', NULL, NULL);
INSERT INTO soporte VALUES (7, 'oscar bracho', NULL, NULL);
INSERT INTO soporte VALUES (8, 'carlos sequera', NULL, NULL);
INSERT INTO soporte VALUES (9, 'nerio rodriguez', NULL, NULL);
INSERT INTO soporte VALUES (10, 'WILFREDO GUTIERREZ', 15, 1);
INSERT INTO soporte VALUES (11, 'prueba', 18, 1);
INSERT INTO soporte VALUES (1, 'Robert Torres', 1, 5);
INSERT INTO soporte VALUES (12, 'Julian Fornes', 26, 1);
INSERT INTO soporte VALUES (13, 'jose luis valera', 29, 1);


--
-- TOC entry 2255 (class 0 OID 16513)
-- Dependencies: 1739
-- Data for Name: switches; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2256 (class 0 OID 16519)
-- Dependencies: 1740
-- Data for Name: tdispositivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tdispositivo VALUES (1, 'IDE', 7);
INSERT INTO tdispositivo VALUES (2, 'SATA', 7);
INSERT INTO tdispositivo VALUES (3, 'Unidad Externa', 7);
INSERT INTO tdispositivo VALUES (4, 'SCSI', 7);
INSERT INTO tdispositivo VALUES (9, 'PCI', 8);
INSERT INTO tdispositivo VALUES (10, 'AGP', 8);
INSERT INTO tdispositivo VALUES (11, 'DDR', 9);
INSERT INTO tdispositivo VALUES (12, 'DDR II', 9);
INSERT INTO tdispositivo VALUES (14, 'USB', 4);
INSERT INTO tdispositivo VALUES (15, 'PS2', 4);
INSERT INTO tdispositivo VALUES (16, 'COM1', 4);
INSERT INTO tdispositivo VALUES (17, 'LCD', 2);
INSERT INTO tdispositivo VALUES (18, 'CRT', 2);
INSERT INTO tdispositivo VALUES (19, 'TV', 2);
INSERT INTO tdispositivo VALUES (20, 'PS2', 3);
INSERT INTO tdispositivo VALUES (21, 'USB', 3);
INSERT INTO tdispositivo VALUES (22, 'INALABRICO', 3);
INSERT INTO tdispositivo VALUES (23, 'UPS', 6);
INSERT INTO tdispositivo VALUES (24, 'REGULADOR', 6);
INSERT INTO tdispositivo VALUES (25, 'Lector de CD', 16);
INSERT INTO tdispositivo VALUES (26, 'Lector de DVD', 16);
INSERT INTO tdispositivo VALUES (27, 'Lectura/Escritura de Cd', 16);
INSERT INTO tdispositivo VALUES (28, 'Lectura/Escritura DVD', 16);
INSERT INTO tdispositivo VALUES (29, 'Un Solo Procesador', 11);
INSERT INTO tdispositivo VALUES (30, 'Multiprocesador', 11);
INSERT INTO tdispositivo VALUES (31, 'AMD', 10);
INSERT INTO tdispositivo VALUES (32, 'INTEL', 10);
INSERT INTO tdispositivo VALUES (33, 'Wifi', 14);
INSERT INTO tdispositivo VALUES (34, 'Ethernet', 14);
INSERT INTO tdispositivo VALUES (35, 'PCI', 12);
INSERT INTO tdispositivo VALUES (36, 'INTEGRADA', 12);
INSERT INTO tdispositivo VALUES (37, 'INTEGRADA', 8);
INSERT INTO tdispositivo VALUES (38, 'INTEGRADA', 14);
INSERT INTO tdispositivo VALUES (39, 'TINTA COLOR', 17);
INSERT INTO tdispositivo VALUES (40, 'TINTA NEGRA', 17);
INSERT INTO tdispositivo VALUES (45, 'MATRIZ DE PUNTO (LPT1)', 5);
INSERT INTO tdispositivo VALUES (46, 'MATRIZ DE PUNTO (COM1)', 5);
INSERT INTO tdispositivo VALUES (47, 'LASER BLANCO Y NEGRO (PUERTO USB)', 5);
INSERT INTO tdispositivo VALUES (48, 'LASER COLOR (PUERTO USB)', 5);
INSERT INTO tdispositivo VALUES (49, 'LASER BLANCO Y NEGRO (RED)', 5);
INSERT INTO tdispositivo VALUES (50, 'LASER COLOR (RED)', 5);
INSERT INTO tdispositivo VALUES (51, 'INYECCION DE TINTA (USB)', 5);
INSERT INTO tdispositivo VALUES (52, 'INYECCION DE TINTA (RED)', 5);
INSERT INTO tdispositivo VALUES (53, 'INYECCION DE TINTA (LPT1)', 5);
INSERT INTO tdispositivo VALUES (41, 'TONER COLOR', 18);
INSERT INTO tdispositivo VALUES (42, 'TONER NEGRO', 18);
INSERT INTO tdispositivo VALUES (43, 'CINTA NEGRA', 19);
INSERT INTO tdispositivo VALUES (44, 'CINTA COLOR', 19);


--
-- TOC entry 2257 (class 0 OID 16522)
-- Dependencies: 1741
-- Data for Name: teclados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO teclados VALUES (2272011110325004, '0510029622', 'KODE', 'N/A', 3, 'AIDE BEAMONT', 16, 1, '', 'ADM16', NULL, NULL);
INSERT INTO teclados VALUES (14156, 'N/A', 'OLIVETTI', 'N/A', 3, 'ADM07', 3, 1, 'NINGUNA', 'ADM07', NULL, NULL);
INSERT INTO teclados VALUES (22953, 'N/A', 'OMEGA', 'N/A', 3, 'MARIA RODRIGUEZ', 14, 1, 'NINGUNA', 'ADM36', NULL, NULL);
INSERT INTO teclados VALUES (26234, 'N/A', 'MARKVISION', 'BE-58743', 3, 'ADM22', 14, 1, 'NINGUNA', 'ADM22', NULL, NULL);
INSERT INTO teclados VALUES (2993, 'N/A', 'GENIUS', 'N/A', 3, 'NEYDA', 3, 1, 'NINGUNA', 'AMD09', NULL, NULL);
INSERT INTO teclados VALUES (44203, 'N/A', 'N/A', 'N/A', 3, 'ADM19', 14, 1, 'NINGUNA', 'ADM19', 20, 'N/A');
INSERT INTO teclados VALUES (50812, 'N/A', 'N/A', 'N/A', 3, 'MORAIMA KEY', 11, 1, 'NINGUNA', 'SALA12', 20, 'N/A');
INSERT INTO teclados VALUES (81328, '0109030180B', 'OLIVETTI', 'BN-02972929', 3, 'MAURA', 16, 1, 'NINGUNA', 'ADM37', 20, 'KWD-205');
INSERT INTO teclados VALUES (89828, '0078356', 'IBM', 'BE: 53005', 3, 'PRESI01', 23, 1, 'NINGUNA', 'PRESI01', 20, 'KB-0225');
INSERT INTO teclados VALUES (11031, 'N/A', 'A4TECH', 'BE-59159', 3, 'LORENA', 4, 1, 'NINGUNA', 'ADM30', 20, 'KLS7MV');
INSERT INTO teclados VALUES (120843, 'K-804(K-700)', 'POLUX', 'N/A', 3, 'CARMEN', 0, 1, 'NINGUNA', 'SALA20', 21, 'N/A');
INSERT INTO teclados VALUES (126296, 'N/A', 'POLUX', 'N/A', 3, 'CARMEN', 2, 1, 'NINGUNA', 'SALA20', 20, 'N/A');
INSERT INTO teclados VALUES (96281, 'N/A', 'GENIUS', 'N/A', 3, 'ADM11', 3, 1, 'NINGUNA', 'ADM11', 20, 'N/A');
INSERT INTO teclados VALUES (201312, 'N/A', 'GENIUS', '58669-B', 3, 'DR MIGUEL TERAN', 21, 1, 'OPTIMO', 'EPI03', 20, 'GL-070008/U');
INSERT INTO teclados VALUES (215484, '0047595', 'IBM', ' 2795417', 3, 'ONCOLOGIA', 21, 1, 'BIEN', 'EPI02', 20, 'KB-7953');
INSERT INTO teclados VALUES (226125, 'YB0511012535', 'GENIUS', '60826', 3, 'JANIC TORRE', 21, 1, 'BIEN', 'EPI09', 20, 'N/A');
INSERT INTO teclados VALUES (236718, 'N/A', 'SONIC', '56320-C', 3, 'LORENA GUEVARA', 21, 1, 'NINGUNA', 'EPI16', 20, 'KM-380PSP000S');
INSERT INTO teclados VALUES (248328, '1203200732315917', 'MARKVISION', '56027', 3, 'LILIAN DELGADO', 21, 1, 'NINGUNA', 'EPI04', 21, 'N/A');
INSERT INTO teclados VALUES (259921, 'N/A', 'HP', '3575278', 3, 'MIGDALIA SEIJAS', 21, 1, 'NINGUNA', 'EPI18', 21, 'KU-O316');
INSERT INTO teclados VALUES (267515, 'N/A', 'DTK', '02965064', 3, 'MAIRELIS ASCANIO', 21, 1, 'NINGUNA', 'EPI11', 20, '5998084182798');
INSERT INTO teclados VALUES (528828, '9503013645', 'YBT', '54344-C', 3, 'VIRGINIA DUQUE', 12, 1, 'NINGUNA', 'CONTRA13', 20, 'TD61125B');
INSERT INTO teclados VALUES (295828, 'KB-0225', 'IBM', 'N/A', 3, 'YENI LISARAZO', 21, 1, 'NINGUNA', 'EPI06', 20, 'N/A');
INSERT INTO teclados VALUES (302109, 'N/A', 'HP', '3575268', 3, 'CARLOS VELES', 21, 1, 'NINGUNA', 'EPI13', 20, 'KV0316');
INSERT INTO teclados VALUES (540296, '017050270050', 'SONIC', '56256-C', 3, 'LIC ALBA AVILA', 12, 1, 'NINGUNA', 'CONTRA20', 20, 'N/A');
INSERT INTO teclados VALUES (31993, 'N/A', 'XPX', '57399_A', 3, 'NOREXIS ACOSTA', 21, 1, 'NINGUNA', 'EPI14', 20, 'KBXPX30070701');
INSERT INTO teclados VALUES (33131, '1480405250008540200', 'XTECH', '50667', 3, 'MARTA FERRERO', 21, 1, 'NINGUNA', 'EPI08', 20, 'OPTICO');
INSERT INTO teclados VALUES (338734, 'N/A', 'GENIUS', '50101', 3, 'PATRICIA AMUNDARAY', 21, 1, 'NINGUNA', 'EPI15', 20, 'KB 120');
INSERT INTO teclados VALUES (34646, '050607', 'POLUX', 'N/A', 3, 'CARLA TORTOLEDO', 12, 1, 'NINGUNA', 'CONTRA06', 20, 'K-804');
INSERT INTO teclados VALUES (361343, '0049062', 'OMEGA', 'N/A', 3, 'MIRIAM LA CRUZ', 21, 1, 'NINGUNA', 'EPI12', 20, 'N/A');
INSERT INTO teclados VALUES (372109, 'N/A', 'OLIVETTI', '02973389', 3, 'JOSE ANGEL', 21, 1, 'NINGUNA', 'EPI10', 20, 'KWD-205');
INSERT INTO teclados VALUES (381890, '0044344', 'IBM', 'N/A', 3, 'DR. RAMON RIVAS', 21, 1, 'NINGUNA', 'EPI05', 20, 'N/A');
INSERT INTO teclados VALUES (388234, '1205200732315758', 'MARKVISION', '56018', 3, 'DR. ERNESTO FLORES', 21, 1, 'NINGUNA', 'EPI17', 20, 'N/A');
INSERT INTO teclados VALUES (394140, '8010246', 'OMEGA', '58296-C', 3, 'ALICIA HERNANDEZ', 21, 1, 'NINGUNA', 'EPI20', 20, 'N/A');
INSERT INTO teclados VALUES (403296, 'N/A', 'IBM', '201805', 3, 'MARIA ZAMBRANO', 21, 1, 'NINGUNA', 'EPI19', 20, 'KB-0225');
INSERT INTO teclados VALUES (410687, '435302-161', 'HP ', '3650892', 3, 'ALFREDO MUSURUARAR', 12, 1, 'NINGUNA', 'CONTRA01', 20, 'KB-0316');
INSERT INTO teclados VALUES (420781, '430802-161', 'HP ', '3650887', 3, 'HIGIENE', 12, 1, 'NINGUNA', 'CONTRA09', 20, 'KB-0316');
INSERT INTO teclados VALUES (422890, '539130-161', 'HP', '61635', 3, 'INGENIERIA SANITARIA', 12, 1, 'NINGUNA', 'CONTRA05', 21, 'N/A');
INSERT INTO teclados VALUES (435718, '0109030144B ', 'OLIVETTI', '02946699', 3, 'DROGAS Y COSMETICOS', 12, 1, 'NINGUNA', 'CONTRA02', 20, 'KWD-205');
INSERT INTO teclados VALUES (443250, '0049508', 'OMEGA', 'N/A', 3, 'JACKELINE PEREZ', 12, 1, 'NINGUNA', 'CONTRA16', 20, '298112SB');
INSERT INTO teclados VALUES (452531, 'BC3370GVBWU3XC', 'HP', '3650889', 3, 'SECRETARIA CONTRALORIA SANITARIA', 12, 1, 'NINGUNA', 'CONTRA08', 20, 'KB-0316 ');
INSERT INTO teclados VALUES (461125, 'N/A', 'CLDN', '59701', 3, 'YAMILA DAGGELT', 12, 1, 'NINGUNA', 'CONTRA07', 20, 'N/A');
INSERT INTO teclados VALUES (47262, '071003018078', 'OMEGA', 'N/A', 3, 'SACS', 12, 1, 'NINGUNA', 'CONTRA10', 20, 'N/A');
INSERT INTO teclados VALUES (476343, 'N/A', 'HP ', '3650882', 3, 'SACS', 12, 1, 'NINGUNA', 'CONTRA11', 20, 'KB-0316');
INSERT INTO teclados VALUES (488890, 'B3C770GCPP8014', 'COMPAQ', '61335-C', 3, 'FRANKLIN RIVERO', 12, 1, 'NINGUNA', 'CONTRA12', 20, 'SK-2865');
INSERT INTO teclados VALUES (507937, '0043721', 'IBM', 'N/A', 3, 'SUPERVISORES AUDITORIA', 12, 1, 'NINGUNA', 'CONTRA15', 20, 'KB-0225');
INSERT INTO teclados VALUES (524375, '8010040', 'OMEGA', '58312-C', 3, 'SNELL ESPINOZA', 12, 1, 'NINGUNA', 'CONTRA19', 20, '266412SDM');
INSERT INTO teclados VALUES (549734, 'BTD44803109', 'LOGITECH', '53053', 3, 'HELEN TOVAR', 18, 1, 'NINGUNA', 'DGS01', 20, 'Y-ST39');
INSERT INTO teclados VALUES (556265, 'WE0891053774', 'GENIUS', 'N/A', 3, 'MEDICINA VIAL Y ESTADISTICA', 18, 1, 'NINGUNA', 'DGS04', 20, 'K639');
INSERT INTO teclados VALUES (569359, 'N/A', 'DELUX', '58779', 3, 'LUZ MIRIAM', 18, 1, 'NINGUNA', 'DGS02', 20, 'DLK-9872');
INSERT INTO teclados VALUES (577484, 'N/A', 'POLUX', 'N/A', 3, 'ING. CARELIS LUGO', 18, 1, 'NINGUNA', 'DGS03', 20, 'N/A');
INSERT INTO teclados VALUES (581921, 'ZCE89P104299', 'GENIUS', '58668-C', 3, 'FELIX BERMUDEZ', 18, 1, 'NINGUNA', 'DGS06', 20, 'N/A');
INSERT INTO teclados VALUES (580640, '0600803103', 'AITEG', '55095-C', 3, 'DR CARLOS VIVAS', 18, 1, 'NINGUNA', 'DGS08', 20, 'KB-2325');
INSERT INTO teclados VALUES (599640, 'ZCA55C202181', 'GENIUS', 'N/A', 3, 'GERMAN SANTOS', 18, 1, 'NINGUNA', 'DGS05', 20, 'KL-0210');
INSERT INTO teclados VALUES (60731, 'ZM9A02002305', 'GENIUS', 'N/A', 3, 'ZORAIDA GONZALEZ', 18, 1, 'NINGUNA', 'DGS07', 20, 'K639 ');
INSERT INTO teclados VALUES (611609, 'WE0891053776', 'GENIUS', 'N/A', 3, 'ROGELIO HERNANDEZ', 18, 1, 'NINGUNA', 'DGS11', 20, 'N/A');
INSERT INTO teclados VALUES (621156, '8010222', 'OMEGA', '58306-C', 3, 'RODRIGUEZ ALEXIS', 18, 1, 'NINGUNA', 'DGS13', 20, 'HTK-2001');
INSERT INTO teclados VALUES (628453, 'N/A', 'N/A', 'N/A', 3, 'GESTION DE SERVICIOS', 18, 1, 'NO TIENE TECLADO', 'DGS09', 20, 'N/A');
INSERT INTO teclados VALUES (636468, '9503016751', 'YBT ', '55101-C', 3, 'CAROLINA', 18, 1, 'NINGUNA', 'DGS10', 20, 'TD6112SB');
INSERT INTO teclados VALUES (643484, '0600803105', 'AITEG', '55087-C', 3, 'LIC. LEIDY OJEDA', 18, 1, 'NINGUNA', 'DGS14', 20, 'KB-2325');
INSERT INTO teclados VALUES (650437, 'ZCE89P104300', 'GENIUS', '58667-C', 3, 'DIRECCION DE SALUD', 18, 1, 'NINGUNA', 'DGS12', 20, 'GK-070008/U');
INSERT INTO teclados VALUES (666640, '3012031674', 'BENQ', '57785', 3, 'JUDITH ACASIO', 10, 1, 'NINGUNA', 'TRAN02', 21, 'N/A');
INSERT INTO teclados VALUES (680328, '0600817336', 'AITEG', '55319-C', 3, 'CUARTO FRIO', 9, 1, 'NINGUNA', 'CUARTO01', 20, 'KB-2616');
INSERT INTO teclados VALUES (686171, 'WE1491037282', 'GENIUS', 'N/A', 3, 'HENNYER MIJARES', 17, 1, 'NINGUNO', 'GENIUS', 20, 'K639');
INSERT INTO teclados VALUES (690546, 'WE1491037282', 'GENIUS', 'N/A', 3, 'HENNYER MIJARES', 17, 1, 'NINGUNO', 'ADM01', 20, 'K639');
INSERT INTO teclados VALUES (695203, 'N/A', 'GENIUS', '61338-B', 3, 'MARISOL JIMENEZ', 17, 1, 'NINGUNO', 'ADM03', 20, 'K639');
INSERT INTO teclados VALUES (710171, '61714', 'OMEGA', '61714', 3, 'ADM09', 0, 1, 'NO', 'ADM09', 20, 'N/A');
INSERT INTO teclados VALUES (716625, '61722', 'OMEGA', '61722', 3, 'ADM10', 3, 1, 'NO', 'ADM10', 20, 'N/A');
INSERT INTO teclados VALUES (723609, 'ZCE89H101429', 'GENIUS', '5876-C', 3, 'ADM11', 3, 1, 'NO', 'ADM11', 20, 'GK-070008/U');
INSERT INTO teclados VALUES (731515, 'WE1491037282', 'GENIUS', 'N/A', 3, 'HENNYER MIJARES', 3, 1, 'NO', 'ADM01', 20, 'K639');


--
-- TOC entry 2258 (class 0 OID 16528)
-- Dependencies: 1742
-- Data for Name: temporal; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2259 (class 0 OID 16531)
-- Dependencies: 1743
-- Data for Name: tipoequipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipoequipo VALUES (1, 'C.P.U.');
INSERT INTO tipoequipo VALUES (2, 'MONITOR');
INSERT INTO tipoequipo VALUES (3, 'TECLADO');
INSERT INTO tipoequipo VALUES (4, 'MOUSE');
INSERT INTO tipoequipo VALUES (5, 'IMPRESORA');
INSERT INTO tipoequipo VALUES (6, 'REGULADOR');
INSERT INTO tipoequipo VALUES (7, 'DISCO DURO');
INSERT INTO tipoequipo VALUES (8, 'TARJETA DE VIDEO');
INSERT INTO tipoequipo VALUES (9, 'RAM');
INSERT INTO tipoequipo VALUES (10, 'PROCESADOR');
INSERT INTO tipoequipo VALUES (11, 'TARJETA MADRE');
INSERT INTO tipoequipo VALUES (12, 'TARJETA DE SONIDO');
INSERT INTO tipoequipo VALUES (14, 'LAN');
INSERT INTO tipoequipo VALUES (15, 'SWITCHE (RED)');
INSERT INTO tipoequipo VALUES (16, 'CDROM');
INSERT INTO tipoequipo VALUES (17, 'CARTUCHO DE TINTA');
INSERT INTO tipoequipo VALUES (18, 'CARTUCHO DE TONER');
INSERT INTO tipoequipo VALUES (19, 'CINTA DE IMPRESION');


--
-- TOC entry 2265 (class 0 OID 33243)
-- Dependencies: 1791
-- Data for Name: tipousuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2260 (class 0 OID 16534)
-- Dependencies: 1744
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario VALUES (34, 'richard', '83b4ef5ae4bb360c96628aecda974200', 'RICHARD GONZÁLEZ', 5, 1, 1);
INSERT INTO usuario VALUES (38, 'luis', '502ff82f7f1f8218dd41201fe4353687', 'LUIS ALVARADO', 5, 1, 1);
INSERT INTO usuario VALUES (39, 'abrahan', '5a426394e8c9e2ebca67054be30d2be8', 'ABRAHAN GUTIERREZ', 5, 1, 1);
INSERT INTO usuario VALUES (1, 'robetorr', 'db73de3c3da209e113d3023183da14e1', 'Robert Torres', 5, 1, 1);
INSERT INTO usuario VALUES (7, 'Admin', 'e10adc3949ba59abbe56e057f20f883e', 'Administrador del Sistema', 5, 1, 1);
INSERT INTO usuario VALUES (9, 'carlos', 'af54a7afbe8b7f4004cc93bf7ae9c579', 'carlos sequera', 5, 1, 1);
INSERT INTO usuario VALUES (40, 'mariela', 'af774e535ec36ad7e99f92f354b25c01', 'MARIELA RIOS', 5, 1, 1);
INSERT INTO usuario VALUES (41, 'williams', '44e7cdc8f1386a1820b02f504f38317d', 'WILLIAMS VARGAS', 5, 1, 1);
INSERT INTO usuario VALUES (13, 'nerio', 'bcffc035790b71f10e186fc4cdaccdcf', 'nerio rodriguez', 5, 1, 1);
INSERT INTO usuario VALUES (14, 'jesus', '78947661afee90b0f2d7d300484e8712', 'jesus guevara', 5, 1, 1);
INSERT INTO usuario VALUES (42, 'alexis', '059bf68f71c80fce55214b411dd2280c', 'ALEXIS HERNANDEZ', 5, 1, 1);
INSERT INTO usuario VALUES (43, 'jean', 'b71985397688d6f1820685dde534981b', 'JEAN CARLOS VASQUEZ', 5, 1, 1);
INSERT INTO usuario VALUES (44, 'jose', '662eaa47199461d01a623884080934ab', 'JOSE LUIS ', 5, 1, 1);
INSERT INTO usuario VALUES (45, 'yormary', '82fa2e0589a59f130e4bc3238c94e572', 'YORMARY FLORES', 5, 1, 1);
INSERT INTO usuario VALUES (23, 'ramonp', '3ac1858a0e8411ea3c94b9ba811722a8', 'ramon perez', 5, 1, 1);
INSERT INTO usuario VALUES (26, 'julian', '6b43d9a3d344c3ace15d0ffc7a845b48', 'JULIAN FORNES', 5, 2, 1);
INSERT INTO usuario VALUES (27, 'jfornes', '6b43d9a3d344c3ace15d0ffc7a845b48', 'JULIAN', 5, 1, 1);
INSERT INTO usuario VALUES (29, 'JOSEVAL', '3661ee840985abe183ffbb657ac11983', 'JOSE LUIS VALERA', 5, 2, 1);
INSERT INTO usuario VALUES (30, 'pasante1', 'cb488cdb1d611050a848be92e1284f46', 'USUARIO PASANTE', 6, 2, 1);
INSERT INTO usuario VALUES (31, 'pasante2', '5d5c33e21b2769ce02def6bbeda96633', 'USUARIO PASANTE', 6, 2, 1);
INSERT INTO usuario VALUES (32, 'pasante3', '978acd32893b2b7cce7893e74d5f1b4f', 'USUARIO PASANTE', 6, 2, 1);
INSERT INTO usuario VALUES (33, 'jorman', '262578fcf27130d3fdabbaf1722d3f8f', 'JORMAN CARRERO', 5, 1, 1);
INSERT INTO usuario VALUES (24, 'yalitza', '3602a15e0f791ad6098404de32b2660d', 'Yalitza Molina', 5, 2, 1);


--
-- TOC entry 2261 (class 0 OID 16537)
-- Dependencies: 1745
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO video VALUES (2762011101550703038, 'No tiene', 'Integrada', 'Integrada', 'null', 37, 27620111015507030);
INSERT INTO video VALUES (3062011142146515146, 'N/A', 'INTEGRADA', 'INTEGRADA', 'null', 37, 30620111421465151);
INSERT INTO video VALUES (2272011104123812367, 'N/A', 'S3G UNICHROME PRO IGP', 'VIA', 'null', 9, 22720111041238123);
INSERT INTO video VALUES (277201111240828497, 'N/A', 'PCI RAGE 128 PRO', 'ATI', 'null', 9, 2772011112408284);
INSERT INTO video VALUES (11720111424312259, 'n/a', '82865G graphics', 'intel', 'null', 9, 117201114243122);
INSERT INTO video VALUES (1318768, 'N/A', 'N/A', 'INTEGRADA', 'N/A', 9, 13187);
INSERT INTO video VALUES (21750168, 'N/A', 'N/A', 'N/A', 'N/A', 9, 21750);
INSERT INTO video VALUES (25500248, 'N/A', 'N/A', 'INTEGRADA', 'N/A', 9, 25500);
INSERT INTO video VALUES (28218328, 'N/A', 'N/A', 'INTEGRADA', 'N/A', 9, 28218);
INSERT INTO video VALUES (36781408, 'N/A', 'N/A', 'INTEGRADA', 'N/A', 9, 36781);
INSERT INTO video VALUES (48906498, 'N/A', 'N/A', 'INTEGRADA INTEL', 'N/A', 9, 48906);
INSERT INTO video VALUES (67734598, 'N/A', '1', 'INTEGRADA', 'N/A', 9, 67734);
INSERT INTO video VALUES (6862698, 'N/A', 'N/A', 'SIS', 'N/A', 9, 6862);
INSERT INTO video VALUES (87312878, 'N/A', 'N/A', 'N/A', 'N/A', 9, 87312);
INSERT INTO video VALUES (93687968, 'N/A', 'N/A', 'N/A', 'N/A', 9, 93687);
INSERT INTO video VALUES (9434358, 'N/A', 'N/A', 'N/A', 'N/A', 9, 94343);
INSERT INTO video VALUES (99281168, 'N/A', 'N/A', 'S3 GRAPHICS', 'N/A', 9, 99281);
INSERT INTO video VALUES (101484228, 'N/A', '1', 'N/A', '256 MB', 9, 101484);
INSERT INTO video VALUES (103406308, 'N/A', '1', 'N/A', 'N/A', 9, 103406);
INSERT INTO video VALUES (108593478, 'N/A', '1', 'N/A', 'N/A', 9, 108593);
INSERT INTO video VALUES (116437558, 'N/A', 'N/A', 'N/A', 'N/A', 9, 116437);
INSERT INTO video VALUES (128140638, 'N/A', '1', 'N/A', 'N/A', 9, 128140);
INSERT INTO video VALUES (17490648, 'N/A', 'N/A', 'INTEL G33/G31', '64 MB', 37, 174906);
INSERT INTO video VALUES (193265118, 'N/A', '82845G', 'INTEL(R)', '64 MB', 37, 193265);
INSERT INTO video VALUES (19031288, 'N/A', 'N/A', 'INTEL', '96 MB', 37, 19031);
INSERT INTO video VALUES (2190148, 'N/A', 'N/A', 'INTEL 82865G', '96 MB', 37, 2190);
INSERT INTO video VALUES (22793758, 'N/A', 'N/A', 'VIA', '256 MB', 37, 227937);
INSERT INTO video VALUES (246406438, 'N/A', 'N/A', 'VIA', '128 MB', 37, 246406);
INSERT INTO video VALUES (25426568, 'N/A', 'N/A', 'INTEL', '256 MB', 37, 254265);
INSERT INTO video VALUES (265984248, 'N/A', 'N/A', 'INTEL', '16 MB', 37, 265984);
INSERT INTO video VALUES (272312338, 'N/A', 'N/A', 'INTEL', '16 MB', 37, 272312);
INSERT INTO video VALUES (28264058, '82865G', 'N/A', 'INTEL', '96 MB', 37, 282640);
INSERT INTO video VALUES (29192168, '82865G', 'N/A', 'INTEL', '96 MB', 37, 291921);
INSERT INTO video VALUES (30045368, 'N/A', 'N/A', 'INTEL', '256 MB', 37, 300453);
INSERT INTO video VALUES (31018768, 'N/A', 'N/A', 'INTEL', '256 MB', 37, 310187);
INSERT INTO video VALUES (31242158, '82865G', 'N/A', 'INTEL', '96 MB', 37, 312421);
INSERT INTO video VALUES (31659348, '82945G', 'N/A', 'CHIPSET', '224 MB', 37, 316593);
INSERT INTO video VALUES (32513158, '82945G ', 'N/A', 'INTEL', '128 MB', 37, 325131);
INSERT INTO video VALUES (32915668, '650_651_M650_740', 'N/A', 'SIS', '8 MB', 37, 329156);
INSERT INTO video VALUES (3366268, '5436', 'N/A', 'CIRRUS', '32 MB', 37, 33662);
INSERT INTO video VALUES (34493778, '650_651_M650_M652_740', 'N/A', 'SIS ', '32 MB', 37, 344937);
INSERT INTO video VALUES (35737558, 'N/A', 'N/A', 'VIA', '64 MB', 37, 357375);
INSERT INTO video VALUES (3583158, '82865G', 'N/A', 'INTEL', '96 MB', 37, 35831);
INSERT INTO video VALUES (36653158, 'N/A', 'N/A', 'VIA', '64 MB', 37, 366531);
INSERT INTO video VALUES (37926558, '82865G', 'N/A', 'INTEL', '96 MB', 37, 379265);
INSERT INTO video VALUES (37387568, 'N/A', 'N/A', 'INTEL', '64 MB', 37, 373875);
INSERT INTO video VALUES (38668778, '651_661FX', 'N/A', 'SIS', '32 MB', 37, 386687);
INSERT INTO video VALUES (39915658, '661FX/GX', 'N/A', 'SIS', '32 MB', 37, 399156);
INSERT INTO video VALUES (408058, '8086-2562 ', 'N/A', 'INTEL', '64 MB', 9, 4080);
INSERT INTO video VALUES (41623458, 'Q45/Q43', 'N/A', 'INTEL', '512 MB', 9, 416234);
INSERT INTO video VALUES (40179668, 'N/A', 'N/A', 'INTEL', '1342076 KB', 37, 401796);
INSERT INTO video VALUES (43359358, 'N/A', 'N/A', 'VIA', '32 MB', 37, 433593);
INSERT INTO video VALUES (43148458, ' HVHB303993', 'N/A', 'INTEL', '18.5', 37, 431484);
INSERT INTO video VALUES (44876558, 'N/A', 'N/A', 'INTEL', '512 MB', 37, 448765);
INSERT INTO video VALUES (44921858, 'GDIH00K5', 'N/A', 'VIA', '64 MB', 37, 449218);
INSERT INTO video VALUES (45839058, 'N/A', 'N/A', 'VIA', '64 MB', 37, 458390);
INSERT INTO video VALUES (45954658, 'N/A', 'N/A', 'VIA', '32 MB', 37, 459546);
INSERT INTO video VALUES (4694668, 'N/A', 'N/A', 'INTEL', '256 MB', 37, 46946);
INSERT INTO video VALUES (47070348, 'N/A', 'N/A', 'INTEL', '512 MB', 9, 470703);
INSERT INTO video VALUES (48542168, '82845G', 'N/A', 'INTEL', '32 MB', 37, 485421);
INSERT INTO video VALUES (4864658, '82865G', 'N/A', 'INTEL', '64MB', 37, 48646);
INSERT INTO video VALUES (49323458, '82865G', 'N/A', 'INTEL', '96 MB', 37, 493234);
INSERT INTO video VALUES (50679658, '82865G', 'N/A', 'INTEL', '64 MB', 37, 506796);
INSERT INTO video VALUES (52165658, 'N/A', 'N/A', 'VIA', '64 MB', 37, 521656);
INSERT INTO video VALUES (522058, '82865G', 'N/A', 'INTEL', '64 MB', 37, 5220);
INSERT INTO video VALUES (53540658, 'N/A', 'N/A', 'VIA', '64 MB', 37, 535406);
INSERT INTO video VALUES (53687558, '82945G', 'N/A', 'INTEL', '224 MB', 37, 536875);
INSERT INTO video VALUES (54764068, 'N/A', 'N/A', 'VIA', '16 MB', 37, 547640);
INSERT INTO video VALUES (55456268, 'N/A', 'N/A', 'INTEL', '32 MB', 37, 554562);
INSERT INTO video VALUES (56414058, 'N/A', 'N/A', 'VIA', '128 MB', 37, 564140);
INSERT INTO video VALUES (57443758, 'N/A', 'N/A', 'INTEL', '128 MB', 37, 574437);
INSERT INTO video VALUES (56892158, 'N/A', 'N/A', 'VIA', '16 MB', 37, 568921);
INSERT INTO video VALUES (56665658, '82945G', 'N/A', 'INTEL', '128 MB', 37, 566656);
INSERT INTO video VALUES (58837568, 'N/A', 'N/A', 'NVIDIA', '128 MB', 37, 588375);
INSERT INTO video VALUES (59692168, 'N/A', 'N/A', 'SIS', '32 MB', 37, 596921);
INSERT INTO video VALUES (59271858, '82810-DC100 ', 'N/A', 'INTEL', '32 MB', 37, 592718);
INSERT INTO video VALUES (61895358, 'N/A', 'N/A', 'VIA', '16 MB', 37, 618953);
INSERT INTO video VALUES (62625068, '82810-DC100', 'N/A', 'INTEL', '32 MB', 37, 626250);
INSERT INTO video VALUES (63485958, '610I', 'N/A', 'NVIDIA', '512 MB', 9, 634859);
INSERT INTO video VALUES (64179658, 'N/A', 'N/A', 'VIA', '64 MB', 37, 641796);
INSERT INTO video VALUES (64834358, '82945G', 'N/A', 'INTEL', '128 MB', 37, 648343);
INSERT INTO video VALUES (65642158, '82945G', 'N/A', 'INTEL', '128 MB', 37, 656421);
INSERT INTO video VALUES (65846858, '82945G', 'N/A', 'INTEL', '128 MB', 37, 658468);
INSERT INTO video VALUES (66110958, 'N/A', 'N/A', 'NVIDIA', '512 MB', 37, 661109);
INSERT INTO video VALUES (66439088, 'N/A', 'N/A', 'SILICONE', '8 MB', 37, 664390);
INSERT INTO video VALUES (67540658, 'N/A', 'N/A', 'UNICHROME PRO', '64 MB', 37, 675406);
INSERT INTO video VALUES (67893758, 'N/A', 'N/A', 'NVIDIA NFORCE', '512 MB', 37, 678937);
INSERT INTO video VALUES (69851558, 'N/A', 'N/A', 'NVIDIA GEFORCE', '512MB', 37, 698515);
INSERT INTO video VALUES (70218758, 'N/A', 'N/A', 'INTEL(R) G41 EXPRESS CHIPSET', 'N/A', 37, 702187);
INSERT INTO video VALUES (71437558, 'N/A', 'N/A', 'INTEL', '1GB', 9, 714375);
INSERT INTO video VALUES (7219358, 'N/A', 'N/A', 'INTEL', '1GB', 9, 72193);
INSERT INTO video VALUES (7279358, 'N/A', 'N/A', 'INTEL', '400 MHZ', 37, 72793);


--
-- TOC entry 2224 (class 2606 OID 33267)
-- Dependencies: 1796 1796
-- Name: cambios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cambios
    ADD CONSTRAINT cambios_pkey PRIMARY KEY (id);


--
-- TOC entry 2220 (class 2606 OID 25124)
-- Dependencies: 1785 1785
-- Name: ndxasignadas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY asignadas
    ADD CONSTRAINT ndxasignadas PRIMARY KEY (id);


--
-- TOC entry 2226 (class 2606 OID 59370)
-- Dependencies: 1811 1811
-- Name: ndxcapacidaddd; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY capacidaddd
    ADD CONSTRAINT ndxcapacidaddd PRIMARY KEY (id);


--
-- TOC entry 2228 (class 2606 OID 59375)
-- Dependencies: 1812 1812
-- Name: ndxcapacidadram; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY capacidadram
    ADD CONSTRAINT ndxcapacidadram PRIMARY KEY (id);


--
-- TOC entry 2230 (class 2606 OID 59386)
-- Dependencies: 1814 1814
-- Name: ndxcartucho; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cartuchos
    ADD CONSTRAINT ndxcartucho PRIMARY KEY (id);


--
-- TOC entry 2162 (class 2606 OID 16792)
-- Dependencies: 1717 1717
-- Name: ndxdd; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY discoduro
    ADD CONSTRAINT ndxdd PRIMARY KEY (id);


--
-- TOC entry 2160 (class 2606 OID 16790)
-- Dependencies: 1716 1716
-- Name: ndxdep; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT ndxdep PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 16794)
-- Dependencies: 1718 1718
-- Name: ndxdoc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT ndxdoc PRIMARY KEY (id);


--
-- TOC entry 2166 (class 2606 OID 16796)
-- Dependencies: 1719 1719
-- Name: ndxeq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipos
    ADD CONSTRAINT ndxeq PRIMARY KEY (id);


--
-- TOC entry 2168 (class 2606 OID 16798)
-- Dependencies: 1720 1720
-- Name: ndxest; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus
    ADD CONSTRAINT ndxest PRIMARY KEY (id);


--
-- TOC entry 2172 (class 2606 OID 16802)
-- Dependencies: 1722 1722
-- Name: ndxharde; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hardequip
    ADD CONSTRAINT ndxharde PRIMARY KEY (id);


--
-- TOC entry 2174 (class 2606 OID 16804)
-- Dependencies: 1723 1723
-- Name: ndxhardw; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hardware
    ADD CONSTRAINT ndxhardw PRIMARY KEY (id);


--
-- TOC entry 2158 (class 2606 OID 16788)
-- Dependencies: 1715 1715
-- Name: ndxid; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cdrom
    ADD CONSTRAINT ndxid PRIMARY KEY (id);


--
-- TOC entry 2176 (class 2606 OID 16806)
-- Dependencies: 1724 1724
-- Name: ndximp; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY impresoras
    ADD CONSTRAINT ndximp PRIMARY KEY (id);


--
-- TOC entry 2178 (class 2606 OID 16808)
-- Dependencies: 1725 1725
-- Name: ndxlan; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lan
    ADD CONSTRAINT ndxlan PRIMARY KEY (id);


--
-- TOC entry 2180 (class 2606 OID 16810)
-- Dependencies: 1726 1726
-- Name: ndxmenu; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT ndxmenu PRIMARY KEY (id);


--
-- TOC entry 2182 (class 2606 OID 16812)
-- Dependencies: 1727 1727
-- Name: ndxmon; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY monitores
    ADD CONSTRAINT ndxmon PRIMARY KEY (id);


--
-- TOC entry 2184 (class 2606 OID 16814)
-- Dependencies: 1728 1728
-- Name: ndxmoth; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY motherboard
    ADD CONSTRAINT ndxmoth PRIMARY KEY (id);


--
-- TOC entry 2186 (class 2606 OID 16816)
-- Dependencies: 1729 1729
-- Name: ndxmou; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mouse
    ADD CONSTRAINT ndxmou PRIMARY KEY (id);


--
-- TOC entry 2188 (class 2606 OID 16818)
-- Dependencies: 1730 1730
-- Name: ndxniv; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nivel
    ADD CONSTRAINT ndxniv PRIMARY KEY (id);


--
-- TOC entry 2222 (class 2606 OID 33248)
-- Dependencies: 1791 1791
-- Name: ndxpktipousu; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipousuario
    ADD CONSTRAINT ndxpktipousu PRIMARY KEY (id);


--
-- TOC entry 2190 (class 2606 OID 16820)
-- Dependencies: 1731 1731
-- Name: ndxproc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY procesador
    ADD CONSTRAINT ndxproc PRIMARY KEY (id);


--
-- TOC entry 2192 (class 2606 OID 16822)
-- Dependencies: 1732 1732
-- Name: ndxram; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ram
    ADD CONSTRAINT ndxram PRIMARY KEY (id);


--
-- TOC entry 2194 (class 2606 OID 16824)
-- Dependencies: 1733 1733
-- Name: ndxreg; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reguladores
    ADD CONSTRAINT ndxreg PRIMARY KEY (id);


--
-- TOC entry 2196 (class 2606 OID 16826)
-- Dependencies: 1734 1734
-- Name: ndxsofte; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY softequip
    ADD CONSTRAINT ndxsofte PRIMARY KEY (id);


--
-- TOC entry 2198 (class 2606 OID 16828)
-- Dependencies: 1735 1735
-- Name: ndxsoftw; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY software
    ADD CONSTRAINT ndxsoftw PRIMARY KEY (id);


--
-- TOC entry 2200 (class 2606 OID 16830)
-- Dependencies: 1736 1736
-- Name: ndxson; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sonido
    ADD CONSTRAINT ndxson PRIMARY KEY (id);


--
-- TOC entry 2170 (class 2606 OID 16800)
-- Dependencies: 1721 1721
-- Name: ndxsop; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fsoporte
    ADD CONSTRAINT ndxsop PRIMARY KEY (id);


--
-- TOC entry 2202 (class 2606 OID 16832)
-- Dependencies: 1737 1737
-- Name: ndxsoper; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY soperativo
    ADD CONSTRAINT ndxsoper PRIMARY KEY (id);


--
-- TOC entry 2204 (class 2606 OID 16834)
-- Dependencies: 1738 1738
-- Name: ndxsoporte; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY soporte
    ADD CONSTRAINT ndxsoporte PRIMARY KEY (id);


--
-- TOC entry 2206 (class 2606 OID 16836)
-- Dependencies: 1739 1739
-- Name: ndxswit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY switches
    ADD CONSTRAINT ndxswit PRIMARY KEY (id);


--
-- TOC entry 2208 (class 2606 OID 16838)
-- Dependencies: 1740 1740
-- Name: ndxtdis; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdispositivo
    ADD CONSTRAINT ndxtdis PRIMARY KEY (id);


--
-- TOC entry 2210 (class 2606 OID 16840)
-- Dependencies: 1741 1741
-- Name: ndxtecl; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY teclados
    ADD CONSTRAINT ndxtecl PRIMARY KEY (id);


--
-- TOC entry 2214 (class 2606 OID 16842)
-- Dependencies: 1743 1743
-- Name: ndxtipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipoequipo
    ADD CONSTRAINT ndxtipo PRIMARY KEY (id);


--
-- TOC entry 2216 (class 2606 OID 16844)
-- Dependencies: 1744 1744
-- Name: ndxusu; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT ndxusu PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 16846)
-- Dependencies: 1745 1745
-- Name: ndxvideo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY video
    ADD CONSTRAINT ndxvideo PRIMARY KEY (id);


--
-- TOC entry 2212 (class 2606 OID 33269)
-- Dependencies: 1742 1742
-- Name: temporal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY temporal
    ADD CONSTRAINT temporal_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 1784
-- Name: id_asign; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_asign FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_asign FROM postgres;
GRANT ALL ON SEQUENCE id_asign TO postgres;
GRANT ALL ON SEQUENCE id_asign TO soporte;


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 1785
-- Name: asignadas; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE asignadas FROM PUBLIC;
REVOKE ALL ON TABLE asignadas FROM postgres;
GRANT ALL ON TABLE asignadas TO postgres;
GRANT ALL ON TABLE asignadas TO soporte;


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 1746
-- Name: id_audit; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_audit FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_audit FROM postgres;
GRANT ALL ON SEQUENCE id_audit TO postgres;
GRANT ALL ON SEQUENCE id_audit TO soporte;


--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 1786
-- Name: auditoria; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE auditoria FROM PUBLIC;
REVOKE ALL ON TABLE auditoria FROM postgres;
GRANT ALL ON TABLE auditoria TO postgres;
GRANT ALL ON TABLE auditoria TO soporte;


--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 1795
-- Name: id_cambio; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_cambio FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_cambio FROM postgres;
GRANT ALL ON SEQUENCE id_cambio TO postgres;
GRANT ALL ON SEQUENCE id_cambio TO soporte;


--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 1796
-- Name: cambios; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cambios FROM PUBLIC;
REVOKE ALL ON TABLE cambios FROM postgres;
GRANT ALL ON TABLE cambios TO postgres;
GRANT ALL ON TABLE cambios TO soporte;


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 1811
-- Name: capacidaddd; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE capacidaddd FROM PUBLIC;
REVOKE ALL ON TABLE capacidaddd FROM postgres;
GRANT ALL ON TABLE capacidaddd TO postgres;
GRANT ALL ON TABLE capacidaddd TO soporte;


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 1812
-- Name: capacidadram; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE capacidadram FROM PUBLIC;
REVOKE ALL ON TABLE capacidadram FROM postgres;
GRANT ALL ON TABLE capacidadram TO postgres;
GRANT ALL ON TABLE capacidadram TO soporte;


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 1813
-- Name: id_cartucho; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_cartucho FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_cartucho FROM postgres;
GRANT ALL ON SEQUENCE id_cartucho TO postgres;
GRANT ALL ON SEQUENCE id_cartucho TO soporte;


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 1814
-- Name: cartuchos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cartuchos FROM PUBLIC;
REVOKE ALL ON TABLE cartuchos FROM postgres;
GRANT ALL ON TABLE cartuchos TO postgres;
GRANT ALL ON TABLE cartuchos TO soporte;


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 1715
-- Name: cdrom; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cdrom FROM PUBLIC;
REVOKE ALL ON TABLE cdrom FROM postgres;
GRANT ALL ON TABLE cdrom TO postgres;
GRANT ALL ON TABLE cdrom TO soporte;


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 1747
-- Name: id_dep; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_dep FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_dep FROM postgres;
GRANT ALL ON SEQUENCE id_dep TO postgres;
GRANT ALL ON SEQUENCE id_dep TO soporte;


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 1716
-- Name: departamento; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE departamento FROM PUBLIC;
REVOKE ALL ON TABLE departamento FROM postgres;
GRANT ALL ON TABLE departamento TO postgres;
GRANT ALL ON TABLE departamento TO soporte;


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 1748
-- Name: id_doc; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_doc FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_doc FROM postgres;
GRANT ALL ON SEQUENCE id_doc TO postgres;
GRANT ALL ON SEQUENCE id_doc TO soporte;


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 1718
-- Name: documento; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE documento FROM PUBLIC;
REVOKE ALL ON TABLE documento FROM postgres;
GRANT ALL ON TABLE documento TO postgres;
GRANT ALL ON TABLE documento TO soporte;


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 1719
-- Name: equipos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE equipos FROM PUBLIC;
REVOKE ALL ON TABLE equipos FROM postgres;
GRANT ALL ON TABLE equipos TO postgres;
GRANT ALL ON TABLE equipos TO soporte;


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 1759
-- Name: id_tipoeq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_tipoeq FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_tipoeq FROM postgres;
GRANT ALL ON SEQUENCE id_tipoeq TO postgres;
GRANT ALL ON SEQUENCE id_tipoeq TO soporte;


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 1743
-- Name: tipoequipo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tipoequipo FROM PUBLIC;
REVOKE ALL ON TABLE tipoequipo FROM postgres;
GRANT ALL ON TABLE tipoequipo TO postgres;
GRANT ALL ON TABLE tipoequipo TO soporte;


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 1803
-- Name: cpudocumento; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cpudocumento FROM PUBLIC;
REVOKE ALL ON TABLE cpudocumento FROM postgres;
GRANT ALL ON TABLE cpudocumento TO postgres;
GRANT ALL ON TABLE cpudocumento TO soporte;


--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 1758
-- Name: id_temp; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_temp FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_temp FROM postgres;
GRANT ALL ON SEQUENCE id_temp TO postgres;
GRANT ALL ON SEQUENCE id_temp TO soporte;


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 1789
-- Name: desincorporados; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE desincorporados FROM PUBLIC;
REVOKE ALL ON TABLE desincorporados FROM postgres;
GRANT ALL ON TABLE desincorporados TO postgres;
GRANT ALL ON TABLE desincorporados TO soporte;


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 1717
-- Name: discoduro; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE discoduro FROM PUBLIC;
REVOKE ALL ON TABLE discoduro FROM postgres;
GRANT ALL ON TABLE discoduro TO postgres;
GRANT ALL ON TABLE discoduro TO soporte;


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 1749
-- Name: id_estatus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_estatus FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_estatus FROM postgres;
GRANT ALL ON SEQUENCE id_estatus TO postgres;
GRANT ALL ON SEQUENCE id_estatus TO soporte;


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 1720
-- Name: estatus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE estatus FROM PUBLIC;
REVOKE ALL ON TABLE estatus FROM postgres;
GRANT ALL ON TABLE estatus TO postgres;
GRANT ALL ON TABLE estatus TO soporte;


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 1750
-- Name: id_fsop; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_fsop FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_fsop FROM postgres;
GRANT ALL ON SEQUENCE id_fsop TO postgres;
GRANT ALL ON SEQUENCE id_fsop TO soporte;


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 1721
-- Name: fsoporte; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE fsoporte FROM PUBLIC;
REVOKE ALL ON TABLE fsoporte FROM postgres;
GRANT ALL ON TABLE fsoporte TO postgres;
GRANT ALL ON TABLE fsoporte TO soporte;


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 1751
-- Name: id_harde; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_harde FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_harde FROM postgres;
GRANT ALL ON SEQUENCE id_harde TO postgres;
GRANT ALL ON SEQUENCE id_harde TO soporte;


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 1722
-- Name: hardequip; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE hardequip FROM PUBLIC;
REVOKE ALL ON TABLE hardequip FROM postgres;
GRANT ALL ON TABLE hardequip TO postgres;
GRANT ALL ON TABLE hardequip TO soporte;


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 1752
-- Name: id_hardw; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_hardw FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_hardw FROM postgres;
GRANT ALL ON SEQUENCE id_hardw TO postgres;
GRANT ALL ON SEQUENCE id_hardw TO soporte;


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 1723
-- Name: hardware; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE hardware FROM PUBLIC;
REVOKE ALL ON TABLE hardware FROM postgres;
GRANT ALL ON TABLE hardware TO postgres;
GRANT ALL ON TABLE hardware TO soporte;


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 1794
-- Name: id_equipo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_equipo FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_equipo FROM postgres;
GRANT ALL ON SEQUENCE id_equipo TO postgres;
GRANT ALL ON SEQUENCE id_equipo TO soporte;


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 1753
-- Name: id_menu; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_menu FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_menu FROM postgres;
GRANT ALL ON SEQUENCE id_menu TO postgres;
GRANT ALL ON SEQUENCE id_menu TO soporte;


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 1755
-- Name: id_softw; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_softw FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_softw FROM postgres;
GRANT ALL ON SEQUENCE id_softw TO postgres;
GRANT ALL ON SEQUENCE id_softw TO soporte;


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 1756
-- Name: id_soper; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_soper FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_soper FROM postgres;
GRANT ALL ON SEQUENCE id_soper TO postgres;
GRANT ALL ON SEQUENCE id_soper TO soporte;


--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 1779
-- Name: id_soport; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_soport FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_soport FROM postgres;
GRANT ALL ON SEQUENCE id_soport TO postgres;
GRANT ALL ON SEQUENCE id_soport TO soporte;


--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 1757
-- Name: id_tdisp; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_tdisp FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_tdisp FROM postgres;
GRANT ALL ON SEQUENCE id_tdisp TO postgres;
GRANT ALL ON SEQUENCE id_tdisp TO soporte;


--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 1790
-- Name: id_tipousu; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_tipousu FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_tipousu FROM postgres;
GRANT ALL ON SEQUENCE id_tipousu TO postgres;
GRANT ALL ON SEQUENCE id_tipousu TO soporte;


--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 1760
-- Name: id_usuario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE id_usuario FROM PUBLIC;
REVOKE ALL ON SEQUENCE id_usuario FROM postgres;
GRANT ALL ON SEQUENCE id_usuario TO postgres;
GRANT ALL ON SEQUENCE id_usuario TO soporte;


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 1724
-- Name: impresoras; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE impresoras FROM PUBLIC;
REVOKE ALL ON TABLE impresoras FROM postgres;
GRANT ALL ON TABLE impresoras TO postgres;
GRANT ALL ON TABLE impresoras TO soporte;


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 1804
-- Name: impdocumento; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE impdocumento FROM PUBLIC;
REVOKE ALL ON TABLE impdocumento FROM postgres;
GRANT ALL ON TABLE impdocumento TO postgres;
GRANT ALL ON TABLE impdocumento TO soporte;


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 1754
-- Name: is_softe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE is_softe FROM PUBLIC;
REVOKE ALL ON SEQUENCE is_softe FROM postgres;
GRANT ALL ON SEQUENCE is_softe TO postgres;
GRANT ALL ON SEQUENCE is_softe TO soporte;


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 1725
-- Name: lan; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE lan FROM PUBLIC;
REVOKE ALL ON TABLE lan FROM postgres;
GRANT ALL ON TABLE lan TO postgres;
GRANT ALL ON TABLE lan TO soporte;


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 1726
-- Name: menu; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE menu FROM PUBLIC;
REVOKE ALL ON TABLE menu FROM postgres;
GRANT ALL ON TABLE menu TO postgres;
GRANT ALL ON TABLE menu TO soporte;


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 1727
-- Name: monitores; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE monitores FROM PUBLIC;
REVOKE ALL ON TABLE monitores FROM postgres;
GRANT ALL ON TABLE monitores TO postgres;
GRANT ALL ON TABLE monitores TO soporte;


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 1805
-- Name: mondocumento; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE mondocumento FROM PUBLIC;
REVOKE ALL ON TABLE mondocumento FROM postgres;
GRANT ALL ON TABLE mondocumento TO postgres;
GRANT ALL ON TABLE mondocumento TO soporte;


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 1728
-- Name: motherboard; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE motherboard FROM PUBLIC;
REVOKE ALL ON TABLE motherboard FROM postgres;
GRANT ALL ON TABLE motherboard TO postgres;
GRANT ALL ON TABLE motherboard TO soporte;


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 1729
-- Name: mouse; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE mouse FROM PUBLIC;
REVOKE ALL ON TABLE mouse FROM postgres;
GRANT ALL ON TABLE mouse TO postgres;
GRANT ALL ON TABLE mouse TO soporte;


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 1806
-- Name: moudocumento; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE moudocumento FROM PUBLIC;
REVOKE ALL ON TABLE moudocumento FROM postgres;
GRANT ALL ON TABLE moudocumento TO postgres;
GRANT ALL ON TABLE moudocumento TO soporte;


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 1730
-- Name: nivel; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE nivel FROM PUBLIC;
REVOKE ALL ON TABLE nivel FROM postgres;
GRANT ALL ON TABLE nivel TO postgres;
GRANT ALL ON TABLE nivel TO soporte;


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 1731
-- Name: procesador; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE procesador FROM PUBLIC;
REVOKE ALL ON TABLE procesador FROM postgres;
GRANT ALL ON TABLE procesador TO postgres;
GRANT ALL ON TABLE procesador TO soporte;


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 1732
-- Name: ram; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE ram FROM PUBLIC;
REVOKE ALL ON TABLE ram FROM postgres;
GRANT ALL ON TABLE ram TO postgres;
GRANT ALL ON TABLE ram TO soporte;


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 1733
-- Name: reguladores; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE reguladores FROM PUBLIC;
REVOKE ALL ON TABLE reguladores FROM postgres;
GRANT ALL ON TABLE reguladores TO postgres;
GRANT ALL ON TABLE reguladores TO soporte;


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 1807
-- Name: regdocumento; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE regdocumento FROM PUBLIC;
REVOKE ALL ON TABLE regdocumento FROM postgres;
GRANT ALL ON TABLE regdocumento TO postgres;
GRANT ALL ON TABLE regdocumento TO soporte;


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 1734
-- Name: softequip; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE softequip FROM PUBLIC;
REVOKE ALL ON TABLE softequip FROM postgres;
GRANT ALL ON TABLE softequip TO postgres;
GRANT ALL ON TABLE softequip TO soporte;


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 1735
-- Name: software; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE software FROM PUBLIC;
REVOKE ALL ON TABLE software FROM postgres;
GRANT ALL ON TABLE software TO postgres;
GRANT ALL ON TABLE software TO soporte;


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 1736
-- Name: sonido; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE sonido FROM PUBLIC;
REVOKE ALL ON TABLE sonido FROM postgres;
GRANT ALL ON TABLE sonido TO postgres;
GRANT ALL ON TABLE sonido TO soporte;


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 1737
-- Name: soperativo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE soperativo FROM PUBLIC;
REVOKE ALL ON TABLE soperativo FROM postgres;
GRANT ALL ON TABLE soperativo TO postgres;
GRANT ALL ON TABLE soperativo TO soporte;


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 1738
-- Name: soporte; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE soporte FROM PUBLIC;
REVOKE ALL ON TABLE soporte FROM postgres;
GRANT ALL ON TABLE soporte TO postgres;
GRANT ALL ON TABLE soporte TO soporte;


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 1739
-- Name: switches; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE switches FROM PUBLIC;
REVOKE ALL ON TABLE switches FROM postgres;
GRANT ALL ON TABLE switches TO postgres;
GRANT ALL ON TABLE switches TO soporte;


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 1808
-- Name: swidocumento; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE swidocumento FROM PUBLIC;
REVOKE ALL ON TABLE swidocumento FROM postgres;
GRANT ALL ON TABLE swidocumento TO postgres;
GRANT ALL ON TABLE swidocumento TO soporte;


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 1740
-- Name: tdispositivo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tdispositivo FROM PUBLIC;
REVOKE ALL ON TABLE tdispositivo FROM postgres;
GRANT ALL ON TABLE tdispositivo TO postgres;
GRANT ALL ON TABLE tdispositivo TO soporte;


--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 1741
-- Name: teclados; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE teclados FROM PUBLIC;
REVOKE ALL ON TABLE teclados FROM postgres;
GRANT ALL ON TABLE teclados TO postgres;
GRANT ALL ON TABLE teclados TO soporte;


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 1809
-- Name: tecdocumento; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tecdocumento FROM PUBLIC;
REVOKE ALL ON TABLE tecdocumento FROM postgres;
GRANT ALL ON TABLE tecdocumento TO postgres;
GRANT ALL ON TABLE tecdocumento TO soporte;


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 1742
-- Name: temporal; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE temporal FROM PUBLIC;
REVOKE ALL ON TABLE temporal FROM postgres;
GRANT ALL ON TABLE temporal TO postgres;
GRANT ALL ON TABLE temporal TO soporte;


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 1791
-- Name: tipousuario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tipousuario FROM PUBLIC;
REVOKE ALL ON TABLE tipousuario FROM postgres;
GRANT ALL ON TABLE tipousuario TO postgres;
GRANT ALL ON TABLE tipousuario TO soporte;


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 1744
-- Name: usuario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE usuario FROM PUBLIC;
REVOKE ALL ON TABLE usuario FROM postgres;
GRANT ALL ON TABLE usuario TO postgres;
GRANT ALL ON TABLE usuario TO soporte;


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 1761
-- Name: v1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE v1 FROM PUBLIC;
REVOKE ALL ON TABLE v1 FROM postgres;
GRANT ALL ON TABLE v1 TO postgres;
GRANT ALL ON TABLE v1 TO soporte;


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 1762
-- Name: v2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE v2 FROM PUBLIC;
REVOKE ALL ON TABLE v2 FROM postgres;
GRANT ALL ON TABLE v2 TO postgres;
GRANT ALL ON TABLE v2 TO soporte;


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 1770
-- Name: v10; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE v10 FROM PUBLIC;
REVOKE ALL ON TABLE v10 FROM postgres;
GRANT ALL ON TABLE v10 TO postgres;
GRANT ALL ON TABLE v10 TO soporte;


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 1745
-- Name: video; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE video FROM PUBLIC;
REVOKE ALL ON TABLE video FROM postgres;
GRANT ALL ON TABLE video TO postgres;
GRANT ALL ON TABLE video TO soporte;


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 1771
-- Name: v11; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE v11 FROM PUBLIC;
REVOKE ALL ON TABLE v11 FROM postgres;
GRANT ALL ON TABLE v11 TO postgres;
GRANT ALL ON TABLE v11 TO soporte;


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 1763
-- Name: v3; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE v3 FROM PUBLIC;
REVOKE ALL ON TABLE v3 FROM postgres;
GRANT ALL ON TABLE v3 TO postgres;
GRANT ALL ON TABLE v3 TO soporte;


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 1764
-- Name: v4; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE v4 FROM PUBLIC;
REVOKE ALL ON TABLE v4 FROM postgres;
GRANT ALL ON TABLE v4 TO postgres;
GRANT ALL ON TABLE v4 TO soporte;


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 1765
-- Name: v5; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE v5 FROM PUBLIC;
REVOKE ALL ON TABLE v5 FROM postgres;
GRANT ALL ON TABLE v5 TO postgres;
GRANT ALL ON TABLE v5 TO soporte;


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 1766
-- Name: v6; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE v6 FROM PUBLIC;
REVOKE ALL ON TABLE v6 FROM postgres;
GRANT ALL ON TABLE v6 TO postgres;
GRANT ALL ON TABLE v6 TO soporte;


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 1767
-- Name: v7; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE v7 FROM PUBLIC;
REVOKE ALL ON TABLE v7 FROM postgres;
GRANT ALL ON TABLE v7 TO postgres;
GRANT ALL ON TABLE v7 TO soporte;


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 1768
-- Name: v8; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE v8 FROM PUBLIC;
REVOKE ALL ON TABLE v8 FROM postgres;
GRANT ALL ON TABLE v8 TO postgres;
GRANT ALL ON TABLE v8 TO soporte;


--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 1769
-- Name: v9; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE v9 FROM PUBLIC;
REVOKE ALL ON TABLE v9 FROM postgres;
GRANT ALL ON TABLE v9 TO postgres;
GRANT ALL ON TABLE v9 TO soporte;


--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 1816
-- Name: vconteodedd; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vconteodedd FROM PUBLIC;
REVOKE ALL ON TABLE vconteodedd FROM postgres;
GRANT ALL ON TABLE vconteodedd TO postgres;
GRANT ALL ON TABLE vconteodedd TO soporte;


--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 1815
-- Name: vconteoderam; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vconteoderam FROM PUBLIC;
REVOKE ALL ON TABLE vconteoderam FROM postgres;
GRANT ALL ON TABLE vconteoderam TO postgres;
GRANT ALL ON TABLE vconteoderam TO soporte;


--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 1772
-- Name: vdiscoduros; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vdiscoduros FROM PUBLIC;
REVOKE ALL ON TABLE vdiscoduros FROM postgres;
GRANT ALL ON TABLE vdiscoduros TO postgres;
GRANT ALL ON TABLE vdiscoduros TO soporte;


--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 1788
-- Name: vdocumentosoporte; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vdocumentosoporte FROM PUBLIC;
REVOKE ALL ON TABLE vdocumentosoporte FROM postgres;
GRANT ALL ON TABLE vdocumentosoporte TO postgres;
GRANT ALL ON TABLE vdocumentosoporte TO soporte;


--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 1780
-- Name: vequipos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vequipos FROM PUBLIC;
REVOKE ALL ON TABLE vequipos FROM postgres;
GRANT ALL ON TABLE vequipos TO postgres;
GRANT ALL ON TABLE vequipos TO soporte;


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 1773
-- Name: vimpresoras; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vimpresoras FROM PUBLIC;
REVOKE ALL ON TABLE vimpresoras FROM postgres;
GRANT ALL ON TABLE vimpresoras TO postgres;
GRANT ALL ON TABLE vimpresoras TO soporte;


--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 1801
-- Name: vimpresorasp; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vimpresorasp FROM PUBLIC;
REVOKE ALL ON TABLE vimpresorasp FROM postgres;
GRANT ALL ON TABLE vimpresorasp TO postgres;
GRANT ALL ON TABLE vimpresorasp TO soporte;


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 1781
-- Name: vistaculminado; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vistaculminado FROM PUBLIC;
REVOKE ALL ON TABLE vistaculminado FROM postgres;
GRANT ALL ON TABLE vistaculminado TO postgres;
GRANT ALL ON TABLE vistaculminado TO soporte;


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 1802
-- Name: vistadocumento; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vistadocumento FROM PUBLIC;
REVOKE ALL ON TABLE vistadocumento FROM postgres;
GRANT ALL ON TABLE vistadocumento TO postgres;
GRANT ALL ON TABLE vistadocumento TO soporte;


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 1782
-- Name: vistaenrevision; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vistaenrevision FROM PUBLIC;
REVOKE ALL ON TABLE vistaenrevision FROM postgres;
GRANT ALL ON TABLE vistaenrevision TO postgres;
GRANT ALL ON TABLE vistaenrevision TO soporte;


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 1783
-- Name: vistapendiente; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vistapendiente FROM PUBLIC;
REVOKE ALL ON TABLE vistapendiente FROM postgres;
GRANT ALL ON TABLE vistapendiente TO postgres;
GRANT ALL ON TABLE vistapendiente TO soporte;


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 1793
-- Name: vistasoportes; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vistasoportes FROM PUBLIC;
REVOKE ALL ON TABLE vistasoportes FROM postgres;
GRANT ALL ON TABLE vistasoportes TO postgres;
GRANT ALL ON TABLE vistasoportes TO soporte;


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 1810
-- Name: vistausuarios; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vistausuarios FROM PUBLIC;
REVOKE ALL ON TABLE vistausuarios FROM postgres;
GRANT ALL ON TABLE vistausuarios TO postgres;
GRANT ALL ON TABLE vistausuarios TO soporte;


--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 1774
-- Name: vmonitores; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vmonitores FROM PUBLIC;
REVOKE ALL ON TABLE vmonitores FROM postgres;
GRANT ALL ON TABLE vmonitores TO postgres;
GRANT ALL ON TABLE vmonitores TO soporte;


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 1797
-- Name: vmonitoresp; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vmonitoresp FROM PUBLIC;
REVOKE ALL ON TABLE vmonitoresp FROM postgres;
GRANT ALL ON TABLE vmonitoresp TO postgres;
GRANT ALL ON TABLE vmonitoresp TO soporte;


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 1775
-- Name: vmouse; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vmouse FROM PUBLIC;
REVOKE ALL ON TABLE vmouse FROM postgres;
GRANT ALL ON TABLE vmouse TO postgres;
GRANT ALL ON TABLE vmouse TO soporte;


--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 1799
-- Name: vmousep; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vmousep FROM PUBLIC;
REVOKE ALL ON TABLE vmousep FROM postgres;
GRANT ALL ON TABLE vmousep TO postgres;
GRANT ALL ON TABLE vmousep TO soporte;


--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 1776
-- Name: vreguladores; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vreguladores FROM PUBLIC;
REVOKE ALL ON TABLE vreguladores FROM postgres;
GRANT ALL ON TABLE vreguladores TO postgres;
GRANT ALL ON TABLE vreguladores TO soporte;


--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 1800
-- Name: vreguladoresp; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vreguladoresp FROM PUBLIC;
REVOKE ALL ON TABLE vreguladoresp FROM postgres;
GRANT ALL ON TABLE vreguladoresp TO postgres;
GRANT ALL ON TABLE vreguladoresp TO soporte;


--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 1777
-- Name: vswitches; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vswitches FROM PUBLIC;
REVOKE ALL ON TABLE vswitches FROM postgres;
GRANT ALL ON TABLE vswitches TO postgres;
GRANT ALL ON TABLE vswitches TO soporte;


--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 1778
-- Name: vteclados; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vteclados FROM PUBLIC;
REVOKE ALL ON TABLE vteclados FROM postgres;
GRANT ALL ON TABLE vteclados TO postgres;
GRANT ALL ON TABLE vteclados TO soporte;


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 1798
-- Name: vtecladosp; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vtecladosp FROM PUBLIC;
REVOKE ALL ON TABLE vtecladosp FROM postgres;
GRANT ALL ON TABLE vtecladosp TO postgres;
GRANT ALL ON TABLE vtecladosp TO soporte;


--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 1787
-- Name: vusuariossoporte; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vusuariossoporte FROM PUBLIC;
REVOKE ALL ON TABLE vusuariossoporte FROM postgres;
GRANT ALL ON TABLE vusuariossoporte TO postgres;
GRANT ALL ON TABLE vusuariossoporte TO soporte;


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 1792
-- Name: vusuariossoporte21; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vusuariossoporte21 FROM PUBLIC;
REVOKE ALL ON TABLE vusuariossoporte21 FROM postgres;
GRANT ALL ON TABLE vusuariossoporte21 TO postgres;
GRANT ALL ON TABLE vusuariossoporte21 TO soporte;


-- Completed on 2012-02-23 15:14:44

--
-- PostgreSQL database dump complete
--

