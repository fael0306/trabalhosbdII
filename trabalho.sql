CREATE TABLE Documento(
 Titulo VARCHAR(50),  
 Datas DATE,  
 Autor VARCHAR(50),  
 Conteudo VARCHAR(50)
);

CREATE TABLE Acervo(
    id INT PRIMARY KEY,
    tema VARCHAR(100),
    instituicao VARCHAR(100)
);

ALTER TABLE documento
ADD COLUMN acervo_id INT,
ADD FOREIGN KEY (acervo_id) REFERENCES Acervo(id);
