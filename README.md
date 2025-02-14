# Ementas

## Banco de Dados I
- Arquitetura de Sistemas Gerenciador de Banco de Dados (SGBD)
- Projeto de Banco de Dados: modelos de entidades e relacionamentos e suas extensões, modelo de dados relacional, algoritmos de decomposição e formas normais
- Controle de restrições de integridade
- Noções básicas de transações
- Linguagens de consultas: Cálculo relacional, álgebra relacional e SQL, Visões e índices secundários

## Banco de Dados II
- Conceitos avançados em Banco de Dados
- Modelos relacional estendido e orientado a objetos
- Processamento de transações, protocolos de controle de concorrência, mecanismos de recuperação, sistemas de autorização e segurança
- Processamento e otimização de consultas, organização física e índices, ambiente C/S, triggers e processamentos armazenados


### Entrar no PostgreSQL via terminal 
```bash
sudo -i -u postgres
psql
```

### Criar e entrar num Banco de Dados
CRIAR
```bash
create database (nomedobanco)
```
ENTRAR
```bash
sudo -i -u postgres
psql (nomedobanco)
```

### Bom editor online
https://sqliteonline.com/

### Adicionar chave primária ou estrangeira à tabela
```bash
alter table cliente
add constraint cp_cliente primary key (cpf);

alter table telefone
add constraint cs_telefone foreign key(id_cliente) references cliente(id_cliente);
```

### Adicionar coluna à tabela
```bash
alter table TABELA
add COLUNA int;
```

### Exemplo básico de junção
```bash
select * from 
cliente cl join telefone te ON cl.id_cliente = te.id_cliente
where cl.id_cliente=1;
```
