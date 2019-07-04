--Crie a tabela EMPLOYEES2 com base na estrutura da tabela EMPLOYEES. Inclua somente as colunas EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY e DEPARTMENT_ID. 
--Nomeie as colunas da nova tabela como ID, FIRST_NAME, LAST_NAME, SALARY e DEPT_ID, respectivamente.

DESC employees;

CREATE TABLE employees2(
 id number(6) primary key,
 first_name varchar2(20) not null,
 last_name varchar2(25),
 salary number(8,2) not null,
 dept_id number(4),
 foreign key(dept_id) references departments(department_id)
);

--Crie a tabela teste_dept com duas colunas com os nomes ID e NOME, a coluna ID vai ser a chave primária da tabela, ela também deve ser do tipo NUMBER com o tamanho de 10, já a coluna NOME vai ser um --VARCHAR2 com um valor default usando a função USER e o seu tamanho vai ser de 50.

CREATE TABLE teste_dept(
 id number(10) primary key,
 nome varchar2(50) default 'USER'
);

--Renomei a coluna NOME para NOME_USUARIO
ALTER TABLE teste_dept
RENAME COLUMN nome TO nome_usuario

DESC teste_dept

--Cria a coluna DATA_USUARIO como do tipo TIMESTAMP, esta coluna não pode ser nula.
ALTER TABLE teste_dept
ADD data_usuario timestamp with local time zone NOT NULL

--Elimine a coluna DATA_USUARIO
ALTER TABLE teste_dept
DROP COLUMN data_usuario

--Altere o nome da tabela teste_dept para dep
ALTER TABLE teste_dept
RENAME TO dep

DESC dep

--Elimine a tabela dep.
DROP TABLE dep;

