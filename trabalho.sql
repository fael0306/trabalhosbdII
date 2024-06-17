CREATE TABLE Acervo (
  id SERIAL PRIMARY KEY, 
  tema VARCHAR(100), 
  instituicao VARCHAR(100)
);

CREATE TABLE Documento (
  id SERIAL PRIMARY KEY, 
  Titulo VARCHAR(50), 
  Datas DATE, 
  Autor VARCHAR(50), 
  Conteudo TEXT, 
  acervo_id INT, 
  FOREIGN KEY (acervo_id) REFERENCES Acervo(id)
);

CREATE TABLE Pesquisador (
  matricula VARCHAR(30) PRIMARY KEY, 
  nome VARCHAR(50), 
  afiliacao VARCHAR(100)
);

CREATE TABLE Pesquisador_Acervo (
  pesquisador_matricula VARCHAR(30), 
  acervo_id INT, 
  PRIMARY KEY (
    pesquisador_matricula, acervo_id
  ), 
  FOREIGN KEY (pesquisador_matricula) REFERENCES Pesquisador(matricula), 
  FOREIGN KEY (acervo_id) REFERENCES Acervo(id)
);

CREATE INDEX idx_datas_brin ON Documento USING BRIN (Datas);

INSERT INTO Acervo (tema, instituicao) 
VALUES 
  ('Emilio Mira y López', 'UERJ'), 
  ('Celso Pereira de Sá', 'UERJ'), 
  ('Isabel Adrados', 'UERJ'), 
  ('Eliezer Schneider', 'UERJ'), 
  ('Antonio Gomes Penna', 'UERJ');

INSERT INTO Documento (
  Titulo, Datas, Autor, Conteudo, acervo_id
) 
VALUES 
  (
    'Teoria y práctica del psicoanálisis', 
    '1926-02-01', 'Emilio Mira y López', 
    'Visão geral da psicanálise freudiana.', 
    1
  ), 
  (
    'Manual de Psicología Jurídica', 
    '1932-01-01', 'Emilio Mira y Lopez', 
    'Explora a interface entre psicologia e direito.', 
    1
  ), 
  (
    'Manual de Psiquiatria', '1935-06-03', 
    'Emilio Mira y Lopez', 'Percepção dos transtornos mentais da época.', 
    1
  ), 
  (
    'Psicodiagnóstico Miocinético (PMK)', 
    '1940-11-07', 'Emilio Mira y Lopez', 
    'Teste projetivo para avaliar o indivíduo.', 
    1
  ), 
  (
    'Cuatro gigantes del alma', '1959-08-09', 
    'Emilio Mira y Lopez', 'Explora as 4 emoções básicas.', 
    1
  ), 
  (
    'Estudos de Psicologia Social', 
    '2015-05-23', 'Celso Pereira de Sá', 
    'Manual sobre vertentes da Psicologia Social.', 
    2
  ), 
  (
    'Pesquisa em Representações Sociais', 
    '1998-09-03', 'Celso Pereira de Sá', 
    'Metodologia em representações sociais.', 
    2
  ), 
  (
    'Memórias do Descobrimento do Brasil', 
    '2005-05-25', 'Celso Pereira de Sá', 
    'Disserta sobre a história do Brasil.', 
    2
  ), 
  (
    'Psicologia do Controle Social', 
    '1973-09-03', 'Celso Pereira de Sá', 
    'Perspectivas de questões sociológicas na sociologia.', 
    2
  ), 
  (
    'Sobre a Psicologia Social no Brasil', 
    '2007-10-21', 'Celso Pereira de Sá', 
    'História da Psicologia Social no Brasil.', 
    2
  ), 
  (
    'Orientação Infantil', '1988-03-09', 
    'Isabel Adrados', 'Explanação sobre questões da infância.', 
    3
  ), 
  (
    'A Técnica de Rorschach em crianças', 
    '1985-04-08', 'Isabel Adrados', 
    'Manual de aplicação de testes projetivos em crianças.', 
    3
  ), 
  (
    'Teoria e Prática do Teste de Rorschach', 
    '1982-11-09', 'Isabel Adrados', 
    'Manual teórico de testes projetivos em crianças.', 
    3
  ), 
  (
    'Rorschach na adolescência normal e patológica', 
    '1976-06-07', 'Isabel Adrados', 
    'Aplicação de Rorschach na adolescência.', 
    3
  ), 
  (
    'Manual de Psicodiagnóstico', '1982-08-08', 
    'Isabel Adrados', 'Instrução da atuação do psicólogo frente a diagnósticos.', 
    3
  ), 
  (
    'Eliezer Schneider', '2001-06-03', 
    'Ana Maria Jacó-Vilela', 'Coleção: Pioneiros da Psicologia Brasileira', 
    4
  ), 
  (
    'Psicologia Social - Histórica Cultural e Política', 
    '1978-09-28', 'Eliezer Schneider', 
    'Manual de Psicologia Social', 
    4
  ), 
  (
    'Eliezer Schneider, professor, 81 anos', 
    '1998-09-04', 'Antônio Gomes Penna', 
    'Jornal O Globo - Obituário', 
    4
  ), 
  (
    'Eliezer Schneider', '1996-10-23', 
    'Elza Maria do Socorro Dutra', 
    'Entrevista com Eliezer Schneider', 
    4
  ), 
  (
    'Eliezer Schneider', '1971-01-31', 
    'Jornal do Brasil', 'Palestra de Eliezer Schneider sobre conflito de gerações.', 
    4
  ), 
  (
    'História da Psicologia no Rio de Janeiro', 
    '1992-04-05', 'Antonio Gomes Penna', 
    'Desenvolvimento da Psicologia no Rio de Janeiro', 
    5
  ), 
  (
    'História das ideias psicológicas', 
    '1991-01-05', 'Antonio Gomes Penna', 
    'Comentários epistemológicos sobre as ideias psicológicas.', 
    5
  ), 
  (
    'Antonio Gomes Penna: Uma trajetória (...)', 
    '2010-08-04', 'Ana Maria Jacó-Vilela', 
    'Artigo biográfico sobre o Antonio Gomes Penna.', 
    5
  ), 
  (
    'Ciclo de palestra sobre Psicologia do futebol', 
    '1970-09-01', 'Nilton Ribeiro', 
    'Notícia  - O Jornal', 5
  ), 
  (
    'Introdução à Psicologia Contemporânea', 
    '1978-08-09', 'Antonio Gomes Penna', 
    'Livro sobre a constituição da psicologia moderna.', 
    5
  );
  
