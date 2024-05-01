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
  ('Eliezer Schneider', 'UERJ');

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
    'Visão geral da psicanálise freudiana.', 
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
    'Emilio Mira y Lopez', 'Percepção dos transtornos mentais da época.', 
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
  
INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Cuatro gigantes del alma', '09/08/1959', 
    'Emilio Mira y Lopez', 'Explora as 4 emoções básicas.', 
    1
  );

INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Estudos de Psicologia Social', 
    '23/05/2015', 'Celso Pereira de Sá', 
    'Manual sobre vertentes da Psicologia Social.', 
    2
  );

INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Pesquisa em Representações Sociais', 
    '03/09/1998', 'Celso Pereira de Sá', 
    'Metodologia em representações sociais.', 
    2
  );

INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Memórias do Descobrimento do Brasil', 
    '25/05/2005', 'Celso Pereira de Sá', 
    'Disserta sobre a história do Brasil.', 
    2
  );

INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Psicologia do Controle Social', 
    '03/09/1973', 'Celso Pereira de Sá', 
    'Perspectivas de questões sociológicas na sociologia.', 
    2
  );

INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Sobre a Psicologia Social no Brasil', 
    '21/10/2007', 'Celso Pereira de Sá', 
    'História da Psicologia Social no Brasil.', 
    2
  );

INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Orientação Infantil', '09/03/1988', 
    'Isabel Adrados', 'Explanação sobre questões da infância.', 
    3
  );

INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'A Técnica de Rorschach em crianças', 
    '08/04/1985', 'Isabel Adrados', 
    'Manual de aplicação de testes projetivos em crianças.', 
    3
  );

INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Teoria e Prática do Teste de Rorschach', 
    '09/11/1982', 'Isabel Adrados', 
    'Manual teórico de testes projetivos em crianças.', 
    3
  );
  
INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Rorschach na adolescência normal e patológica', 
    '07/06/1976', 'Isabel Adrados', 
    'Aplicação de Rorschach na adolescência.', 
    3
  );
  
INSERT INTO Documento(
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Manual de Psicodiagnóstico', '08/08/1982', 
    'Isabel Adrados', 'Instrução da atuação do psicólogo frente a diagnósticos.', 
    3
  );
