/* Criação de Tabelas no SQLite
	
	Devido a sintaxe do SQLite não encontrei forma de tratar os valores booleanos, 
	No Oracle eu usaria a constraint CHECK para definir valores para SIM(S) E
	Não(N). Sendo assim, utilizei o DATATYPE INT para checagem de status, onde 0 é false e
	1 é true.
	Desta forma passando este tratamento para encargo da aplicação.

	Algumas tabelas não foram inseridos dados, como em Hospedagem e Temporada,
	pois não estava proposto no enunciado sua inserção.
	Grato! 
*/



/*Criando as Tabelas*/

CREATE TABLE Cliente (
    id_Cliente INTEGER(32) PRIMARY KEY,
    cpf_Cliente VARCHAR(16),
    nm_Cliente VARCHAR(32),
    sbnm_Cliente VARCHAR(48),
    rg_Cliente VARCHAR(16),
    dtnasc_Cliente DATETIME,
    fone_Cliente VARCHAR(16),
    endrc_Cliente VARCHAR(128)
);


CREATE TABLE Reserva (
    id_Reserva INTEGER(32) PRIMARY KEY,
    dt_Cheg DATETIME,
    stat_Reserva INT(1),                  
    qtd_Acomp INTEGER(3),
    tp_Hospedagem VARCHAR(12),
    id_Cliente INTEGER(32),
    num_Quarto INTEGER(3),
	FOREIGN KEY (id_Cliente) REFERENCES Cliente (id_Cliente),
	FOREIGN KEY (num_Quarto) REFERENCES Quarto (num_Quarto)
);


CREATE TABLE Acompanhante (
    cpf_Acomp VARCHAR(16) PRIMARY KEY,
    rg_Acomp VARCHAR(16) NOT NULL,
    nm_Acomp VARCHAR(32),
    sbnm_Acomp VARCHAR(48),
    dtnasc_Acomp DATETIME NOT NULL,
    id_Cliente INTEGER(32),
	FOREIGN KEY (id_Cliente) REFERENCES Cliente (id_Cliente)
);


CREATE TABLE TipoHospedagem (
    tp_Hospedagem VARCHAR(12) PRIMARY KEY,
    vltp_Hospedagem DECIMAL(12,2)
);


CREATE TABLE Temporada (
    nm_Temporada VARCHAR(12) PRIMARY KEY,
    vl_Temporada DECIMAL(12,2)
);


CREATE TABLE TipoQuarto (
    tp_Quarto VARCHAR(12) PRIMARY KEY,
    vltp_Quarto DECIMAL(12,2)
    
);
 

CREATE TABLE Quarto (
    num_Quarto INTEGER(3) PRIMARY KEY,
    andar_Quarto INTEGER(2),
    disp_Quarto INT(1),
    qtd_Comodos INTEGER(2),
    id_Reserva INTEGER(32),
    tp_Quarto VARCHAR(12),
	FOREIGN KEY (id_Reserva) REFERENCES Reserva (id_Reserva),
	FOREIGN KEY (tp_Quarto) REFERENCES TipoQuarto (tp_Quarto)
);


CREATE TABLE Hospedagem (
    id_Hospedagem INTEGER(32) PRIMARY KEY,
    dt_Entrada DATETIME,
    dt_Saida DATETIME,
    stat_Hospedagem INT(1),
    vl_Hospedagem DECIMAL(12,2),
    nm_Hospede VARCHAR(32),
    num_Quarto INTEGER(3),
    tp_Hospedagem VARCHAR(12),
    nm_Temporada VARCHAR(12),
	FOREIGN KEY (num_Quarto) REFERENCES Quarto (num_Quarto),
	FOREIGN KEY (tp_Hospedagem) REFERENCES TipoHospedagem (tp_Hospedagem),
	FOREIGN KEY (nm_Temporada) REFERENCES Temporada (nm_Temporada)
);


/* Inserindo Dados nas Tabelas */

INSERT INTO Cliente VALUES (1,'133.987.270-69','Mateus','Risoto P. Ferro','18.066.442-6', '01/05/1957', '892133097', 'Rua das Flores, Bairro Belo, Marilía, SP');


