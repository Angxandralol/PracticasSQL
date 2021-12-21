-- --CREACION DE TABLA DE SERVICIO
CREATE TABLE servicio
(
    categoria VARCHAR(30) PRIMARY KEY    
);

-- --CREACION DE TABLA DE EMPRESA
CREATE TABLE empresa
(
    rif INT PRIMARY KEY,
    tipo_service VARCHAR(30), 
    nombre VARCHAR(30)
);

-- --FOREIGN KEY
ALTER TABLE empresa
ADD CONSTRAINT Fk_tipo_service
FOREIGN KEY (tipo_service)
REFERENCES servicio(categoria)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- --INSERCIÓN DE SERVICIOS

INSERT INTO servicio VALUES('Farmacia');
INSERT INTO servicio VALUES('Ferreteria');
INSERT INTO servicio VALUES('Restaurante');
INSERT INTO servicio VALUES('Supermercado');

-- --iNSERCIÓN DE EMPRESAS

INSERT INTO empresa VALUES(1111, 'Farmacia','Farmatodo');
INSERT INTO empresa VALUES(2222, 'Ferreteria','EPA');
INSERT INTO empresa VALUES(3333, 'Restaurante','McDonalds');
INSERT INTO empresa VALUES(4444, 'Supermercado','Central Madeirense');
INSERT INTO empresa VALUES(5555, 'Farmacia','Locatel');
INSERT INTO empresa VALUES(6666, 'Farmacia','Farmahorro');
INSERT INTO empresa VALUES(7777, 'Restaurante','Wendy');
INSERT INTO empresa VALUES(8888, 'Farmacia','Fundafarmacia');
