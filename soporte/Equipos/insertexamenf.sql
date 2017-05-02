CREATE OR REPLACE FUNCTION insertexamenf(in_hpaciente bigint, in_fecha date, in_ta character(15), in_fc character(15), in_fr character(15),
										  in_peso character(15),
										  in_talla character(15),
										  in_temperatura character(15),
										  in_ecg text,
										  in_aspecto text)
RETURNS bigint AS
$BODY$  
DECLARE 
IDDOC bigint;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
BEGIN
SELECT nextval('id_examenf') INTO IDDOC;
INSERT INTO examenf (id, hpaciente, fecha, ta, fc, fr, peso, talla, temperatura, ecg, aspecto) VALUES (IDDOC,in_hpaciente,in_fecha,in_ta,in_fc,in_fr,in_peso,in_talla,in_temperatura,in_ecg,in_aspecto);
return IDDOC;	
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION insertexamenf(bigint,date,character(15),character(15),character(15),character(15),character(15),character(15),text,text) OWNER TO postgres;
