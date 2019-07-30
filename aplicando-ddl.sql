--Faça uma VIEW que retorne o nome do funcionário, o id, data de entrada na empresa e salário, 
--de todos os funcionários com o cargo de TI, com o nome vw_programadores. 
--As colunas dessa view devem ter o mesmo nome dos representados nessa questão.
CREATE VIEW vw_programadores AS
  SELECT employee_id "ID", first_name "Nome", hire_date "Data de Admissão", salary "Salário"
    FROM employees
   WHERE job_id = 'IT_PROG';
   
--Crie uma view que retorne o nome do cargo, o salário máximo, 
--salário mínimo, a soma dos salários e a média de salário dos funcionário. 
--Sendo que o nome do cargo deve ser retornado da tabela JOBs.
CREATE VIEW vw_func AS
      SELECT j.job_title AS "Cargo", 
             MAX(e.salary) AS "Maior salário", 
             MIN(e.salary) AS "Menor salário", 
             SUM(e.salary) AS "Soma dos salários", 
             AVG(e.salary) AS "Media salarial"
        FROM employees e
        JOIN jobs j
          ON (e.job_id = j.job_id)
    GROUP BY j.job_title
    ORDER BY j.job_title;

--Cria uma SEQUENCE que comece em 500, seja incrementada de 1 em 1, tenha o valor máximo de 9999 o nome dessa SEQUENCE deve ser sq_teste_employes
CREATE SEQUENCE sq_teste_employes
    MINVALUE 1
    MAXVALUE 9999
    INCREMENT BY 1
    START WITH 500
    NOCICLE;

--Crie um sinônimo tabela jobs com o nome JB
CREATE SYNONYM JR
           FOR jobs;
	
--Crie um índice na coluna hire_date da tabela employees
CREATE INDEX data_contratacao
          ON employees(hire_date)
		  
		  
		  