INSERT INTO Pesquisador (nome, afiliacao, matricula) 
VALUES 
  (
    'Camila Rocha da Silva', 'UFRJ', 
    '1236987'
  ), 
  (
    'Maria Luiza Oliveira dos Santos', 
    'UFRRJ', '9865321'
  ), 
  (
    'Felipe Cavalcante de Souza', 'UFPR', 
    '2301478'
  ), 
  (
    'Bianca Gonçalves Lima', 'UERJ', 
    '7453200'
  ), 
  (
    'Mariana Almeida Araújo', 'UFRS', 
    '3698745'
  );

INSERT INTO Pesquisador_Acervo (
  pesquisador_matricula, acervo_id
) 
VALUES 
  ('1236987', 1), 
  ('9865321', 1), 
  ('2301478', 2), 
  ('7453200', 2), 
  ('3698745', 3), 
  ('1236987', 3), 
  ('2301478', 4), 
  ('3698745', 4), 
  ('7453200', 5), 
  ('9865321', 5);

-- Função para consultar a data que preferir
CREATE 
OR REPLACE FUNCTION obter_documentos_por_intervalo(data_inicio DATE, data_fim DATE) RETURNS TABLE (
  Titulo TEXT, Datas DATE, Autor TEXT, 
  Conteudo TEXT, Acervo_Tema TEXT, Pesquisador_Nome TEXT
) AS $$ BEGIN RETURN QUERY 
SELECT 
  d.Titulo :: TEXT, 
  d.Datas, 
  d.Autor :: TEXT, 
  d.Conteudo :: TEXT, 
  a.tema :: TEXT AS Acervo_Tema, 
  STRING_AGG(p.nome, ', '):: TEXT AS Pesquisador_Nome 
FROM 
  Documento d 
  JOIN Acervo a ON d.acervo_id = a.id 
  JOIN Pesquisador_Acervo pa ON d.acervo_id = pa.acervo_id 
  JOIN Pesquisador p ON pa.pesquisador_matricula = p.matricula 
WHERE 
  d.Datas BETWEEN data_inicio 
  AND data_fim 
GROUP BY 
  d.Titulo, 
  d.Datas, 
  d.Autor, 
  d.Conteudo, 
  a.tema;
END;
$$ LANGUAGE plpgsql;

-- Usando a função
SELECT 
  * 
FROM 
  obter_documentos_por_intervalo('1970-01-01', '1979-12-31');

-- Visões
CREATE VIEW documentoscelso AS 
SELECT 
  d.Titulo, 
  d.Datas, 
  d.Conteudo 
FROM 
  Documento d 
WHERE 
  d.acervo_id = 2 
ORDER BY 
  d.Datas;

SELECT 
  * 
FROM 
  documentoscelso;

CREATE VIEW pesquisadoresemilio AS 
SELECT 
  p.nome, 
  pa.pesquisador_matricula 
FROM 
  pesquisador p 
  JOIN pesquisador_acervo pa ON pa.pesquisador_matricula = p.matricula 
WHERE 
  pa.acervo_id = 1;
  
SELECT 
  * 
FROM 
  pesquisadoresemilio;

-- Funções
CREATE 
OR REPLACE FUNCTION obter_documentos_por_autor(
  autor_param VARCHAR(50)
) RETURNS TABLE (
  titulo TEXT, datas DATE, conteudo TEXT, 
  acervo_id INT
) AS $$ BEGIN RETURN QUERY 
SELECT 
  documento.titulo :: TEXT, 
  documento.datas, 
  documento.conteudo :: TEXT, 
  documento.acervo_id 
FROM 
  documento 
WHERE 
  autor_param = autor 
ORDER BY 
  datas;
END;
$$ LANGUAGE plpgsql;

SELECT 
  * 
FROM 
  obter_documentos_por_autor('Celso Pereira de Sá');
