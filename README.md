## Ementas

### Banco de Dados I
- Arquitetura de Sistemas Gerenciador de Banco de Dados (SGBD)
- Projeto de Banco de Dados:
  - Modelos de entidades e relacionamentos e suas extensões
  - Modelo de dados relacional
  - Algoritmos de decomposição e formas normais
- Controle de restrições de integridade
- Noções básicas de transações
- Linguagens de consultas:
  - Cálculo relacional
  - Álgebra relacional e SQL
  - Visões e índices secundários

### Banco de Dados II
- Conceitos avançados em Banco de Dados
- Modelos relacional estendido e orientado a objetos
- Processamento de transações:
  - Protocolos de controle de concorrência
  - Mecanismos de recuperação
  - Sistemas de autorização e segurança
- Processamento e otimização de consultas:
  - Organização física e índices
  - Ambiente Cliente/Servidor
  - Triggers e procedimentos armazenados

## Comandos Úteis

### Acessar o PostgreSQL via Terminal
```bash
sudo -i -u postgres
psql
```

### Criar e Acessar um Banco de Dados
Criar:
```sql
CREATE DATABASE nomedobanco;
```
Acessar:
```bash
sudo -i -u postgres
psql nomedobanco
```

### Editor SQL Online Recomendado
[SQLite Online](https://sqliteonline.com/)

### Alterações em Tabelas

#### Adicionar Chave Primária ou Estrangeira
```sql
ALTER TABLE cliente
ADD CONSTRAINT cp_cliente PRIMARY KEY (cpf);

ALTER TABLE telefone
ADD CONSTRAINT cs_telefone FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
```

#### Adicionar Coluna à Tabela
```sql
ALTER TABLE tabela
ADD coluna INT;
```

#### Mudando nome e tipo da coluna
```sql
ALTER TABLE produto 
RENAME COLUMN preco TO valor_unitario;
```
```sql
ALTER TABLE produto 
ALTER COLUMN valor_unitario 
SET DATA TYPE FLOAT USING valor_unitario::FLOAT;
```

### Atualizar Dados (UPDATE)
```sql
UPDATE cliente
SET telefone = '12345678'
WHERE cpf = '988638273';
```

## Exemplos de Junções (JOIN)

#### Junção Simples
```sql
SELECT * FROM cliente cl
JOIN telefone te ON cl.id_cliente = te.id_cliente
WHERE cl.id_cliente = 1;
```

#### Selecionando Campos Específicos
```sql
SELECT nome, email, numero FROM cliente ce
JOIN telefone te ON ce.id_cliente = te.id_cliente
WHERE ce.id_cliente = 1;
```

#### Junção com Múltiplas Tabelas
```sql
SELECT nome, sexo, bairro, uf, tipo, numero FROM cliente ce
JOIN endereco en ON ce.id_cliente = en.id_cliente
JOIN telefone te ON te.id_cliente = ce.id_cliente;
```

### Subindo dados de CSV (Obs: a tabela precisa existir)
```sql
\copy nome_da_tabela FROM '\caminho\do\arquivo\tabela.csv' DELIMITER ',' CSV HEADER;
```

### Somando e fazendo média (separado e junto)
```sql
SELECT SUM(valor_unitario) AS soma_vu FROM produto
SELECT SUM(valor_unitario)/COUNT(valor_unitario) AS media
FROM produto;

SELECT SUM(valor_unitario) AS soma_vu, SUM(valor_unitario)/COUNT(valor_unitario) AS media 
FROM produto;
```

### Fazendo contagem dupla
```sql
SELECT 
    (SELECT COUNT(*) FROM cliente WHERE sexo = 'F') AS cont_mulheres,
    (SELECT COUNT(*) FROM cliente WHERE sexo = 'M') AS cont_homens;
```

### Mostrar os nomes de todas as tabelas (PostgreSQL)
```sql
SELECT tablename as Tabelas
FROM pg_tables
WHERE schemaname = 'public';
```

### Mostrar tipos de dados de uma tabela
```sql
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'aluno'
AND table_schema = 'public';
```

### Agrupando: o agrupamento é sempre pelo que NÃO ESTÁ com uma função (nesse caso é "Bairro"). 
Obs: Só foi necessário colocar o _cl_ antes de id_cliente porque também existe uma coluna com mesmo nome na tabela Endereço.
```sql
select count(cl.id_cliente), bairro
from cliente cl JOIN endereco en
ON cl.id_cliente=en.id_cliente
where sexo='F'
group by bairro;
```

### Selecionando e modificando valores nulos
```sql
SELECT nome, cpf, coalesce(email,'Desconhecido') as email from cliente
where email is NULL;
```
