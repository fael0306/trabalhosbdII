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
  
CREATE VIEW documentos_por_pesquisadores AS 
SELECT 
  titulo, 
  nomes_pesquisadores 
FROM 
  (
    SELECT 
      d.titulo, 
      d.conteudo, 
      STRING_AGG(p.nome, ', ') AS nomes_pesquisadores 
    FROM 
      documento d 
      JOIN pesquisador_acervo pa ON d.acervo_id = pa.acervo_id 
      JOIN pesquisador p ON pa.pesquisador_matricula = p.matricula 
    GROUP BY 
      d.titulo, 
      d.conteudo
  ) sub 
ORDER BY 
  titulo;
  
SELECT 
  * 
FROM 
  documentos_por_pesquisadores;
  
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
  
CREATE 
OR REPLACE FUNCTION obter_pesquisadores_por_acervoid(id_param INT) RETURNS TABLE(
  nome VARCHAR(50), 
  tema VARCHAR(50)
) AS $$ BEGIN RETURN QUERY 
SELECT 
  pp.nome, 
  aa.tema 
FROM 
  pesquisador pp 
  JOIN pesquisador_acervo pa ON pp.matricula = pa.pesquisador_matricula 
  JOIN acervo aa ON pa.acervo_id = aa.id 
WHERE 
  pa.acervo_id = id_param 
ORDER BY 
  pp.nome;
END;
$$ LANGUAGE plpgsql;

SELECT 
  * 
FROM 
  obter_pesquisadores_por_acervoid(1);
  
CREATE 
OR REPLACE FUNCTION obter_quantidade_documentos_por_tema(
  temaparam VARCHAR(50)
) RETURNS INT AS $$ BEGIN RETURN(
  SELECT 
    COUNT(d.id) 
  FROM 
    documento d 
    JOIN acervo aa ON aa.id = d.acervo_id 
  WHERE 
    temaparam = aa.tema
);
END;
$$ LANGUAGE plpgsql;

SELECT 
  * 
FROM 
  obter_quantidade_documentos_por_tema('Isabel Adrados');
  
-- Triggers
CREATE 
OR REPLACE FUNCTION validar_data() RETURNS TRIGGER AS $$ BEGIN IF NEW.datas > CURRENT_DATE THEN RAISE EXCEPTION 'A data do documento não pode ser posterior à data atual.';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER verificar_data BEFORE INSERT 
OR 
UPDATE 
  ON documento FOR EACH ROW EXECUTE FUNCTION validar_data();
  
CREATE 
OR REPLACE FUNCTION impedir_exclusao_acervo() RETURNS TRIGGER AS $$ BEGIN IF EXISTS (
  SELECT 
    1 
  FROM 
    documento 
  WHERE 
    documento.acervo_id = OLD.id
) THEN RAISE EXCEPTION 'Um acervo com documentos associados não pode ser excluído.';
END IF;
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE 
OR REPLACE TRIGGER verificar_acervo BEFORE DELETE ON acervo FOR EACH ROW EXECUTE FUNCTION impedir_exclusao_acervo();

CREATE TABLE log_atualizacao(
  iddocumento INT, 
  tituloantigo VARCHAR(50), 
  titulonovo VARCHAR(50), 
  datadamodificacao DATE
);

CREATE 
OR REPLACE FUNCTION registro_atualiza() RETURNS TRIGGER AS $$ BEGIN IF NEW.titulo <> OLD.titulo 
AND NEW.conteudo = OLD.conteudo THEN INSERT INTO log_atualizacao(
  iddocumento, tituloantigo, titulonovo, 
  datadamodificacao
) 
VALUES 
  (
    OLD.id, OLD.titulo, NEW.titulo, CURRENT_DATE
  );
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- BEFORE, pois caso dê algum problema no UPDATE, as mudanças não serão acionadas.
CREATE 
or REPLACE TRIGGER atualiza_registro 
BEFORE 
UPDATE 
  ON documento FOR EACH ROW EXECUTE FUNCTION registro_atualiza();
  
UPDATE 
  documento 
SET 
  titulo = 'Novo Título', 
  conteudo = 'Visão geral da psicanálise freudiana.' 
WHERE 
  id = 1;

-- Plano de execução da consulta do cenário de utilização
EXPLAIN VERBOSE
SELECT 
  d.Titulo, 
  d.Datas, 
  d.Autor, 
  d.Conteudo, 
  a.tema AS Acervo_Tema, 
  STRING_AGG(p.nome, ', ') AS Pesquisador_Nome 
FROM 
  Documento d 
  JOIN Acervo a ON d.acervo_id = a.id 
  JOIN Pesquisador_Acervo pa ON d.acervo_id = pa.acervo_id 
  JOIN Pesquisador p ON pa.pesquisador_matricula = p.matricula 
WHERE 
  d.Datas BETWEEN '1970-01-01' 
  AND '1979-12-31' 
GROUP BY 
  d.Titulo, 
  d.Datas, 
  d.Autor, 
  d.Conteudo, 
  a.tema;

/* SAÍDA
                                                                QUERY PLAN                                                                
------------------------------------------------------------------------------------------------------------------------------------------
 GroupAggregate  (cost=29.18..29.30 rows=4 width=522)
   Output: d.titulo, d.datas, d.autor, d.conteudo, a.tema, string_agg((p.nome)::text, ', '::text)
   Group Key: d.titulo, d.datas, d.autor, d.conteudo, a.tema
   ->  Sort  (cost=29.18..29.19 rows=4 width=608)
         Output: d.titulo, d.datas, d.autor, d.conteudo, a.tema, p.nome
         Sort Key: d.titulo, d.datas, d.autor, d.conteudo, a.tema
         ->  Nested Loop  (cost=0.44..29.14 rows=4 width=608)
               Output: d.titulo, d.datas, d.autor, d.conteudo, a.tema, p.nome
               Inner Unique: true
               ->  Nested Loop  (cost=0.29..28.23 rows=4 width=568)
                     Output: d.titulo, d.datas, d.autor, d.conteudo, a.tema, pa.pesquisador_matricula
                     Join Filter: (d.acervo_id = pa.acervo_id)
                     ->  Nested Loop  (cost=0.14..22.16 rows=1 width=498)
                           Output: d.titulo, d.datas, d.autor, d.conteudo, d.acervo_id, a.tema, a.id
                           Inner Unique: true
                           ->  Seq Scan on public.documento d  (cost=0.00..13.90 rows=1 width=276)
                                 Output: d.titulo, d.datas, d.autor, d.conteudo, d.acervo_id
                                 Filter: ((d.datas >= '1970-01-01'::date) AND (d.datas <= '1979-12-31'::date))
                           ->  Index Scan using acervo_pkey on public.acervo a  (cost=0.14..8.16 rows=1 width=222)
                                 Output: a.id, a.tema, a.instituicao
                                 Index Cond: (a.id = d.acervo_id)
                     ->  Index Only Scan using pesquisador_acervo_pkey on public.pesquisador_acervo pa  (cost=0.15..6.02 rows=4 width=82)
                           Output: pa.pesquisador_matricula, pa.acervo_id
                           Index Cond: (pa.acervo_id = a.id)
               ->  Index Scan using pesquisador_pkey on public.pesquisador p  (cost=0.14..0.23 rows=1 width=196)
                     Output: p.nome, p.afiliacao, p.matricula
                     Index Cond: ((p.matricula)::text = (pa.pesquisador_matricula)::text)
*/
