CREATE TABLE Client
(
    id_doc INT PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL, 
    second_name VARCHAR(25),
    last_name VARCHAR(25) NOT NULL,
    second_last_name VARCHAR(25),
    age INT NOT NULL
);

CREATE TABLE Game
(
    game_id SERIAL,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(200) NOT NULL,
    age_restriction VARCHAR(3) NOT NULL,
    price FLOAT NOT NULL,
    console VARCHAR(20), 
    --constraints
    CONSTRAINT Pk_game PRIMARY KEY (game_id),
    CONSTRAINT CK_age CHECK(age_restriction = 'Yes' OR age_restriction = 'No')
);

CREATE TABLE Sale
(
    id SERIAL,
    id_doc INT,
    game_id INT,
    transaction_date DATE,
    --CONSTRAINTS
    CONSTRAINT PK_sale PRIMARY KEY(id,id_doc,game_id),
    CONSTRAINT FK_client_sale FOREIGN KEY (id_doc) REFERENCES Client(id_doc),
    CONSTRAINT FK_Game_sale FOREIGN KEY (game_id) REFERENCES Game(game_id)

);


--clientes
INSERT INTO client(id_doc,first_name,second_name,last_name,second_last_name,age) 
VALUES
(
    26995587,
    'Daniel',
    NULL,
    'Rivero',
    'Santamaria',
    21
),
(
    28175625,
    'Ivan',
    NULL,
    'Carpio',
    NULL,
    21
),
(
    28143625,
    'Angyee',
    NULL,
    'Marin',
    NULL,
    20
),
(
    27588638,
    'Juan',
    'Jose',
    'Gonzales',
    NULL,
    20
),
(
    1,
    'Wilman',
    NULL,
    'Grandett',
    Null,
    21
);
--games 
INSERT INTO Game(name,age_restriction,description,price)
VALUES
(
    'The legend of zelda: A Link to the past',
    'No',
    'a guy who will save hyrule yay :D',
    15.30
),
(
    'Uncharted 4',
    'Yes',
    'a horny thief',
    20.50
),
(
    'Crash Bandicoot',
    'No',
    'Carlos el topo que gira',
    15.30
),
(
    'Mario Kart 64',
    'No',
    'psycho mustache dwarf',
    15.30
);

--sales
INSERT INTO Sale(id_doc,game_id,transaction_date) VALUES
(26995587,1,CURRENT_DATE),
(26995587,4,CURRENT_DATE),
(28175625,2,CURRENT_DATE),
(28143625,4,CURRENT_DATE),
(27588638,3,CURRENT_DATE);

--lectura de informacion
SELECT c.first_name as client_name, g.name as game_name, g.description as game_description, to_char(g.price,'999,999,999.99 $') as game_price, s.transaction_date FROM sale s 
INNER JOIN game g ON s.game_id = g.game_id
INNER JOIN client c ON c.id_doc = s.id_doc;


--respuesta del servidor 
{
    client_name:valor,
    game_name:valor,
    game_price: '20.50$',
    transaction_date
}


CREATE TABLE Catalogue
(
    game_id SERIAL,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(200) NOT NULL,
    age_restriction VARCHAR(3) NOT NULL,
    price FLOAT NOT NULL,
    console VARCHAR(20), 
    --constraints
    CONSTRAINT Pk_game PRIMARY KEY (game_id),
    CONSTRAINT CK_age CHECK(age_restriction = 'Yes' OR age_restriction = 'No')
);