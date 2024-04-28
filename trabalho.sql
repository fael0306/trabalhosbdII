CREATE TABLE Documento(
  Titulo VARCHAR(50), 
  Datas DATE, 
  Autor VARCHAR(50), 
  Conteudo TEXT
);

CREATE TABLE Acervo(
  id INT PRIMARY KEY, 
  tema VARCHAR(100), 
  instituicao VARCHAR(100)
);

ALTER TABLE 
  documento 
ADD 
  COLUMN acervo_id INT, 
ADD 
  FOREIGN KEY (acervo_id) REFERENCES Acervo(id);

CREATE TABLE pesquisador(
  nome VARCHAR(50), 
  afiliacao VARCHAR(100), 
  matricula VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Pesquisador_Acervo(
  pesquisador_matricula VARCHAR(30) REFERENCES Pesquisador(matricula), 
  acervo_id INT REFERENCES Acervo(id), 
  PRIMARY KEY (
    pesquisador_matricula, acervo_id
  )
);

CREATE INDEX idx_datas_brin
ON Documento
USING BRIN (Datas);
