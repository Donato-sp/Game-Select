drop database universo;
create database if not exists universo;
use universo;

CREATE TABLE planeta (
    id INT PRIMARY KEY,
    nomePlaneta VARCHAR(50),
    superpoder VARCHAR(45) NOT NULL
);

CREATE TABLE statusJogador (
	id INT PRIMARY KEY,
	estado_civil VARCHAR(45) NOT NULL,
	constraint chkJogadort CHECK (estado_civil IN("Casado", "Solteiro")));

CREATE TABLE times (
    id INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    planeta_id INT NOT NULL,
    universais VARCHAR(45),
    FOREIGN KEY (planeta_id) REFERENCES planeta(id)
);

CREATE TABLE estadio (
    id INT PRIMARY KEY,
    time_id INT,
    nome VARCHAR(45) NOT NULL,
    planeta_id INT,
    FOREIGN KEY (time_id) REFERENCES times(id),
    FOREIGN KEY (planeta_id) REFERENCES planeta(id)
);

CREATE TABLE jogador (
    id INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    status_id INT,
    time_id INT,
    planeta_id INT,
    FOREIGN KEY (status_id) REFERENCES statusJogador(id),
    FOREIGN KEY (time_id) REFERENCES times(id),
    FOREIGN KEY (planeta_id) REFERENCES planeta(id)
);

CREATE TABLE conjuge (
    id INT PRIMARY KEY,
    jogador_id INT,
    nome VARCHAR(45) NOT NULL,
    idade VARCHAR(45) NOT NULL,
    FOREIGN KEY (jogador_id) REFERENCES jogador(id)
);

CREATE TABLE partida (
    id INT PRIMARY KEY AUTO_INCREMENT,
    time_id1 INT,
    time_id2 INT,
    estadio_id INT,
    hora_partida DATETIME,
    golsTime1 VARCHAR(45),
    golsTime2 VARCHAR(45),
    FOREIGN KEY (time_id1) REFERENCES times(id),
    FOREIGN KEY (time_id2) REFERENCES times(id),
    FOREIGN KEY (estadio_id) REFERENCES estadio(id)
);

INSERT INTO planeta (id, nomePlaneta, superpoder) VALUES
(1, 'Z-4','Superfidelidade'),         -- cristiano ronaldo
(2, 'Hypernova','Show de bolisse'),        -- memphis
(3, 'Lua','Supervelocidade'),      -- neymar, messi
(4, 'Aurora-X','Gostosisse'),               -- yuri alberto
(5, 'Terra','Bom de bolisse'); -- ronaldo fenomeno

INSERT INTO statusJogador (id, estado_civil) VALUES
(1, 'Casado'),
(2, 'Solteiro');

INSERT INTO times (id, nome, planeta_id, universais) VALUES
(1, 'Z-TEAM', '1', '5'),
(2, 'HyperHype', '2', '3'),
(3, 'Cheaters FC', '3', '0'),
(4, 'Asteroide G', '4', '1'),
(5, 'Piritubers', '5', '1');

-- INSERTS nos estádios
INSERT INTO estadio (id, time_id, nome, planeta_id) VALUES
(1, 1, 'Portunhol', 2),
(2, 2, 'HyperNova', 2),
(3, 3, 'Moon-keys', 2),
(4, 4, 'Grande Estádio', 2),
(5, 5, 'Aquário', 2);

-- INSERTS nos jogadores
INSERT INTO jogador (id, nome, status_id, time_id, planeta_id) VALUES
(1, 'Cristiano Ronaldo', 2, 1, 1),   
(2, 'Lionel Messi', 2, 2, 3),        
(3, 'Neymar Jr', 2, 2, 3),           
(4, 'Ronaldo Fenômeno', 1, 2, 5),    
(5, 'Yuri Albert', 2, 3, 4),         
(6, 'Menphis Dapay', 1, 4, 2);       

-- INSERTS nos cônjuges
INSERT INTO conjuge (id, jogador_id, nome, idade) VALUES
(1, 2, 'Antonela Roccuzzo', '34'),
(2, 1, 'Georgina Rodríguez', '30'),
(3, 3, 'Marília Donato', '18'),
(4, 4, 'Matheus Soares', '19'),
(5, 5, 'Paulo César Advogado', '65'),
(6, 6, 'Paulo César Advogado', '65');

-- INSERTS em partidas
INSERT INTO partida (time_id1, time_id2, estadio_id, hora_partida, golsTime1, golsTime2) VALUES
(1, 3, 3, '2025-04-03 18:00:00', '2', '1'),
(4, 5, 4, '2025-04-25 20:00:00', '2', '3'),
(5, 2, 2, '2025-05-03 16:00:00', '1', '2'),
(5, 1, 5, '2025-05-20 18:30:00', '2', '3'),
(1, 2, 1, '2025-06-01 20:00:00', '3', '2');


