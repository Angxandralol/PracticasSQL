---Se tiene una tabla llamada Cliente que tiene como llave primaria la columna llamada "cedula"--
DO $$
DECLARE
	celda Cliente%rowtype;
	cedula_usuario Cliente.cedula%type := 1234;
BEGIN
	SELECT * FROM Cliente
	into celda
	WHERE cedula=cedula_usuario;
	
	if found then
		 raise notice 'TRUE';
	else 
		raise notice 'FALSE';
	end if;
END $$