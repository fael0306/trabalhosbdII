CREATE TABLE Documento(
  Titulo VARCHAR(50), 
  Datas DATE, 
  Autor VARCHAR(50), 
  Conteudo TEXT
);

CREATE TABLE Acervo(
  id SERIAL PRIMARY KEY, 
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

CREATE INDEX idx_datas_brin ON Documento USING BRIN (Datas);

INSERT INTO Acervo (tema, instituicao) 
VALUES 
  ('Emilio Mira y López', 'UERJ');
  
INSERT INTO Acervo (tema, instituicao) 
VALUES 
  ('Celso Pereira de Sá', 'UERJ');
  
INSERT INTO Acervo (tema, instituicao) 
VALUES 
  ('Isabel Adrados', 'UERJ');
  
INSERT INTO Acervo (tema, instituicao) 
VALUES 
  ('Farias Brito', 'UERJ');
  
INSERT INTO Acervo (tema, instituicao) 
VALUES 
  ('Jayme Grabois', 'UERJ');
  
INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Teoria y práctica del psicoanálisis', 
    '01/02/1926', 'Emilio Mira y López', 
    'Apresenta uma visão geral da psicanálise freudiana.', 
    1
  );
  
INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Manual de Psicología Jurídica', 
    '01/01/1932', 'Emilio Mira y Lopez', 
    'Explora a interface entre psicologia e direito.', 
    1
  );
  
INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Manual de Psiquiatria', '03/06/1935', 
    'Emilio Mira y Lopez', 'Fornece uma visão dos transtornos mentais da época.', 
    1
  );
  
INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Psicodiagnóstico Miocinético (PMK)', 
    '07/11/1940', 'Emilio Mira y Lopez', 
    'Teste projetivo para avaliar o indivíduo.', 
    1
  );
  
INSERT INTO documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Cuatro gigantes del alma', '09/08/1959', 
    'Emilio Mira y Lopez', 'Explora as 4 emoções básicas.', 
    1
  );

/*
Inserir 5 documentos em cada Acervo e 2 pesquisadores em cada acervo de forma que cada pesquisador esteja em 2 acervos.
Para isso, precisa de 25 documentos e 5 pesquisadores.
*/
