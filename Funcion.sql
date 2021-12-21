--FUNCION DE PRUEBA--

CREATE OR REPLACE FUNCTION Prueba (variable int) RETURNS int AS $$
BEGIN
	RETURN variable+1;
END;
$$ LANGUAGE plpgsql;

--LLAMADA--
SELECT Prueba(5);   


--PRUEBA 2 VERIFICACION PERO RETURN VOID--

CREATE OR REPLACE FUNCTION Verificacion (cedula_usuario int) RETURNS void AS $$
DECLARE
	celda Cliente%rowtype;
BEGIN
	SELECT * FROM Cliente
	into celda
	WHERE cedula=cedula_usuario;
	
	if found then
		raise notice 'TRUE';
	else 
		raise notice 'FALSE';
	end if;
END;
$$ LANGUAGE plpgsql;

--LLAMADA--
SELECT Verificacion(12345); --ver el apartado de "Messages"--


--PRUEBA 3 VERIFICACION PERO RETURN BOOLEAN--
CREATE OR REPLACE FUNCTION Verificacion (cedula_usuario int) RETURNS bool AS $$
DECLARE
	celda Cliente%rowtype;
BEGIN
	SELECT * FROM Cliente
	into celda
	WHERE cedula=cedula_usuario;
	
	if found then
		RETURN TRUE;
	else 
		RETURN FALSE;
	end if;
END;
$$ LANGUAGE plpgsql;

--LLAMADA--
SELECT Verificacion(12345); 


--FUNCION DE LOGIN--
CREATE OR REPLACE FUNCTION login (correo_usuario VARCHAR, contrasena_usuario VARCHAR) RETURNS bool AS $$
DECLARE
	col_cedula Cliente%rowtype;
BEGIN
	SELECT * FROM Cliente
	into col_cedula
	WHERE correo=correo_usuario AND contrasena=contrasena_usuario;
	
	if found then
		RETURN TRUE;
	else 
		RETURN FALSE;
	end if;
END;
$$ LANGUAGE plpgsql;

--LLAMADA--
SELECT login('fulanito@gmail.com','12345');