INSERT INTO Cliente VALUES (2,'017.145.520-71','Carla','Oliva da Passa Uva','46.714.830-2', '23/03/1988', '254879654', 'Rua das Ortencias, Bairro Florido, Niterói RJ');


INSERT INTO Cliente VALUES (3,'671.480.210-22','Lucas','Fernandes Borges','29.690.195-7', '09/07/2000', '445785123', 'Rua Bernardino Fonseca, Bairro Horizonte, Canoas, RS');


INSERT INTO Cliente VALUES (4,'799.103.970-64','João','Abreu Costa','47.809.160-6', '31/12/1976', '323658412', 'Rua das Pombas, Bairro Canudos, Novo Hamburgo, SC');


INSERT INTO Cliente VALUES (5,'924.042.290-01','André','Bifes do Campo','25.605.634-1', '12/08/1995', '451257874', 'Rua Alfredo Marotiz, Bairro Maua, Porto Alegre, RS');


INSERT INTO Cliente VALUES (6,'115.422.710-37','Pedro','Laravel','23.450.415-8', '22/02/1998', '112544785', 'Rua Aurora, Bairro Centro, Medianeira, PR');


INSERT INTO Cliente VALUES (7,'524.761.490-98','Maria','Verdina da Silva','47.108.733-6', '11/09/1969', '787848954', 'Rua Inacio Plang, Bairro Bela Vista, Vacaria RS');


INSERT INTO Cliente VALUES (8,'878.513.240-33','Salete','Cale Bukowisk','20.648.560-8', '23/05/1999', '636545218', 'Rua Paulo Batista, Bairro Imigrante, Gramado, MS');


INSERT INTO Cliente VALUES (9,'033.984.220-20','Heloísa','Nestle','17.044.712-1', '25/03/1987', '221454785', 'Rua João 23, Bairro Imigrante SUl, Campo Bom, RS');


INSERT INTO Cliente VALUES (10,'590.868.810-09','Adalto','Filho','27.139.879-6', '15/11/2001', '112457895', 'Rua Alberto Callegari, Bairro Kipling, Matelandia, PR');



/*Inserindo valores na tabela TipoHospedagem
Onde estrão as tarifas diárias de cada tipo*/

INSERT INTO TipoHospedagem VALUES ('Gold', 699.99);		
INSERT INTO TipoHospedagem VALUES ('Platinum', 599.00);
INSERT INTO TipoHospedagem VALUES ('Bronze', 399.89);
INSERT INTO TipoHospedagem VALUES ('White', 299.39);
INSERT INTO TipoHospedagem VALUES ('Gray', 229.00);



/*Inserindo valores na tabela TipoQuarto*/

INSERT INTO TipoQuarto VALUES ('Um Comodo', null);
INSERT INTO TipoQuarto VALUES ('Dois Comodos', null);
INSERT INTO TipoQuarto VALUES ('Três Comodos', null);



/*Inserindo valores referentes a tabela Quarto*/

INSERT INTO Quarto VALUES (101, 1, 0, 2, null, 'Um Comodo');
INSERT INTO Quarto VALUES (107, 1, 0, 2, null, 'Um Comodo');
INSERT INTO Quarto VALUES (203, 2, 0, 2, null, 'Um Comodo');
INSERT INTO Quarto VALUES (105, 1, 0, 2, null, null);
INSERT INTO Quarto VALUES (409, 4, 0, 2, null, 'Três Comodos');
INSERT INTO Quarto VALUES (505, 5, 0, 2, null, 'Um Comodo');
INSERT INTO Quarto VALUES (610, 6, 0, 2, null, 'Três Comodos');
INSERT INTO Quarto VALUES (303, 3, 0, 2, null, null);
INSERT INTO Quarto VALUES (508, 5, 0, 2, null, null);
INSERT INTO Quarto VALUES (204, 2, 0, 2, null, null);



/*Inserindo valores na tabela Reserva*/

INSERT INTO Reserva VALUES (00077, '12/10/2021', 1, 0, 'Gold', 2, 505);
INSERT INTO Reserva VALUES (00109, '23/05/2021', 1, 1, 'Gray', 10, 204);














































