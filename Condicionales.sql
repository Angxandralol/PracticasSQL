
--CONDICIONAL PARA 
DO $$
BEGIN 
    IF EXISTS (SELECT 'email' FROM Usuario WHERE email='sofia@gmail.com') THEN
        RAISE NOTICE 'Si existe el usuario';
    ELSE 
        RAISE NOTICE 'No existe el usuario';
    END IF;
END $$


--FUNCIÓN 
--1
CREATE OR REPLACE FUNCTION sumar (INT, INT) RETURNS INT 
AS
    'SELECT $1 + $2;'
LANGUAGE SQL;

SELECT sumar(3,7);
--2
CREATE OR REPLACE FUNCTION estar(VARCHAR) RETURNS VARCHAR 
AS
    'SELECT email FROM Usuario WHERE email=$1'
LANGUAGE SQL;

SELECT estar('sofia@gmail.com');
--3	
CREATE OR REPLACE FUNCTION cargar() RETURNS VOID 
AS
$$
    INSERT INTO Usuario (name,email,passoword) VALUES('alejandra', 'alejandra@gmail.com', 1234789); 
$$
LANGUAGE SQL;

SELECT cargar();
--4
