---SERFEST---
---TABLAS---
CREATE TABLE Cliente (
    cedula VARCHAR(10) PRIMARY KEY, 
    nombre VARCHAR(20) NOT NULL, 
    apellido VARCHAR(20) NOT NULL, 
    correo VARCHAR(40) NOT NULL, 
    telefono BIGINT, 
    contrasena VARCHAR(20) NOT NULL
);

CREATE TABLE Empresa (
    rif VARCHAR(15) PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL, 
    direccion VARCHAR(100) NOT NULL, 
    correo VARCHAR(40) NOT NULL, 
    servicio VARCHAR(50) NOT NULL, 
    telefono VARCHAR(20), 
    contrasena VARCHAR(20) NOT NULL, 
    info VARCHAR(60),
	id SERIAL,
    imagen BYTEA
);

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

CREATE OR REPLACE FUNCTION loginE (correo_usuario VARCHAR, contrasena_usuario VARCHAR) RETURNS bool AS $$
DECLARE
	columna Empresa%rowtype;
BEGIN
	SELECT * FROM Empresa
	into columna
	WHERE correo=correo_usuario AND contrasena=contrasena_usuario;
	
	if found then
		RETURN TRUE;
	else 
		RETURN FALSE;
	end if;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verificadorCorreo (correo_usuario VARCHAR) RETURNS bool AS $$
DECLARE
	col_Cliente Cliente%rowtype;
	col_Empresa Empresa%rowtype;
BEGIN
	SELECT * FROM Cliente
	into col_Cliente
	WHERE correo=correo_usuario;
	
	if found then
		RETURN TRUE;
	else 
		SELECT * FROM Empresa
		into col_Empresa
		WHERE correo=correo_usuario;

		if found then 
			RETURN TRUE;
		else
			RETURN FALSE;
		end if;
	end if;

END;
$$ LANGUAGE plpgsql;

--FILTRO---
SELECT * FROM Empresa ORDER BY id ASC;
SELECT * FROM Empresa ORDER BY id DESC;

----------------------------------------------------------------INSERCIONES DE EMPRESAS-------------------------------------------------------------------------------
--SERVICIO TÉCNICO---
INSERT INTO Empresa VALUES ('J-14785000-1', 'ReparaTodo', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'reparatodo@gmail.com', 'Servicio Tecnico', '0800-3457450', 'tecnico123', 'https://www.tecnico.com/');
INSERT INTO Empresa VALUES ('J-45645600-1', 'MundoCompu', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'mundocompu@gmail.com', 'Servicio Tecnico', '0800-3457450', 'tecnico123', 'https://www.tecnico.com/');
INSERT INTO Empresa VALUES ('J-14564560-1', 'TecnologiaSimple', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'tecnosimple@gmail.com', 'Servicio Tecnico', '0800-3457450', 'tecnico123', 'https://www.tecnico.com/');
INSERT INTO Empresa VALUES ('J-78978970-1', 'TecnoMundo', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'tecnomundo@gmail.com', 'Servicio Tecnico', '0800-3457450', 'tecnico123', 'https://www.tecnico.com/');
INSERT INTO Empresa VALUES ('J-45645640-1', 'Tel-Repa', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'telrepa@gmail.com', 'Servicio Tecnico', '0800-3457450', 'tecnico123', 'https://www.tecnico.com/');
INSERT INTO Empresa VALUES ('J-23423420-1', 'Telefoneitor', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'telefoneitor@gmail.com', 'Servicio Tecnico', '0800-3457450', 'tecnico123', 'https://www.tecnico.com/');
--TRANSPORTE--
INSERT INTO Empresa VALUES ('J-64675676-2', 'RapiTaxi', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'rapitaxi@gmail.com', 'Transporte', '0800-3457450', 'transporte123', 'https://www.transporte.com/');
INSERT INTO Empresa VALUES ('J-75675677-2', 'Taxi24h', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'taxi24h@gmail.com', 'Transporte', '0800-3457450', 'transporte123', 'https://www.transporte.com/');
INSERT INTO Empresa VALUES ('J-56756756-2', 'Colectivo', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'colectivo@gmail.com', 'Transporte', '0800-3457450', 'transporte123', 'https://www.transporte.com/');
INSERT INTO Empresa VALUES ('J-53453454-2', 'Reggeir', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'reggeir@gmail.com', 'Transporte', '0800-3457450', 'transporte123', 'https://www.transporte.com/');
INSERT INTO Empresa VALUES ('J-79789789-2', 'TansporteBIC', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'transportebic@gmail.com', 'Transporte', '0800-3457450', 'transporte123', 'https://www.transporte.com/');
INSERT INTO Empresa VALUES ('J-23423424-2', 'MuevetePlus', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'mueveteplus@gmail.com', 'Transporte', '0800-3457450', 'transporte123', 'https://www.transporte.com/');
--MEDICINA---
INSERT INTO Empresa VALUES ('J-00020200-3', 'Farmatodo', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', '0800@farmatodo.com', 'Medicina', '0800-3276286', 'farma123', 'https://www.farmatodo.com/');
INSERT INTO Empresa VALUES ('J-33333333-3', 'Hospital Vargas de Caracas', 'San Simeon a Monte Carmelo, Caracas 1010, Distrito Capital', 'hospitalvargas@gmail.com', 'Medicina', '(0212)862.9965', 'farma123', 'https://hospitalvargas.wordpress.com/');
INSERT INTO Empresa VALUES ('J-12320200-3', 'MedicaTodo', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'medicaTodo@gmail.com', 'Medicina', '0800-3276286', 'farma123', 'https://www.farmatodo.com/');
INSERT INTO Empresa VALUES ('J-23420200-3', 'Farmacia24H', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'farma24H@gmail.com', 'Medicina', '0800-3276286', 'farma123', 'https://www.farmatodo.com/');
INSERT INTO Empresa VALUES ('J-23421230-3', 'Hospital Gran Caracas', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'hospitalgrancaracas@gmail.com', 'Medicina', '0800-3276286', 'farma123', 'https://www.farmatodo.com/');
INSERT INTO Empresa VALUES ('J-23420230-3', 'Clinica Santa Cecilia', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'santacecilia@gmail.com', 'Medicina', '0800-3276286', 'farma123', 'https://www.farmatodo.com/');
--RESTAURANTE--
INSERT INTO Empresa VALUES ('J-25555555-4', 'La Casa Blanca', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'casablanca@gmail.com', 'Restaurante', '0800-3276286', 'restaurante123', 'https://www.restaurante.com/');
INSERT INTO Empresa VALUES ('J-23453454-4', 'The Krusty Krab', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'krustykrab@gmail.com', 'Restaurante', '0800-3276286', 'restaurante123', 'https://www.restaurante.com/');
INSERT INTO Empresa VALUES ('J-23423423-4', 'Rappi', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'rappi@gmail.com', 'Restaurante', '0800-3276286', 'restaurante123', 'https://www.restaurante.com/');
INSERT INTO Empresa VALUES ('J-78979789-4', 'Pedidos Ya', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'pedidosya@gmail.com', 'Restaurante', '0800-3276286', 'restaurante123', 'https://www.restaurante.com/');
INSERT INTO Empresa VALUES ('J-88888888-4', 'McDonalds', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'mcdonalds@gmail.com', 'Restaurante', '0800-3276286', 'restaurante123', 'https://www.restaurante.com/');
INSERT INTO Empresa VALUES ('J-97789789-4', 'Wendy', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'wendy@gmail.com', 'Restaurante', '0800-3276286', 'restaurante123', 'https://www.restaurante.com/');
--PLOMERIA--
INSERT INTO Empresa VALUES ('J-34534533-5', 'Plomeros24h', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'plomero24h@gmail.com', 'Plomeria', '0800-3276286', 'plomeria123', 'https://www.plomeria.com/');
INSERT INTO Empresa VALUES ('J-09876543-5', 'Plomer', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'plomer24h@gmail.com', 'Plomeria', '0800-3276286', 'plomeria123', 'https://www.plomeria.com/');
INSERT INTO Empresa VALUES ('J-11111111-5', 'Plomeros de Venezuela', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'plomerosccs@gmail.com', 'Plomeria', '0800-3276286', 'plomeria123', 'https://www.plomeria.com/');
INSERT INTO Empresa VALUES ('J-99888484-5', 'Emplome', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'emplome@gmail.com', 'Plomeria', '0800-3276286', 'plomeria123', 'https://www.plomeria.com/');
INSERT INTO Empresa VALUES ('J-23423423-5', 'Displomer', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'displomer@gmail.com', 'Plomeria', '0800-3276286', 'plomeria123', 'https://www.plomeria.com/');
INSERT INTO Empresa VALUES ('J-23421423-5', 'Plomeros12h', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'plomero24h@gmail.com', 'Plomeria', '0800-3276286', 'plomeria123', 'https://www.plomeria.com/');
--AUTOMOTRIZ--
INSERT INTO Empresa VALUES ('J-03849518-6', 'Venecia Automotriz', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'venecia@gmail.com', 'Automotriz', '0800-3276286', 'auto123', 'https://www.automotriz.com/');
INSERT INTO Empresa VALUES ('J-23423423-6', 'Volgan', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'volgan@gmail.com', 'Automotriz', '0800-3276286', 'auto123', 'https://www.automotriz.com/');
INSERT INTO Empresa VALUES ('J-33333333-6', 'FD Automotriz', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'fdautomotriz@gmail.com', 'Automotriz', '0800-3276286', 'auto123', 'https://www.automotriz.com/');
INSERT INTO Empresa VALUES ('J-44444444-6', 'Multimarca Automotriz', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'multimarca@gmail.com', 'Automotriz', '0800-3276286', 'auto123', 'https://www.automotriz.com/');
INSERT INTO Empresa VALUES ('J-09489494-6', 'Rendon Automotriz', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'rendon@gmail.com', 'Automotriz', '0800-3276286', 'auto123', 'https://www.automotriz.com/');
INSERT INTO Empresa VALUES ('J-22122423-6', 'Automotriz Selasor', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'selasor@gmail.com', 'Automotriz', '0800-3276286', 'auto123', 'https://www.automotriz.com/');
--MANTENIMIENTO LINEA BLANCA--
INSERT INTO Empresa VALUES ('J-23423434-7', 'Da+co', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'da+co@gmail.com', 'Linea Blanca', '0800-3276286', 'blanca123', 'https://www.linea blanca.com/');
INSERT INTO Empresa VALUES ('J-34534534-7', 'Credimport', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'credimport@gmail.com', 'Linea Blanca', '0800-3276286', 'blanca123', 'https://www.linea blanca.com/');
INSERT INTO Empresa VALUES ('J-55555555-7', 'Grupo Nofa', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'gruponofa@gmail.com', 'Linea Blanca', '0800-3276286', 'blanca123', 'https://www.linea blanca.com/');
INSERT INTO Empresa VALUES ('J-06454565-7', 'Volpel', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'volpel@gmail.com', 'Linea Blanca', '0800-3276286', 'blanca123', 'https://www.linea blanca.com/');
INSERT INTO Empresa VALUES ('J-54564554-7', 'Haus', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'haus@gmail.com', 'Linea Blanca', '0800-3276286', 'blanca123', 'https://www.linea blanca.com/');
INSERT INTO Empresa VALUES ('J-22222345-7', 'Nasri', 'Av. Intercomunal Del Valle, Calle Zea Coche, Calle 2, Caracas, Distrito Capital', 'nasri@gmail.com', 'Linea Blanca', '0800-3276286', 'blanca123', 'https://www.linea blanca.com/');

--CLIENTES--
INSERT INTO Cliente VALUES (28143625, 'Angyee', 'Marín', 'angyeemarin@gmail.com', 04129291497, 'angyee230301');
INSERT INTO Cliente VALUES (27660358, 'Wilman', 'Grandett', 'wilmangrandett@gmail.com', 04129291497, 'wilman');
